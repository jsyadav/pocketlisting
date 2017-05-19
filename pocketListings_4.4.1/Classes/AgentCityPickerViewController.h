//
//  AgentCityPickerViewController.h
//  pocketListings
//
//  Created by Developer mTgr8 on 10/22/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OverlayViewController;
@interface AgentCityPickerViewController : UITableViewController	
{
    IBOutlet UITableView *tbList;
    
    NSMutableArray* arrCityStateData;

    NSMutableArray *arrCity;
    NSMutableArray *arrState;

    NSMutableArray *arrListingData;
    NSMutableArray *stateIndex;

    NSMutableArray *arrSelCity;
    NSMutableArray *arrSelState;

    NSMutableArray *tempList;
    NSArray *noOfState;
    BOOL selected;

    IBOutlet UISearchBar *searchBar;
    NSMutableArray *copyListOfItems;
    BOOL searching;
    BOOL letUserSelectRow;
    BOOL isSeachButton;

    OverlayViewController *ovController;
}

@property (nonatomic,retain) NSMutableArray* arrCityStateData;
@end
