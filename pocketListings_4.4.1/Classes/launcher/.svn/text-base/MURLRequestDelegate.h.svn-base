//
//  MURLRequestDelegate.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/29/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MURLRequest;

@protocol MURLRequestDelegate <NSObject>
@optional

/**
 * The request has begun loading.
 *
 * This method will not be called if the data is loaded immediately from the cache.
 * @see requestDidFinishLoad:
 */
- (void)requestDidStartLoad:(MURLRequest*)request;

/**
 * The request has loaded some more data.
 *
 * Check the totalBytesLoaded and totalBytesExpected properties for details.
 */
- (void)requestDidUploadData:(MURLRequest*)request;

/**
 * The request has loaded data and been processed into a response.
 *
 * If the request is served from the cache, this is the only delegate method that will be called.
 */
- (void)requestDidFinishLoad:(MURLRequest*)request;

/**
 * Allows delegate to handle any authentication challenges.
 */
- (void)request:(MURLRequest*)request
didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge*)challenge;

/**
 * The request failed to load.
 */
- (void)request:(MURLRequest*)request didFailLoadWithError:(NSError*)error;

/**
 * The request was canceled.
 */
- (void)requestDidCancelLoad:(MURLRequest*)request;

@end
