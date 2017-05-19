//
//  mTgr8MyCriteria.h
//  idx
//
//  Created by Kaustubh Chavan on 27/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class mTgr8SearchSettingObject,pocketListingsAppDelegate,SearchResultController,MapViewController;
@interface mTgr8MyCriteria : UIViewController {

	IBOutlet UITableView *tblCriteria;
	
	IBOutlet UITableViewCell *zipTableViewCell;
	IBOutlet UITextField *txtZip;
	IBOutlet UITextField *txtCity;
	IBOutlet UITextField *txtState;
    IBOutlet UITextField *txtStreet;
	
	IBOutlet UITableViewCell *searchTableViewCell;
	IBOutlet UILabel *lblPrice;
	IBOutlet UILabel *lblBed;
	IBOutlet UILabel *lblBath;
	IBOutlet UILabel *lblSqFt;
	IBOutlet UILabel *lblSortDirec;
	IBOutlet UILabel *lblSortBy;
	IBOutlet UILabel *lblListingStatus;
	IBOutlet UILabel *lblPropType;
    IBOutlet UILabel *lblUpdatedInOption;
	
	IBOutlet UIButton *btnPrice;
	IBOutlet UIButton *btnBed;
	IBOutlet UIButton *btnBath;
	IBOutlet UIButton *btnSqFt;
	IBOutlet UIButton *btnSortDirec;
	IBOutlet UIButton *btnSortBy;
	IBOutlet UIButton *btnListingStatus;
	IBOutlet UIButton *btnPropType;
	
	
	IBOutlet UITableViewCell *segmentCell;
	IBOutlet UISegmentedControl *segmentedControl;
	NSInteger selectedSegment;
    
    IBOutlet UISwitch *onlyOHSwitch;
    
    IBOutlet UISegmentedControl *listingStatusControl;
	
	IBOutlet UITableViewCell *MLSCell;
	IBOutlet UITextField *txtMLS;
	
	IBOutlet UITableViewCell *sortCell;
	IBOutlet UISegmentedControl *settingSegmentedControl;
	IBOutlet UIPickerView* sortPicker;
	
	NSMutableArray *arrSortDirection;
	NSMutableArray *arrSortBy;
	NSMutableArray *arrListingStatus;
	
	NSMutableArray *arrSortDirectionShow;
	NSMutableArray *arrSortByShow;
	NSMutableArray *arrListingStatusShow;
	
	 NSUserDefaults *defaults;
	
	mTgr8SearchSettingObject *objSearchSetting;
	pocketListingsAppDelegate *appDelegate;
	
	NSMutableArray *arrListingId;
	SearchResultController *cvCtrl;
	
	NSMutableString *historyStr;
	NSMutableString *historyZip;
	NSMutableString *historyCity;
	NSMutableString *cityID;
	NSMutableArray *arrValidCity;
	
	IBOutlet UIButton *btnSelectCityState;
	
	IBOutlet UILabel *lblCityState;
	
	BOOL isCriteria;
	
}

@property (nonatomic, retain)IBOutlet UITableViewCell *zipTableViewCell;
@property (nonatomic, retain)IBOutlet UITableViewCell *searchTableViewCell;
@property (nonatomic, retain)IBOutlet UITableViewCell *segmentCell;
@property (nonatomic, retain)IBOutlet UITableViewCell *MLSCell;


- (NSString *)nameForSection:(NSInteger)section;
-(IBAction)Price:(id)sender;
-(IBAction)Bed:(id)sender;
-(IBAction)Bath:(id)sender;
-(IBAction)SqFt:(id)sender;
-(IBAction)SortDirection:(id)sender;
-(IBAction)SortBy:(id)sender;
-(IBAction)ListingStatus:(id)sender;
-(IBAction)SelectCityState:(id)sender;
-(IBAction)PropType:(id)sender;
-(IBAction)onlyOpenHouseAction:(id)sender;
-(IBAction)listingStatusChanged:(id)sender;
-(IBAction)streetValueChanged:(id)sender;
-(IBAction)updateInOption:(id)sender;

- (void)saveAction;
- (NSString *) formattedCity:(NSString *)city;
- (void)segmentAction:(id)sender;
//- (void) animateTextField: (UITextField*) textField up: (BOOL) up;
-(void)propertiesFromServer:(NSString *)ListingId;
- (void) SaveHistory;
//- (void)settingSegmentAction:(id)sender;
//- (void)SaveSetting;

- (NSString *) getTempPrice;
- (NSString *) getTempBath;
- (NSString *) getTempBed;
- (NSString *) getTempSqFt;
@end
