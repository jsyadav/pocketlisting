//
//  MGlobalNavigatorMetrics.m
//  MLauncher
//
//  Created by Developer mTgr8 on 10/30/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MGlobalNavigatorMetrics.h"
#import "MCorePreprocessorMacros.h"

const CGFloat ttkDefaultRowHeight = 44;

const CGFloat ttkDefaultPortraitToolbarHeight   = 44;
const CGFloat ttkDefaultLandscapeToolbarHeight  = 33;

const CGFloat ttkDefaultPortraitKeyboardHeight      = 216;
const CGFloat ttkDefaultLandscapeKeyboardHeight     = 160;
const CGFloat ttkDefaultPadPortraitKeyboardHeight   = 264;
const CGFloat ttkDefaultPadLandscapeKeyboardHeight  = 352;

const CGFloat ttkGroupedTableCellInset = 9;
const CGFloat ttkGroupedPadTableCellInset = 42;

const CGFloat ttkDefaultTransitionDuration      = 0.3;
const CGFloat ttkDefaultFastTransitionDuration  = 0.2;
const CGFloat ttkDefaultFlipTransitionDuration  = 0.7;

const CGFloat mRounded = -1;

UIInterfaceOrientation MInterfaceOrientation() {
    UIInterfaceOrientation orient = [UIApplication sharedApplication].statusBarOrientation;
//    if (UIDeviceOrientationUnknown == orient) {
//        return [MBaseNavigator globalNavigator].visibleViewController.interfaceOrientation;
//        
//    } else {
        return orient;
//    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
CGRect MScreenBounds() {
    CGRect bounds = [UIScreen mainScreen].bounds;
    if (UIInterfaceOrientationIsLandscape(MInterfaceOrientation())) {
        CGFloat width = bounds.size.width;
        bounds.size.width = bounds.size.height;
        bounds.size.height = width;
    }
    return bounds;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
CGRect MNavigationFrame() {
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    return CGRectMake(0, 0, frame.size.width, frame.size.height - MToolbarHeight());
}


///////////////////////////////////////////////////////////////////////////////////////////////////
CGRect MToolbarNavigationFrame() {
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    return CGRectMake(0, 0, frame.size.width, frame.size.height - MToolbarHeight()*2);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//CGRect MKeyboardNavigationFrame() {
//    return MRectContract(MNavigationFrame(), 0, MKeyboardHeight());
//}


///////////////////////////////////////////////////////////////////////////////////////////////////
CGFloat MStatusHeight() {
    UIInterfaceOrientation orientation = MInterfaceOrientation();
    if (orientation == UIInterfaceOrientationLandscapeLeft) {
        return [UIScreen mainScreen].applicationFrame.origin.x;
        
    } else if (orientation == UIInterfaceOrientationLandscapeRight) {
        return -[UIScreen mainScreen].applicationFrame.origin.x;
        
    } else {
        return [UIScreen mainScreen].applicationFrame.origin.y;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//CGFloat MBarsHeight() {
//    CGRect frame = [UIApplication sharedApplication].statusBarFrame;
//    if (UIInterfaceOrientationIsPortrait(MInterfaceOrientation())) {
//        return frame.size.height + M_ROW_HEIGHT;
//        
//    } else {
//        return frame.size.width + (MIsPad() ? M_ROW_HEIGHT : M_LANDSCAPE_TOOLBAR_HEIGHT);
//    }
//}


///////////////////////////////////////////////////////////////////////////////////////////////////
CGFloat MToolbarHeight() {
    return MToolbarHeightForOrientation(MInterfaceOrientation());
}


///////////////////////////////////////////////////////////////////////////////////////////////////
CGFloat MKeyboardHeight() {
    return MKeyboardHeightForOrientation(MInterfaceOrientation());
}

CGFloat MKeyboardHeightForOrientation(UIInterfaceOrientation orientation) {
//    if (TTIsPad()) {
//        return UIInterfaceOrientationIsPortrait(orientation) ? TT_IPAD_KEYBOARD_HEIGHT
//        : TT_IPAD_LANDSCAPE_KEYBOARD_HEIGHT;
//        
//    } else {
        return UIInterfaceOrientationIsPortrait(orientation) ? TT_KEYBOARD_HEIGHT
        : TT_LANDSCAPE_KEYBOARD_HEIGHT;
//    }
}

CGFloat MToolbarHeightForOrientation(UIInterfaceOrientation orientation) {
    if (UIInterfaceOrientationIsPortrait(orientation) ) {
        return TT_ROW_HEIGHT;
        
    } else {
        return TT_LANDSCAPE_TOOLBAR_HEIGHT;
    }
}
