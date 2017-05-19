//
//  MGlobalNavigatorMetrics.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/30/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 * @return the current orientation of the visible view controller.
 */
UIInterfaceOrientation MInterfaceOrientation();

/**
 * @return the bounds of the screen with device orientation factored in.
 */
CGRect MScreenBounds();

/**
 * @return the application frame below the navigation bar.
 */
CGRect MNavigationFrame();

/**
 * @return the application frame below the navigation bar and above a toolbar.
 */
CGRect MToolbarNavigationFrame();

/**
 * @return the application frame below the navigation bar and above the keyboard.
 */
CGRect MKeyboardNavigationFrame();

/**
 * @return the height of the area containing the status bar and possibly the in-call status bar.
 */
CGFloat MStatusHeight();

/**
 * @return the height of the area containing the status bar and navigation bar.
 */
CGFloat MBarsHeight();

/**
 * @return the height of a toolbar considering the current orientation.
 */
CGFloat MToolbarHeight();

/**
 * @return the height of the keyboard considering the current orientation.
 */
CGFloat MKeyboardHeight();

CGFloat MKeyboardHeightForOrientation(UIInterfaceOrientation orientation);

CGFloat MToolbarHeightForOrientation(UIInterfaceOrientation orientation);

///////////////////////////////////////////////////////////////////////////////////////////////////
// Dimensions of common iPhone OS Views

/**
 * The standard height of a row in a table view controller.
 * @const 44 pixels
 */
extern const CGFloat ttkDefaultRowHeight;

/**
 * The standard height of a toolbar in portrait orientation.
 * @const 44 pixels
 */
extern const CGFloat ttkDefaultPortraitToolbarHeight;

/**
 * The standard height of a toolbar in landscape orientation.
 * @const 33 pixels
 */
extern const CGFloat ttkDefaultLandscapeToolbarHeight;

/**
 * The standard height of the keyboard in portrait orientation.
 * @const 216 pixels
 */
extern const CGFloat ttkDefaultPortraitKeyboardHeight;

/**
 * The standard height of the keyboard in landscape orientation.
 * @const 160 pixels
 */
extern const CGFloat ttkDefaultLandscapeKeyboardHeight;

/**
 * The space between the edge of the screen and the cell edge in grouped table views.
 * @const 10 pixels
 */
extern const CGFloat ttkGroupedTableCellInset;

extern const CGFloat ttkDefaultPadPortraitKeyboardHeight; //   = 264;
extern const CGFloat ttkDefaultPadLandscapeKeyboardHeight; //  = 352;

/**
 * The standard duration length for a transition.
 * @const 0.3 seconds
 */
extern const CGFloat ttkDefaultTransitionDuration;

/**
 * The standard duration length for a fast transition.
 * @const 0.2 seconds
 */
extern const CGFloat ttkDefaultFastTransitionDuration;

/**
 * The standard duration length for a flip transition.
 * @const 0.7 seconds
 */
extern const CGFloat ttkDefaultFlipTransitionDuration;


extern const CGFloat mRounded;

/**
 * Deprecated macros for common constants.
 */
#define M_ROUNDED                    mRounded
#define RD(_RADIUS) (_RADIUS == M_ROUNDED ? round(fh/2) : _RADIUS)

/**
 * Deprecated macros for common constants.
 */
#define TT_ROW_HEIGHT                 ttkDefaultRowHeight
#define TT_TOOLBAR_HEIGHT             ttkDefaultPortraitToolbarHeight
#define TT_LANDSCAPE_TOOLBAR_HEIGHT   ttkDefaultLandscapeToolbarHeight

#define TT_KEYBOARD_HEIGHT                 ttkDefaultPortraitKeyboardHeight
#define TT_LANDSCAPE_KEYBOARD_HEIGHT       ttkDefaultLandscapeKeyboardHeight
#define TT_IPAD_KEYBOARD_HEIGHT            ttkDefaultPadPortraitKeyboardHeight
#define TT_IPAD_LANDSCAPE_KEYBOARD_HEIGHT  ttkDefaultPadLandscapeKeyboardHeight

/**
 * Deprecated macros for common constants.
 */
#define TT_TRANSITION_DURATION      ttkDefaultTransitionDuration
#define TT_FAST_TRANSITION_DURATION ttkDefaultFastTransitionDuration
#define TT_FLIP_TRANSITION_DURATION ttkDefaultFlipTransitionDuration
