//
//  MStyleContext.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/28/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MShape;
@protocol MStyleDelegate;

@interface MStyleContext : NSObject {
    CGRect    _frame;
    CGRect    _contentFrame;
    
    MShape*  _shape;
    
    UIFont*   _font;
    
    BOOL      _didDrawContent;
    
    id<MStyleDelegate> _delegate;
}

@property (nonatomic)         CGRect    frame;
@property (nonatomic)         CGRect    contentFrame;
@property (nonatomic, retain) MShape*  shape;
@property (nonatomic, retain) UIFont*   font;
@property (nonatomic)         BOOL      didDrawContent;

@property (nonatomic, assign) id<MStyleDelegate> delegate;

@end
