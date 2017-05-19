//
//  mTgr8HomeView.h
//  idx
//
//  Created by Kaustubh Chavan on 30/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@class pocketListingsAppDelegate,T_brandingData;
@interface mTgr8HomeView : UIViewController <UIActionSheetDelegate,MFMailComposeViewControllerDelegate> {
	
	pocketListingsAppDelegate *appDelegate;
	NSMutableArray *arrService;
	
	IBOutlet UIButton *btnContact;
	UIActionSheet *actionSheet;
	
	T_brandingData *userData;
	
	IBOutlet UILabel *lblUserName;
	IBOutlet UILabel *lblUserLic;
	IBOutlet UILabel *lblOffName;
	IBOutlet UILabel *lblOffLic;
	IBOutlet UILabel *lblVanityText;
	
	IBOutlet UIImageView *imgAgent;
	
	id data;
	
	NSUserDefaults *defaults;
	
	IBOutlet UIScrollView *scrollView;
    IBOutlet UITableView *tableView;
}

@property (nonatomic, retain) NSMutableArray *arrService;
@property (nonatomic, retain) T_brandingData *userData;

-(IBAction)Contact:(id)sender;

- (void)SendEmail;
- (void)SendText;
- (void)Call;
- (void)CancelAction;
- (void)actionSheetShow;
@end
