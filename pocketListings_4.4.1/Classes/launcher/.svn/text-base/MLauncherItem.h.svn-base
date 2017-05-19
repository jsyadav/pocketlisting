//
//  MLauncherItem.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/28/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MLauncherView;

@interface MLauncherItem : NSObject <NSCoding> {
    MLauncherView* _launcher;
    
    NSString*       _title;
    NSString*       _image;
    NSString*       _URL;
    
    NSString*       _style;
    NSString*       _badgeValue;
    
    BOOL            _canDelete;
    id              _userInfo;
}

@property (nonatomic, assign) MLauncherView* launcher;
@property (nonatomic, copy)   NSString*       title;
@property (nonatomic, copy)   NSString*       image;
@property (nonatomic, copy)   NSString*       URL;
@property (nonatomic, copy)   NSString*       style;
@property (nonatomic)         NSInteger       badgeNumber;
@property (nonatomic, copy)   NSString*       badgeValue;
@property (nonatomic)         BOOL            canDelete;
@property (nonatomic, retain) id              userInfo;

- (id)initWithTitle:(NSString*)title image:(NSString*)image URL:(NSString*)URL;
- (id)initWithTitle:(NSString*)title image:(NSString*)image URL:(NSString*)URL
          canDelete:(BOOL)canDelete;

@end
