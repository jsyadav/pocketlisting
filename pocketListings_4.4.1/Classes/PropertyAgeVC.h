//
//  PropertyAgeVC.h
//  pocketListings
//
//  Created by Developer mTgr8 on 2/6/12.
//  Copyright 2012 mTgr8 Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class pocketListingsAppDelegate;
@interface PropertyAgeVC : UITableViewController{
    pocketListingsAppDelegate *appDelegate;
	NSUserDefaults *defaults;
    NSMutableArray *arrTempList;
    NSString* tempCurSelection;
}

@end
