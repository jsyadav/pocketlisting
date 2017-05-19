//
//  MTextStyle.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/29/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MStyle.h"

@interface MTextStyle : MStyle {
    UIFont*   _font;
    UIColor*  _color;
    
    UIColor*  _shadowColor;
    CGSize    _shadowOffset;
    
    CGFloat   _minimumFontSize;
    NSInteger _numberOfLines;
    
    UITextAlignment                   _textAlignment;
    UIControlContentVerticalAlignment _verticalAlignment;
    
    UILineBreakMode _lineBreakMode;
}

@property (nonatomic, retain) UIFont*   font;
@property (nonatomic, retain) UIColor*  color;

@property (nonatomic, retain) UIColor*  shadowColor;
@property (nonatomic)         CGSize    shadowOffset;

@property (nonatomic)         CGFloat   minimumFontSize;
@property (nonatomic)         NSInteger numberOfLines;

@property (nonatomic)         UITextAlignment                   textAlignment;
@property (nonatomic)         UIControlContentVerticalAlignment verticalAlignment;

@property (nonatomic)         UILineBreakMode lineBreakMode;

+ (MTextStyle*)styleWithFont:(UIFont*)font next:(MStyle*)next;
+ (MTextStyle*)styleWithColor:(UIColor*)color next:(MStyle*)next;
+ (MTextStyle*)styleWithFont:(UIFont*)font color:(UIColor*)color next:(MStyle*)next;
+ (MTextStyle*)styleWithFont:(UIFont*)font color:(UIColor*)color
                textAlignment:(UITextAlignment)textAlignment next:(MStyle*)next;
+ (MTextStyle*)styleWithFont:(UIFont*)font color:(UIColor*)color
                  shadowColor:(UIColor*)shadowColor shadowOffset:(CGSize)shadowOffset
                         next:(MStyle*)next;
+ (MTextStyle*)styleWithFont:(UIFont*)font color:(UIColor*)color
              minimumFontSize:(CGFloat)minimumFontSize
                  shadowColor:(UIColor*)shadowColor shadowOffset:(CGSize)shadowOffset
                         next:(MStyle*)next;
+ (MTextStyle*)styleWithFont:(UIFont*)font color:(UIColor*)color
              minimumFontSize:(CGFloat)minimumFontSize
                  shadowColor:(UIColor*)shadowColor shadowOffset:(CGSize)shadowOffset
                textAlignment:(UITextAlignment)textAlignment
            verticalAlignment:(UIControlContentVerticalAlignment)verticalAlignment
                lineBreakMode:(UILineBreakMode)lineBreakMode numberOfLines:(NSInteger)numberOfLines
                         next:(MStyle*)next;

@end
