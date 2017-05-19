//
//  MImageView.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/29/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MView.h"
#import "MURLRequestDelegate.h"

@protocol MImageViewDelegate,MURLRequest;

@interface MImageView : MView<MURLRequestDelegate> {
    MURLRequest* _request;
    NSString*     _urlPath;
    UIImage*      _image;
    UIImage*      _defaultImage;
    BOOL          _autoresizesToImage;
    
    id<MImageViewDelegate> _delegate;
}

/**
 * The path of the image. This may be a web path (http://path/to/image.gif) or a local bundle
 * path (bundle://path/to/image.png).
 */
@property (nonatomic, copy) NSString* urlPath;

/**
 * The default image that is displayed until the image has been downloaded. If no urlPath is
 * specified, this image will be displayed indefinitely.
 */
@property (nonatomic, retain) UIImage* defaultImage;

/**
 * The image that is currently being displayed.
 */
@property (nonatomic, retain) UIImage* image;

/**
 * Override the default sizing operation and resize the frame of this view with the size of
 * the image.
 *
 * @default NO
 */
@property (nonatomic) BOOL autoresizesToImage;

/**
 * Is an asynchronous request currently active?
 */
@property (nonatomic, readonly) BOOL isLoading;

/**
 * Has the image been successfully loaded?
 */
@property (nonatomic, readonly) BOOL isLoaded;

/**
 * A delegate that notifies you when the image has started and finished loading.
 */
@property (nonatomic, assign) id<MImageViewDelegate> delegate;

/**
 * Cancel any pending request, remove the image, and redraw the view.
 */
- (void)unsetImage;

/**
 * Force the image to be reloaded. If the image is not in the cache, an asynchronous request is
 * sent off to fetch the image.
 */
- (void)reload;

/**
 * Cancel this image views' active asynchronous requests.
 */
- (void)stopLoading;

/**
 * Called when the image begins loading asynchronously.
 * Overridable method.
 *
 * @protected
 */
- (void)imageViewDidStartLoad;

/**
 * Called when the image finishes loading asynchronously.
 * Overridable method.
 *
 * @protected
 */
- (void)imageViewDidLoadImage:(UIImage*)image;

/**
 * Called when the image failed to load asynchronously.
 * Overridable method.
 *
 * @protected
 */
- (void)imageViewDidFailLoadWithError:(NSError*)error;

@end
