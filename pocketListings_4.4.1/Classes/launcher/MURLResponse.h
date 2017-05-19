//
//  MURLResponse.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/29/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MURLRequest;

@protocol MURLResponse <NSObject>
@required

/**
 * Processes the data from a successful request and determines if it is valid.
 *
 * If the data is not valid, return an error. The data will not be cached if there is an error.
 *
 * @param  request    The request this response is bound to.
 * @param  response   The response object, useful for getting the status code.
 * @param  data       The data received from the TTURLRequest.
 * @return NSError if there was an error parsing the data. nil otherwise.
 *
 * @required
 */
- (NSError*)request:(MURLRequest*)request processResponse:(NSHTTPURLResponse*)response
               data:(id)data;

@optional
/**
 * Processes the data from a unsuccessful request to construct a custom NSError object.
 *
 * @param  request    The request this response is bound to.
 * @param  response   The response object, useful for getting the status code.
 * @param  data       The data received from the TTURLRequest.
 * @return NSError to construct for this response.
 *
 * @optional
 */
- (NSError*)request:(MURLRequest*)request processErrorResponse:(NSHTTPURLResponse*)response
               data:(id)data;
@end
