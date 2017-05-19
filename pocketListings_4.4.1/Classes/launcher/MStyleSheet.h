//
//  MStyleSheet.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/29/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MStyle;

@interface MStyleSheet : NSObject {
    NSMutableDictionary* _styles;
}

+ (MStyleSheet*)globalStyleSheet;
+ (void)setGlobalStyleSheet:(MStyleSheet*)styleSheet;

- (MStyle*)styleWithSelector:(NSString*)selector;
- (MStyle*)styleWithSelector:(NSString*)selector forState:(UIControlState)state;

- (void)freeMemory;

@end
