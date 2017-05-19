//
//  MURLRequest.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/29/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MURLRequestCachePolicy.h"

//NSString* const kTTNetworkErrorDomain = @"mtgr8.network";
//NSInteger const kTTNetworkErrorCodeInvalidImage = 100;
//NSString* const kTTErrorResponseDataKey = @"responsedata";

@protocol MURLResponse;

@interface MURLRequest : NSObject {
    NSString*             _urlPath;
    
    NSString*             _httpMethod;
    NSData*               _httpBody;
    NSMutableDictionary*  _parameters;
    NSMutableDictionary*  _headers;
    
    NSString*             _contentType;
    NSStringEncoding      _charsetForMultipart;
    
    NSMutableArray*       _files;
    
    id<MURLResponse>     _response;
    
    MURLRequestCachePolicy _cachePolicy;
    NSTimeInterval          _cacheExpirationAge;
    NSString*               _cacheKey;
    
    NSDate*               _timestamp;
    
    NSInteger             _totalBytesLoaded;
    NSInteger             _totalBytesExpected;
    
    NSTimeInterval        _timeoutInterval;
    
    NSInteger             _totalBytesDownloaded;
    NSInteger             _totalContentLength;
    
    id    _userInfo;
    
    BOOL  _isLoading;
    BOOL  _shouldHandleCookies;
    BOOL  _respondedFromCache;
    BOOL  _filterPasswordLogging;
    BOOL  _multiPartForm;
    
    NSMutableArray* _delegates;
}

/**
 * The URL path to be loaded by the request.
 */
@property (nonatomic, copy) NSString* urlPath;

/**
 * The URL path to be loaded by the request.
 *
 * Deprecated due to name ambiguity. Use urlPath instead.
 * Remove after May 6, 2010.
 */
@property (nonatomic, copy) NSString* URL;

/**
 * The HTTP method to send with the request.
 *
 * @example @"POST"
 * @example @"GET"
 * @example @"PUT"
 * @default nil (equivalent to @"GET")
 */
@property (nonatomic, copy) NSString* httpMethod;

/**
 * An object that handles the response data and may parse and validate it.
 *
 * @see TTURLDataResponse
 * @see TTURLImageResponse
 * @see TTURLXMLResponse
 */
@property (nonatomic, retain) id<MURLResponse> response;

/**
 * The HTTP body to send with the request.
 *
 * If provided, will always be used. Please consider this when using POST/PUT methods: if
 * httpBody is provided, then the POST/PUT data generated from the parameters property will not
 * be used.
 */
@property (nonatomic, retain) NSData* httpBody;

/**
 * The content type of the data in the request.
 *
 * If not provided and httpMethod is POST/PUT, then contentType is @"multipart/form-data".
 */
@property (nonatomic, copy) NSString* contentType;

/**
 * Parameters to use for an HTTP POST/PUT.
 */
@property (nonatomic, readonly) NSMutableDictionary* parameters;

/**
 * Custom HTTP headers.
 */
@property (nonatomic, readonly) NSMutableDictionary* headers;

/**
 * @default MURLRequestCachePolicyDefault
 */
@property (nonatomic) MURLRequestCachePolicy cachePolicy;

/**
 * The maximum age of cached data that can be used as a response.
 *
 * @default TT_DEFAULT_CACHE_EXPIRATION_AGE (1 week)
 */
@property (nonatomic) NSTimeInterval cacheExpirationAge;

/**
 * If no cache key is provided, a unique key is generated from the request data. If the request
 * is a POST/PUT request, then the POST/PUT parameters are also used to generate the cache key.
 *
 * By setting the cacheKey, you may override the default cache key generator with your own.
 */
@property (nonatomic, copy) NSString* cacheKey;

/**
 * A dummy object used to uniquely identify this request object once it's been sent into the fray.
 * Generally TTUserInfo objects are used here.
 *
 * @see TTUserInfo
 */
@property (nonatomic, retain) id userInfo;

@property (nonatomic, retain) NSDate* timestamp;

/**
 * Whether or not the request is currently active.
 */
@property (nonatomic) BOOL isLoading;

/**
 * Decide whether default cookie handling will happen for this request.
 *
 * @param YES if cookies should be sent with and set for this request;
 *        otherwise NO.
 * @discussion The default is YES - in other words, cookies are sent from and
 *             stored to the cookie manager by default.
 *
 * @default YES
 */
@property (nonatomic) BOOL shouldHandleCookies;

/**
 * The number of request body bytes already uploaded by this request.
 */
@property (nonatomic) NSInteger totalBytesLoaded;

/**
 * The total number of request body bytes expected to be uploaded for this request.
 */
@property (nonatomic) NSInteger totalBytesExpected;

/**
 * The number of downloaded bytes from server.
 */
@property (nonatomic) NSInteger totalBytesDownloaded;

/**
 *  The number of content length of request.
 */
@property (nonatomic) NSInteger totalContentLength;

/**
 * The timeout to use for the request.
 *
 * If a negative value is set the request uses
 * the defaultTimeout of the MURLRequestQueue. <b>This differs from behaviour of
 * NSURLRequest.</b> Given a negative timeoutInterval NSURLRequest always fails.
 *
 * You should use the MURLRequestUseQueueTimeout constant to improve
 * code readabillity, instead of negative numbers.
 *
 * The default value is MURLRequestUseQueueTimeout
 *
 * @par from NSURLRequest.h:
 *
 * The timeout interval specifies the limit on the idle
 * interval alloted to a request in the process of loading. The "idle
 * interval" is defined as the period of time that has passed since the
 * last instance of load activity occurred for a request that is in the
 * process of loading. Hence, when an instance of load activity occurs
 * (e.g. bytes are received from the network for a request), the idle
 * interval for a request is reset to 0. If the idle interval ever
 * becomes greater than or equal to the timeout interval, the request
 * is considered to have timed out. This timeout interval is measured
 * in seconds.
 *
 * @see MURLRequestQueue::defaultTimeout
 */
@property (nonatomic) NSTimeInterval timeoutInterval;

/**
 * Whether or not the request was loaded from the cache.
 *
 * This is only valid after the request has completed.
 */
@property (nonatomic) BOOL respondedFromCache;

/**
 * Whether parameters named "password" should be suppressed in log messages.
 */
@property (nonatomic, assign) BOOL filterPasswordLogging;

/**
 * Charset to use when creating multipart/form-data data.
 *
 * @default NSUTF8StringEncoding to remain backwards compatible.
 */
@property (nonatomic) NSStringEncoding charsetForMultipart;

/**
 * An array of non-retained objects that receive messages about the progress of the request.
 */
@property (nonatomic, readonly) NSMutableArray* delegates;

/**
 * Determine whether to construct a multipart form or to instead encode the http body as the W3C default
 * of application/x-www-form-urlencoded  
 */
@property (nonatomic, assign) BOOL multiPartForm;

+ (MURLRequest*)request;

+ (MURLRequest*)requestWithURL:(NSString*)URL delegate:(id /*<MURLRequestDelegate>*/)delegate;

- (id)initWithURL:(NSString*)URL delegate:(id /*<MURLRequestDelegate>*/)delegate;

- (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field;

/**
 * Add a file whose data will be posted.
 */
- (void)addFile:(NSData*)data mimeType:(NSString*)mimeType fileName:(NSString*)fileName;

/**
 * Attempt to send a request.
 *
 * If the request can be resolved by the cache, it will happen synchronously.  Otherwise,
 * the request will respond to its delegate asynchronously.
 *
 * @return YES if the request was loaded synchronously from the cache.
 */
- (BOOL)send;

/**
 * Attempt to send a synchronous request.
 *
 * The request will happen synchronously, regardless of whether the data is being grabbed from
 * the network or from the cache.
 *
 * @return YES if the request was loaded from the cache.
 */
- (BOOL)sendSynchronously;

/**
 * Cancel the request.
 *
 * If there are multiple requests going to the same URL as this request, the others will
 * not be cancelled.
 */
- (void)cancel;

- (NSURLRequest*)createNSURLRequest;

@end
