//
//  MStyleDelegate.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/29/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MStyle,MStyleContext;

@protocol MStyleDelegate <NSObject>

@optional

- (NSString*)textForLayerWithStyle:(MStyle*)style;

- (UIImage*)imageForLayerWithStyle:(MStyle*)style;

- (void)drawLayer:(MStyleContext*)context withStyle:(MStyle*)style;

@end

