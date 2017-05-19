//
//  MBoxStyle.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/30/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MStyle.h"
#import "MPosition.h"

@interface MBoxStyle : MStyle {
    UIEdgeInsets  _margin;
    UIEdgeInsets  _padding;
    CGSize        _minSize;
    MPosition    _position;
}

@property (nonatomic) UIEdgeInsets  margin;
@property (nonatomic) UIEdgeInsets  padding;
@property (nonatomic) CGSize        minSize;
@property (nonatomic) MPosition    position;

+ (MBoxStyle*)styleWithMargin:(UIEdgeInsets)margin next:(MStyle*)next;
+ (MBoxStyle*)styleWithPadding:(UIEdgeInsets)padding next:(MStyle*)next;
+ (MBoxStyle*)styleWithFloats:(MPosition)position next:(MStyle*)next;
+ (MBoxStyle*)styleWithMargin:(UIEdgeInsets)margin padding:(UIEdgeInsets)padding
                          next:(MStyle*)next;
+ (MBoxStyle*)styleWithMargin:(UIEdgeInsets)margin padding:(UIEdgeInsets)padding
                       minSize:(CGSize)minSize position:(MPosition)position next:(MStyle*)next;

@end
