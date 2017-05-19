//
//  MURLRequestQueue.m
//  MLauncher
//
//  Created by Developer mTgr8 on 10/29/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MURLRequestQueue.h"
#import "MURLCache.h"
#import "MURLRequest.h"
#import "MURLRequestDelegate.h"
#import "MRequestLoader.h"
#import "MCorePreprocessorMacros.h"


 const NSTimeInterval kFlushDelay = 0.3;
 const NSTimeInterval kTimeout = 300.0;
 const NSInteger kMaxConcurrentLoads = 5;
 NSUInteger kDefaultMaxContentLength = 150000;

static MURLRequestQueue* gMainQueue = nil;


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation MURLRequestQueue

@synthesize maxContentLength        = _maxContentLength;
@synthesize userAgent               = _userAgent;
@synthesize suspended               = _suspended;
@synthesize imageCompressionQuality = _imageCompressionQuality;
@synthesize defaultTimeout          = _defaultTimeout;


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MURLRequestQueue*)mainQueue {
    if (!gMainQueue) {
        gMainQueue = [[MURLRequestQueue alloc] init];
    }
    return gMainQueue;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (void)setMainQueue:(MURLRequestQueue*)queue {
    if (gMainQueue != queue) {
        [gMainQueue release];
        gMainQueue = [queue retain];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)init {
	self = [super init];
    if (self) {
        _loaders = [[NSMutableDictionary alloc] init];
        _loaderQueue = [[NSMutableArray alloc] init];
        _maxContentLength = kDefaultMaxContentLength;
        _imageCompressionQuality = 0.75;
        _defaultTimeout = kTimeout;
    }
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
    [_loaderQueueTimer invalidate];
    TT_RELEASE_SAFELY(_loaders);
    TT_RELEASE_SAFELY(_loaderQueue);
    TT_RELEASE_SAFELY(_userAgent);
    [super dealloc];
}

NSBundle* GetDefaultBundle() {
    return [NSBundle mainBundle];
}

- (NSString*) pathForBundleResource:(NSString*) relativePath {
    NSString* resourcePath = [GetDefaultBundle() resourcePath];
    return [resourcePath stringByAppendingPathComponent:relativePath];
}

- (NSString*) pathForDocumentsResource:(NSString*) relativePath {
    static NSString* documentsPath = nil;
    if (nil == documentsPath) {
        NSArray* dirs = NSSearchPathForDirectoriesInDomains(
                                                            NSDocumentDirectory, NSUserDomainMask, YES);
        documentsPath = [[dirs objectAtIndex:0] retain];
    }
    return [documentsPath stringByAppendingPathComponent:relativePath];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
/**
 * TODO (jverkoey May 3, 2010): Clean up this redundant code.
 */
- (BOOL)dataExistsInBundle:(NSString*)URL {
    NSString* path = [self pathForBundleResource:[URL substringFromIndex:9]];
    NSFileManager* fm = [NSFileManager defaultManager];
    return [fm fileExistsAtPath:path];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)dataExistsInDocuments:(NSString*)URL {
    NSString* path = [self pathForDocumentsResource:[URL substringFromIndex:12]];
    NSFileManager* fm = [NSFileManager defaultManager];
    return [fm fileExistsAtPath:path];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSData*)loadFromBundle:(NSString*)URL error:(NSError**)error {
    NSString* path = [self pathForBundleResource:[URL substringFromIndex:9]];
    NSFileManager* fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:path]) {
        return [NSData dataWithContentsOfFile:path];
        
    } else if (error) {
        *error = [NSError errorWithDomain:NSCocoaErrorDomain
                                     code:NSFileReadNoSuchFileError userInfo:nil];
    }
    return nil;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSData*)loadFromDocuments:(NSString*)URL error:(NSError**)error {
    NSString* path = [self pathForDocumentsResource:[URL substringFromIndex:12]];
    NSFileManager* fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:path]) {
        return [NSData dataWithContentsOfFile:path];
        
    } else if (error) {
        *error = [NSError errorWithDomain:NSCocoaErrorDomain
                                     code:NSFileReadNoSuchFileError userInfo:nil];
    }
    return nil;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)loadFromCache: (NSString*)URL
             cacheKey: (NSString*)cacheKey
              expires: (NSTimeInterval)expirationAge
             fromDisk: (BOOL)fromDisk
                 data: (id*)data
                error: (NSError**)error
            timestamp: (NSDate**)timestamp {
    
    if (nil == data) {
        return NO;
    }
    
    UIImage* image = [[MURLCache sharedCache] imageForURL:URL fromDisk:fromDisk];
    
    if (nil != image) {
        *data = image;
        return YES;
        
    } else if (fromDisk) {
        if (TTIsBundleURL(URL)) {
            *data = [self loadFromBundle:URL error:error];
            return YES;
            
        } else if (TTIsDocumentsURL(URL)) {
            *data = [self loadFromDocuments:URL error:error];
            return YES;
            
        } else {
            *data = [[MURLCache sharedCache] dataForKey:cacheKey expires:expirationAge
                                               timestamp:timestamp];
            if (*data) {
                return YES;
            }
        }
    }
    
    return NO;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)cacheDataExists: (NSString*)URL
               cacheKey: (NSString*)cacheKey
                expires: (NSTimeInterval)expirationAge
               fromDisk: (BOOL)fromDisk {
    BOOL hasData = [[MURLCache sharedCache] hasImageForURL:URL fromDisk:fromDisk];
    
    if (!hasData && fromDisk) {
        if (TTIsBundleURL(URL)) {
            hasData = [self dataExistsInBundle:URL];
            
        } else if (TTIsDocumentsURL(URL)) {
            hasData = [self dataExistsInDocuments:URL];
            
        } else {
            hasData = [[MURLCache sharedCache] hasDataForKey:cacheKey expires:expirationAge];
        }
    }
    
    return hasData;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)loadRequestFromCache:(MURLRequest*)request {
    if (!request.cacheKey) {
        request.cacheKey = [[MURLCache sharedCache] keyForURL:request.urlPath];
    }
    
    if (IS_MASK_SET(request.cachePolicy, MURLRequestCachePolicyEtag)) {
        // Etags always make the request. The request headers will then include the etag.
        // - If there is new data, server returns 200 with data.
        // - Otherwise, returns a 304, with empty request body.
        return NO;
        
    } else if (request.cachePolicy & (MURLRequestCachePolicyDisk|MURLRequestCachePolicyMemory)) {
        id data = nil;
        NSDate* timestamp = nil;
        NSError* error = nil;
        
        if ([self loadFromCache:request.urlPath cacheKey:request.cacheKey
                        expires:request.cacheExpirationAge
                       fromDisk:!_suspended && (request.cachePolicy & MURLRequestCachePolicyDisk)
                           data:&data error:&error timestamp:&timestamp]) {
            request.isLoading = NO;
            
            if (!error) {
                error = [request.response request:request processResponse:nil data:data];
            }
            
            if (error) {
                for (id<MURLRequestDelegate> delegate in request.delegates) {
                    if ([delegate respondsToSelector:@selector(request:didFailLoadWithError:)]) {
                        [delegate request:request didFailLoadWithError:error];
                    }
                }
                
            } else {
                request.timestamp = timestamp ? timestamp : [NSDate date];
                request.respondedFromCache = YES;
                
                for (id<MURLRequestDelegate> delegate in request.delegates) {
                    if ([delegate respondsToSelector:@selector(requestDidFinishLoad:)]) {
                        [delegate requestDidFinishLoad:request];
                    }
                }
            }
            
            return YES;
        }
    }
    
    return NO;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)executeLoader:(MRequestLoader*)loader {
    id data = nil;
    NSDate* timestamp = nil;
    NSError* error = nil;
    
    if ((loader.cachePolicy & (MURLRequestCachePolicyDisk|MURLRequestCachePolicyMemory))
        && [self loadFromCache:loader.urlPath cacheKey:loader.cacheKey
                       expires:loader.cacheExpirationAge
                      fromDisk:loader.cachePolicy & MURLRequestCachePolicyDisk
                          data:&data error:&error timestamp:&timestamp]) {
            [_loaders removeObjectForKey:loader.cacheKey];
            
            if (!error) {
                error = [loader processResponse:nil data:data];
            }
            if (error) {
                [loader dispatchError:error];
                
            } else {
                [loader dispatchLoaded:timestamp];
            }
            
        } else {
            ++_totalLoading;
            [loader load:[NSURL URLWithString:loader.urlPath]];
        }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)loadNextInQueueDelayed {
    if (!_loaderQueueTimer) {
        _loaderQueueTimer = [NSTimer scheduledTimerWithTimeInterval:kFlushDelay target:self
                                                           selector:@selector(loadNextInQueue) userInfo:nil repeats:NO];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)loadNextInQueue {
    _loaderQueueTimer = nil;
    
    for (int i = 0;
         i < kMaxConcurrentLoads && _totalLoading < kMaxConcurrentLoads
         && _loaderQueue.count;
         ++i) {
        MRequestLoader* loader = [[_loaderQueue objectAtIndex:0] retain];
        [_loaderQueue removeObjectAtIndex:0];
        [self executeLoader:loader];
        [loader release];
    }
    
    if (_loaderQueue.count && !_suspended) {
        [self loadNextInQueueDelayed];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)removeLoader:(MRequestLoader*)loader {
    --_totalLoading;
    [_loaders removeObjectForKey:loader.cacheKey];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setSuspended:(BOOL)isSuspended {
    _suspended = isSuspended;
    
    if (!_suspended) {
        [self loadNextInQueue];
        
    } else if (_loaderQueueTimer) {
        [_loaderQueueTimer invalidate];
        _loaderQueueTimer = nil;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)sendRequest:(MURLRequest*)request {
    if ([self loadRequestFromCache:request]) {
        return YES;
    }
    
    for (id<MURLRequestDelegate> delegate in request.delegates) {
        if ([delegate respondsToSelector:@selector(requestDidStartLoad:)]) {
            [delegate requestDidStartLoad:request];
        }
    }
    
    // If the url is empty, fail.
    if (!request.urlPath.length) {
        NSError* error = [NSError errorWithDomain:NSURLErrorDomain code:NSURLErrorBadURL userInfo:nil];
        for (id<MURLRequestDelegate> delegate in request.delegates) {
            if ([delegate respondsToSelector:@selector(request:didFailLoadWithError:)]) {
                [delegate request:request didFailLoadWithError:error];
            }
        }
        return NO;
    }
    
    request.isLoading = YES;
    
    MRequestLoader* loader = nil;
    
    // If we're not POSTing or PUTting data, let's see if we can jump on an existing request.
    if (![request.httpMethod isEqualToString:@"POST"]
        && ![request.httpMethod isEqualToString:@"PUT"]) {
        // Next, see if there is an active loader for the URL and if so join that bandwagon.
        loader = [_loaders objectForKey:request.cacheKey];
        if (loader) {
            [loader addRequest:request];
            return NO;
        }
    }
    
    // Finally, create a new loader and hit the network (unless we are suspended)
    loader = [[MRequestLoader alloc] initForRequest:request queue:self];
    [_loaders setObject:loader forKey:request.cacheKey];
    if (_suspended || _totalLoading == kMaxConcurrentLoads) {
        [_loaderQueue addObject:loader];
        
    } else {
        ++_totalLoading;
        [loader load:[NSURL URLWithString:request.urlPath]];
    }
    [loader release];
    
    return NO;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)sendSynchronousRequest:(MURLRequest*)request {
    if ([self loadRequestFromCache:request]) {
        return YES;
    }
    
    for (id<MURLRequestDelegate> delegate in request.delegates) {
        if ([delegate respondsToSelector:@selector(requestDidStartLoad:)]) {
            [delegate requestDidStartLoad:request];
        }
    }
    
    if (!request.urlPath.length) {
        NSError* error = [NSError errorWithDomain:NSURLErrorDomain code:NSURLErrorBadURL userInfo:nil];
        for (id<MURLRequestDelegate> delegate in request.delegates) {
            if ([delegate respondsToSelector:@selector(request:didFailLoadWithError:)]) {
                [delegate request:request didFailLoadWithError:error];
            }
        }
        return NO;
    }
    
    request.isLoading = YES;
    
    // Finally, create a new loader and hit the network (unless we are suspended)
    MRequestLoader* loader = [[MRequestLoader alloc] initForRequest:request queue:self];
    
    // Should be decremented eventually by loadSynchronously
    ++_totalLoading;
    
    [loader loadSynchronously:[NSURL URLWithString:request.urlPath]];
    TT_RELEASE_SAFELY(loader);
    
    return NO;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)cancelRequest:(MURLRequest*)request {
    if (request) {
        MRequestLoader* loader = [_loaders objectForKey:request.cacheKey];
        if (loader) {
            [loader retain];
            if (![loader cancel:request]) {
                [_loaderQueue removeObject:loader];
            }
            [loader release];
        }
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)cancelRequestsWithDelegate:(id)delegate {
    NSMutableArray* requestsToCancel = nil;
    
    for (MRequestLoader* loader in [_loaders objectEnumerator]) {
        for (MURLRequest* request in loader.requests) {
            for (id<MURLRequestDelegate> requestDelegate in request.delegates) {
                if (delegate == requestDelegate) {
                    if (!requestsToCancel) {
                        requestsToCancel = [NSMutableArray array];
                    }
                    [requestsToCancel addObject:request];
                    break;
                }
            }
            
//            if ([request.userInfo isKindOfClass:[TTUserInfo class]]) {
//                TTUserInfo* userInfo = request.userInfo;
//                if (userInfo.weakRef && userInfo.weakRef == delegate) {
//                    if (!requestsToCancel) {
//                        requestsToCancel = [NSMutableArray array];
//                    }
//                    [requestsToCancel addObject:request];
//                }
//            }
        }
    }
    
    for (MURLRequest* request in requestsToCancel) {
        [self cancelRequest:request];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)cancelAllRequests {
    for (MRequestLoader* loader in [[[_loaders copy] autorelease] objectEnumerator]) {
        [loader cancel];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSURLRequest*)createNSURLRequest:(MURLRequest*)request URL:(NSURL*)URL {
    if (!URL) {
        URL = [NSURL URLWithString:request.urlPath];
    }
    
    NSTimeInterval usedTimeout = request.timeoutInterval;
    
    if (usedTimeout < 0.0) {
        usedTimeout = self.defaultTimeout;
    }
    
    NSMutableURLRequest* URLRequest = [NSMutableURLRequest requestWithURL:URL
                                                              cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                          timeoutInterval:usedTimeout];
    
    if (self.userAgent) {
        [URLRequest setValue:self.userAgent forHTTPHeaderField:@"User-Agent"];
    }
    
    if (request) {
        [URLRequest setHTTPShouldHandleCookies:request.shouldHandleCookies];
        
        NSString* method = request.httpMethod;
        if (method) {
            [URLRequest setHTTPMethod:method];
        }
        
        NSString* contentType = request.contentType;
        if (contentType) {
            [URLRequest setValue:contentType forHTTPHeaderField:@"Content-Type"];
        }
        
        NSData* body = request.httpBody;
        if (body) {
            [URLRequest setHTTPBody:body];
        }
        
        NSDictionary* headers = request.headers;
        for (NSString *key in [headers keyEnumerator]) {
            [URLRequest setValue:[headers objectForKey:key] forHTTPHeaderField:key];
        }
        
        if (![[MURLCache sharedCache] disableDiskCache]
            && IS_MASK_SET(request.cachePolicy, MURLRequestCachePolicyEtag)) {
            NSString* etag = [[MURLCache sharedCache] etagForKey:request.cacheKey];
            
            if (TTIsStringWithAnyText(etag)
                && [self cacheDataExists: request.urlPath
                                cacheKey: request.cacheKey
                                 expires: request.cacheExpirationAge
                                fromDisk: !_suspended
                    && (request.cachePolicy & MURLRequestCachePolicyDisk)]) {
                    // By setting the etag here, we let the server know what the last "version" of the file
                    // was that we saw. If the file has changed since this etag, we'll get data back in our
                    // response. Otherwise we'll get a 304.
                    [URLRequest setValue:etag forHTTPHeaderField:@"If-None-Match"];
                }
        }
    }
    
    return URLRequest;
}


@end


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation MURLRequestQueue (TTRequestLoader)


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)     loader: (MRequestLoader*)loader
    didLoadResponse: (NSHTTPURLResponse*)response
               data: (id)data {
    [loader retain];
    [self removeLoader:loader];
    
    NSError* error = [loader processResponse:response data:data];
    if (error) {
        [loader dispatchError:error];
        
    } else {
        if (!(loader.cachePolicy & MURLRequestCachePolicyNoCache)) {
            
            // Store the etag key if the etag cache policy has been requested.
            if (![[MURLCache sharedCache] disableDiskCache]
                && IS_MASK_SET(loader.cachePolicy, MURLRequestCachePolicyEtag)) {
                NSDictionary* headers = [response allHeaderFields];
                
                // First, try to use the casing as defined by the standard for ETag headers.
                // http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html
                NSString* etag = [headers objectForKey:@"ETag"];
                if (nil == etag) {
                    // Some servers don't use the standard casing (e.g. twitter).
                    etag = [headers objectForKey:@"Etag"];
                }
                
                // Still no etag?
                if (nil == etag) {
//                    TTDWARNING(@"Etag expected, but none found.");
//                    TTDWARNING(@"Here are the headers: %@", headers);
                    
                } else {
                    // At last, we have our etag. Let's cache it.
                    
                    // First, let's pull out the etag key. This is necessary due to some servers who append
                    // information to the etag, such as -gzip for a gzipped request. However, the etag
                    // standard states that etags are defined as a quoted string, and that is all.
                    NSRange firstQuote = [etag rangeOfString:@"\""];
                    NSRange secondQuote = [etag rangeOfString: @"\""
                                                      options: 0
                                                        range: NSMakeRange(firstQuote.location + 1,
                                                                           etag.length
                                                                           - (firstQuote.location + 1))];
                    if (0 == firstQuote.length || 0 == secondQuote.length ||
                        firstQuote.location == secondQuote.location) {
//                        TTDWARNING(@"Invalid etag format. Unable to find a quoted key.");
                        
                    } else {
                        NSRange keyRange;
                        keyRange.location = firstQuote.location;
                        keyRange.length = (secondQuote.location - firstQuote.location) + 1;
                        NSString* etagKey = [etag substringWithRange:keyRange];
                        [[MURLCache sharedCache] storeEtag:etagKey forKey:loader.cacheKey];
                    }
                }
            }
            
            [[MURLCache sharedCache] storeData:data forKey:loader.cacheKey];
        }
        [loader dispatchLoaded:[NSDate date]];
    }
    [loader release];
    
    [self loadNextInQueue];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)               loader:(MRequestLoader*)loader
    didLoadUnmodifiedResponse:(NSHTTPURLResponse*)response {
    [loader retain];
    [self removeLoader:loader];
    
    NSData* data = nil;
    NSError* error = nil;
    NSDate* timestamp = nil;
    if ([self loadFromCache:loader.urlPath cacheKey:loader.cacheKey
                    expires:(1.0 / 0.0)
                   fromDisk:!_suspended && (loader.cachePolicy & MURLRequestCachePolicyDisk)
                       data:&data error:&error timestamp:&timestamp]) {
        
        if (nil == error) {
            error = [loader processResponse:response data:data];
        }
        
        if (nil == error) {
            for (MURLRequest* request in loader.requests) {
                request.respondedFromCache = YES;
            }
            [loader dispatchLoaded:[NSDate date]];
        }
    }
    
    if (nil != error) {
        [loader dispatchError:error];
    }
    
    [loader release];
    
    [self loadNextInQueue];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)                       loader: (MRequestLoader*)loader
    didReceiveAuthenticationChallenge: (NSURLAuthenticationChallenge*) challenge {
    [loader dispatchAuthenticationChallenge:challenge];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)loader:(MRequestLoader*)loader didFailLoadWithError:(NSError*)error {
    [self removeLoader:loader];
    [loader dispatchError:error];
    [self loadNextInQueue];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)loaderDidCancel:(MRequestLoader*)loader wasLoading:(BOOL)wasLoading {
    if (wasLoading) {
        [self removeLoader:loader];
        [self loadNextInQueue];
        
    } else {
        [_loaders removeObjectForKey:loader.cacheKey];
    }
}


@end
