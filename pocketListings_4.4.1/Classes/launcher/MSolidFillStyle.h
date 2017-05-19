//
//  MSolidFillStyle.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/30/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MStyle.h"

@interface MSolidFillStyle : MStyle {
    UIColor* _color;
}

@property (nonatomic, retain) UIColor* color;

+ (MSolidFillStyle*)styleWithColor:(UIColor*)color next:(MStyle*)next;

@end
