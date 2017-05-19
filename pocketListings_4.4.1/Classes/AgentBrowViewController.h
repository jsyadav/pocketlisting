//
//  AgentBrowViewController.h
//  pocketListings
//
//  Created by Developer mTgr8 on 12/17/11.
//  Copyright (c) 2011 mTgr8 Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MLauncherView.h"

@class T_brandingData;

@interface AgentBrowViewController : UIViewController <MLauncherViewDelegate> {
    MLauncherView* _launcherView;
    int totalcount;
    int count;
    int pageSize;
    NSMutableArray* _pages;
    NSString* city;
    NSMutableDictionary* _itemsURLValCache;
    UIActionSheet* actionSheet;
    T_brandingData* currentAgent;
}

@property (nonatomic,retain) NSMutableArray* _pages;
@property (nonatomic,retain) NSMutableDictionary* _itemsURLValCache;
@property (nonatomic,retain) NSString* city;

@end