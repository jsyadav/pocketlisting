//
//  MPageControl.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/28/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MStyle;

@interface MPageControl : UIControl {
    NSInteger _numberOfPages;
    NSInteger _currentPage;
    
    NSString* _dotStyle;
    MStyle*  _normalDotStyle;
    MStyle*  _currentDotStyle;
    
    BOOL      _hidesForSinglePage;
}

@property (nonatomic)       NSInteger numberOfPages;
@property (nonatomic)       NSInteger currentPage;
@property (nonatomic, copy) NSString* dotStyle;

/**
 * Set to YES to hide the pagecontrol if only one page is present
 *
 * @default NO
 */
@property (nonatomic)       BOOL      hidesForSinglePage;

@end
