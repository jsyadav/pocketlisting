//
//  MStyle.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/28/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MStyleContext;

@interface MStyle : NSObject {
    MStyle* _next;
}

@property (nonatomic, retain) MStyle* next;

- (id)initWithNext:(MStyle*)next;

- (MStyle*)next:(MStyle*)next;

- (void)draw:(MStyleContext*)context;

- (UIEdgeInsets)addToInsets:(UIEdgeInsets)insets forSize:(CGSize)size;
- (CGSize)addToSize:(CGSize)size context:(MStyleContext*)context;

- (void)addStyle:(MStyle*)style;

- (id)firstStyleOfClass:(Class)cls;
//- (id)styleForPart:(NSString*)name;

@end
