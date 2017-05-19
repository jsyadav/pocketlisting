//
//  MPartStyle.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/30/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MStyle.h"

@interface MPartStyle  : MStyle {
    NSString* _name;
    MStyle*  _style;
}

@property (nonatomic, copy)   NSString* name;
@property (nonatomic, retain) MStyle*  style;

+ (MPartStyle*)styleWithName:(NSString*)name style:(MStyle*)style next:(MStyle*)next;

- (void)drawPart:(MStyleContext*)context;

@end
