//
//  MFourBorderStyle.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/31/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MStyle.h"

@interface MFourBorderStyle : MStyle {
    UIColor*  _top;
    UIColor*  _right;
    UIColor*  _bottom;
    UIColor*  _left;
    CGFloat   _width;
}

@property (nonatomic, retain) UIColor*  top;
@property (nonatomic, retain) UIColor*  right;
@property (nonatomic, retain) UIColor*  bottom;
@property (nonatomic, retain) UIColor*  left;
@property (nonatomic)         CGFloat   width;

+ (MFourBorderStyle*)styleWithTop:(UIColor*)top right:(UIColor*)right bottom:(UIColor*)bottom
                              left:(UIColor*)left width:(CGFloat)width next:(MStyle*)next;
+ (MFourBorderStyle*)styleWithTop:(UIColor*)top width:(CGFloat)width next:(MStyle*)next;
+ (MFourBorderStyle*)styleWithRight:(UIColor*)right width:(CGFloat)width next:(MStyle*)next;
+ (MFourBorderStyle*)styleWithBottom:(UIColor*)bottom width:(CGFloat)width next:(MStyle*)next;
+ (MFourBorderStyle*)styleWithLeft:(UIColor*)left width:(CGFloat)width next:(MStyle*)next;

@end
