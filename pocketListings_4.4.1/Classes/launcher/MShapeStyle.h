//
//  MShapeStyle.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/30/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MStyle.h"

@class MShape;

@interface MShapeStyle : MStyle {
    MShape* _shape;
}

@property (nonatomic, retain) MShape* shape;

+ (MShapeStyle*)styleWithShape:(MShape*)shape next:(MStyle*)next;

@end
