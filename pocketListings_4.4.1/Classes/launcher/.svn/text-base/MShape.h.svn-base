//
//  MShape.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/28/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MShape : NSObject

- (void)openPath:(CGRect)rect;
- (void)closePath:(CGRect)rect;

- (void)addTopEdgeToPath:(CGRect)rect lightSource:(NSInteger)lightSource;
- (void)addRightEdgeToPath:(CGRect)rect lightSource:(NSInteger)lightSource;
- (void)addBottomEdgeToPath:(CGRect)rect lightSource:(NSInteger)lightSource;
- (void)addLeftEdgeToPath:(CGRect)rect lightSource:(NSInteger)lightSource;

/**
 * Opens the path, adds all edges, and closes the path.
 */
- (void)addToPath:(CGRect)rect;

- (void)addInverseToPath:(CGRect)rect;

- (UIEdgeInsets)insetsForSize:(CGSize)size;

@end
