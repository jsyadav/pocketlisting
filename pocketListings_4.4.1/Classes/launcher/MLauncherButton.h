//
//  MLauncherButton.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/29/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MButton.h"

@class MLauncherItem,MLabel;

@interface MLauncherButton : MButton {
    MLauncherItem* _item;
    MLabel*        _badge;
    MButton*       _closeButton;
    
    BOOL _dragging;
    BOOL _editing;
}

@property (nonatomic, readonly) MLauncherItem* item;
@property (nonatomic, readonly) MButton*       closeButton;
@property (nonatomic)           BOOL            dragging;
@property (nonatomic)           BOOL            editing;

- (id)initWithItem:(MLauncherItem*)item;

@end
