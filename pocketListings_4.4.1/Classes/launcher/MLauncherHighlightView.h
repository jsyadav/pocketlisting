//
//  MLauncherHighlightView.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/30/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MLauncherView;

@interface MLauncherHighlightView : UIView {
    MLauncherView* _parentView;
    CGRect          _highlightRect;
    CGFloat         _highlightScale;
    UIWindow*       _statusBarCover;
    UILabel*        _textLabel;
}

@property (nonatomic, assign) CGRect          highlightRect;
@property (nonatomic, retain) MLauncherView* parentView;
@property (nonatomic, copy)   NSString*       text;

- (void)appear:(BOOL)animated;

@end
