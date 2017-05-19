//
//  MImageViewDelegate.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/29/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class MImageView;

@protocol MImageViewDelegate <NSObject>
@optional

/**
 * Called when the image begins loading asynchronously.
 */
- (void)imageViewDidStartLoad:(MImageView*)imageView;

/**
 * Called when the image finishes loading asynchronously.
 */
- (void)imageView:(MImageView*)imageView didLoadImage:(UIImage*)image;

/**
 * Called when the image failed to load asynchronously.
 * If error is nil then the request was cancelled.
 */
- (void)imageView:(MImageView*)imageView didFailLoadWithError:(NSError*)error;

@end