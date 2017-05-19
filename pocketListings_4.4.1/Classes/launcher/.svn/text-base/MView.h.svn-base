//
//  MView.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/29/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MStyleDelegate.h"

@class MStyle;
@class MLayout;

/**
 * A UIView with an attached style and layout that are used to render and
 * layout the view, respectively. Style and layout are optional.
 */
@interface MView : UIView <MStyleDelegate> {
    MStyle*  _style;
    MLayout* _layout;
}

@property (nonatomic, retain) MStyle*  style;
@property (nonatomic, retain) MLayout* layout;

- (void)drawContent:(CGRect)rect;

@end
