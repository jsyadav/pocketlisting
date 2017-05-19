//
//  MButton.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/29/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MStyleDelegate.h"

@protocol  MImageViewDelegate;

@interface MButton  : UIControl <MStyleDelegate> {
    NSMutableDictionary*  _content;
    UIFont*               _font;
    BOOL                  _isVertical;
    
    id<MImageViewDelegate> _imageDelegate;
}

@property (nonatomic, retain) UIFont* font;
@property (nonatomic)         BOOL    isVertical;

// This must be set before you call setImage:
@property (nonatomic, assign) id<MImageViewDelegate> imageDelegate;

+ (MButton*)buttonWithStyle:(NSString*)selector;
+ (MButton*)buttonWithStyle:(NSString*)selector title:(NSString*)title;

- (NSString*)titleForState:(UIControlState)state;
- (void)setTitle:(NSString*)title forState:(UIControlState)state;

- (NSString*)imageForState:(UIControlState)state;
- (void)setImage:(NSString*)imageURL forState:(UIControlState)state;

- (MStyle*)styleForState:(UIControlState)state;
- (void)setStyle:(MStyle*)style forState:(UIControlState)state;

/**
 * Sets the styles for all control states using a single style selector.
 *
 * The method for the selector must accept a single argument for the control state.  It will
 * be called to return a style for each of the different control states.
 */
- (void)setStylesWithSelector:(NSString*)selector;

- (void)suspendLoadingImages:(BOOL)suspended;

- (CGRect)rectForImage;

@end
