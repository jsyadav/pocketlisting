//
//  mTgr8RangeSelectorVC.h
//  MLS-R-App
//
//  Created by mDeveloper on 9/24/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "SettingsObj.h"

@class pocketListingsAppDelegate;
@interface mTgr8RangeSelectorVC : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> {
	IBOutlet UITableViewCell* labelCell;
	IBOutlet UILabel* selctedObjectLabel;
	
	IBOutlet UITableViewCell* controlCell;
	IBOutlet UIPickerView* rangePicker;
	
	//SettingsObj* globalSettings;
	
	NSArray*	pickerMinViewArray;
	id selectedMinObject;
	
	NSArray*	pickerMaxViewArray;
	id selectedMaxObject;
	
	IBOutlet UITableView* tableView;
	
	IBOutlet UILabel* selectedRangeTitleLabel;
	NSString *rangeTitleLabelString;
	
	id minTarget;
	SEL minCallback;
	
	id maxTarget;
	SEL maxCallback;
    NSInteger minIndex;
    NSInteger maxIndex;
	
	 NSUserDefaults *defaults;
	
	pocketListingsAppDelegate *appDelegate;
}

@property (nonatomic, retain)  UITableViewCell* labelCell;
@property (nonatomic, retain)  UILabel* selctedObjectLabel;

@property (nonatomic, retain) UITableViewCell* controlCell;
@property (nonatomic, retain) UIPickerView* rangePicker;

//@property (nonatomic, assign) SettingsObj* globalSettings;

@property (nonatomic, assign) IBOutlet UILabel* selectedRangeTitleLabel;

@property (nonatomic, retain) NSArray*	pickerMinViewArray;
@property (nonatomic, retain)id selectedMinObject;

@property (nonatomic, retain) NSArray*	pickerMaxViewArray;
@property (nonatomic, retain) id selectedMaxObject;
@property (nonatomic, retain) NSString *rangeTitleLabelString;

@property (readwrite,assign) id minTarget;
@property (readwrite,assign) SEL minCallback;

@property (readwrite,assign) id maxTarget;
@property (readwrite,assign) SEL maxCallback;
@property (readwrite,retain) IBOutlet UITableView* tableView;

- (void) saveChanges;

@end
