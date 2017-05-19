//
//  mTgr8DateSelector.h
//  idx
//
//  Created by Kaustubh Chavan on 9/8/10.
//  Copyright 2010 Xoriant Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@class pocketListingsAppDelegate;
@interface mTgr8DateSelector : UIViewController<MFMailComposeViewControllerDelegate> {

	IBOutlet UIDatePicker *dtPicker;
	
	NSString *strListingId;
	NSString *strListingAdd;
    NSString *onlyId;
	
	pocketListingsAppDelegate *appDelegate;
	
	NSUserDefaults *defaults;
}

@property (nonatomic, retain) NSString *strListingId;
@property (nonatomic, retain) NSString *strListingAdd;
@property (nonatomic, retain) NSString *onlyId;

- (void)saveDate;

@end
