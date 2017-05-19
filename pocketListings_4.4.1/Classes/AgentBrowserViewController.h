//
//  AgentBrowserViewController.h
//  pocketListings
//
//  Created by Developer mTgr8 on 10/12/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

//#import <UIKit/UIKit.h>
//
//@interface AgentBrowserViewController : UIViewController{
//    UIScrollView* scrollView;
//    NSMutableArray* imagesArray;
//}
//
//@property(nonatomic,retain) UIScrollView* scrollView;
//@property(nonatomic,retain) NSMutableArray* imagesArray;
//
//-(void)createScrollView;
//-(void)createButton;
//
//@end

#import "MLauncherView.h"

@class T_brandingData;

@interface AgentBrowserViewController : UIViewController <MLauncherViewDelegate> {
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