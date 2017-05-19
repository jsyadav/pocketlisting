//
//  MRequestLoader.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/29/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MURLRequestCachePolicy.h"

@class MURLRequestQueue,MURLRequest;

@interface MRequestLoader : NSObject {
    NSString*               _urlPath;
    
    MURLRequestQueue*      _queue;
    
    NSString*               _cacheKey;
    MURLRequestCachePolicy _cachePolicy;
    NSTimeInterval          _cacheExpirationAge;
    
    NSMutableArray*         _requests;
    NSURLConnection*        _connection;
    
    NSHTTPURLResponse*      _response;
    NSMutableData*          _responseData;
    
    /**
     * When load requests fail we'll attempt the request again, as many as 2 times by default.
     */
    int                     _retriesLeft;
}

/**
 * The list of MURLRequests currently attached to this loader.
 */
@property (nonatomic, readonly) NSArray* requests;

/**
 * The common urlPath shared by every request.
 */
@property (nonatomic, readonly) NSString* urlPath;

/**
 * The common cacheKey shared by every request.
 */
@property (nonatomic, readonly) NSString* cacheKey;

/**
 * The common cache policy shared by every request.
 */
@property (nonatomic, readonly) MURLRequestCachePolicy cachePolicy;

/**
 * The common cache expiration age shared by ever request.
 */
@property (nonatomic, readonly) NSTimeInterval cacheExpirationAge;

/**
 * Whether or not any of the requests in this loader are loading.
 */
@property (nonatomic, readonly) BOOL isLoading;

/**
 * Deprecated due to name ambiguity. Use urlPath instead.
 * Remove after May 6, 2010.
 */
@property (nonatomic, readonly) NSString* URL;


- (id)initForRequest:(MURLRequest*)request queue:(MURLRequestQueue*)queue;

/**
 * Duplication is possible due to the use of an NSArray for the request list.
 */
- (void)addRequest:(MURLRequest*)request;
- (void)removeRequest:(MURLRequest*)request;

/**
 * If the loader isn't already active, create the NSURLRequest from the first MURLRequest added
 * to this loader and fire it off.
 */
- (void)load:(NSURL*)URL;

/**
 * As with load:, will create the NSURLRequest from the first MURLRequest added to the loader.
 * Unlike load:, this method will not return until the request has been fully completed.
 *
 * This is useful for threads that need to block while waiting for resources from the net.
 */
- (void)loadSynchronously:(NSURL*)URL;

/**
 * Cancel only the given request.
 *
 * @return NO   If there are no requests left.
 *         YES  If there are any requests left.
 */
- (BOOL)cancel:(MURLRequest*)request;

- (NSError*)processResponse:(NSHTTPURLResponse*)response data:(id)data;
- (void)dispatchError:(NSError*)error;
- (void)dispatchLoaded:(NSDate*)timestamp;
- (void)dispatchAuthenticationChallenge:(NSURLAuthenticationChallenge*)challenge;
- (void)cancel;

@end
