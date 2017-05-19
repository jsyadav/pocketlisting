//
//  MShadowStyle.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/30/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MStyle.h"

@interface MShadowStyle : MStyle {
    UIColor*  _color;
    CGFloat   _blur;
    CGSize    _offset;
}

@property (nonatomic, retain) UIColor*  color;
@property (nonatomic)         CGFloat   blur;
@property (nonatomic)         CGSize    offset;

+ (MShadowStyle*)styleWithColor:(UIColor*)color blur:(CGFloat)blur offset:(CGSize)offset
                            next:(MStyle*)next;

@end
