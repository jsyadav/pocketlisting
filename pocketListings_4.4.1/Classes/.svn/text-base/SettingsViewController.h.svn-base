//
//  SettingsViewController.h
//  pocketListings
//
//  Created by Kaustubh Chavan on 12/6/10.
//  Copyright 2010 Xoriant Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@class pocketListingsAppDelegate;
@interface SettingsViewController : UIViewController {

	pocketListingsAppDelegate *appDelegate;
	
	IBOutlet UISegmentedControl *segmentedControl;
	IBOutlet UIPickerView* sortPicker;
	
	IBOutlet UITableViewCell *cellLabel;
	IBOutlet UILabel *lblName;
	IBOutlet UILabel *lblSelected;
	
	IBOutlet UITableViewCell *cellController;
	
	NSMutableArray *arrSortDirection;
	NSMutableArray *arrSortBy;
	NSMutableArray *arrListingStatus;
	
	NSMutableArray *arrSortDirectionShow;
	NSMutableArray *arrSortByShow;
	NSMutableArray *arrListingStatusShow;
	
	NSMutableArray *arrValue;
	NSMutableArray *arrValueShow;
	
	NSUserDefaults *defaults;
}

- (void)segmentAction:(id)sender;
- (void)SaveSetting;

@end
