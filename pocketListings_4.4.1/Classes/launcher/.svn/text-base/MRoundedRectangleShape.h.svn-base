//
//  MRoundedRectangleShape.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/30/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MShape.h"

@interface MRoundedRectangleShape : MShape {
    CGFloat _topLeftRadius;
    CGFloat _topRightRadius;
    CGFloat _bottomRightRadius;
    CGFloat _bottomLeftRadius;
}

@property (nonatomic) CGFloat topLeftRadius;
@property (nonatomic) CGFloat topRightRadius;
@property (nonatomic) CGFloat bottomRightRadius;
@property (nonatomic) CGFloat bottomLeftRadius;

+ (MRoundedRectangleShape*)shapeWithRadius:(CGFloat)radius;

+ (MRoundedRectangleShape*)shapeWithTopLeft:(CGFloat)topLeft topRight:(CGFloat)topRight
                                 bottomRight:(CGFloat)bottomRight bottomLeft:(CGFloat)bottomLeft;

@end
