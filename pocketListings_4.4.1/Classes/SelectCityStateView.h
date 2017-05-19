//
//  SelectCityStateView.h
//  pocketListings
//
//  Created by Kaustubh Chavan on 1/12/11.
//  Copyright 2011 Xoriant Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@class pocketListingsAppDelegate,OverlayViewController;
@interface SelectCityStateView : UIViewController {

	IBOutlet UITableView *tbList;
	
	pocketListingsAppDelegate *appDelegate;
	NSUserDefaults *defaults;
	
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

//- (NSString *) cityName:(NSString *)cityID;
- (void) searchTableView;
- (void) doneSearching_Clicked:(id)sender;

@end
