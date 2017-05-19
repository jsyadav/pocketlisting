//
//  MortgageViewController.h
//  pocketListings
//
//  Created by Kaustubh Chavan on 10/25/10.
//  Copyright 2010 Xoriant Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "T_brandingData.h"

@class pocketListingsAppDelegate;
@interface MortgageViewController : UIViewController<UIActionSheetDelegate,MFMailComposeViewControllerDelegate,UIWebViewDelegate> {

	pocketListingsAppDelegate *appDelegate;
	NSUserDefaults *defaults;
	
	NSMutableArray *arrMortgage;
	
	UIActionSheet *actionSheet;
	IBOutlet UIButton *btnContact;
	IBOutlet UIWebView *webView;
	
	T_brandingData *agentData;
	
	IBOutlet UILabel *lblUserName;
	IBOutlet UILabel *lblUserLic;
	IBOutlet UILabel *lblOffName;
	IBOutlet UILabel *lblOffLic;
	IBOutlet UILabel *lblVanityText;
	
	IBOutlet UIImageView *imgAgent;
	
	IBOutlet UITextField *txtHomePrice;
	IBOutlet UITextField *txtDownPayment;
	IBOutlet UITextField *txtLoanTerm;
	IBOutlet UITextField *txtInterestRate;
	
	IBOutlet UILabel *lblCalculatedValue;
	
	IBOutlet UIButton *btnPreApproval;
	IBOutlet UIButton *btnRates;
	
	IBOutlet UIView *viewTC;
	IBOutlet UIWebView *webViewTC;
	IBOutlet UIButton *btnAgreeTC;
	IBOutlet UIButton *btnQuitTC;
	
	IBOutlet UIScrollView *scrollView;
	
}

@property (nonatomic, retain) T_brandingData *agentData;

-(IBAction)Contact:(id)sender;

-(IBAction)PreApproval:(id)sender;
-(IBAction)Rates:(id)sender;
- (IBAction) AgreeTC:(id)sender;
- (IBAction) QuitTC:(id)sender;


- (void)SetData;
- (void)SendEmail;
- (void)SendText;
- (void)Call;
- (void)CancelAction;
- (void)actionSheetShow;
- (void) calculateAmount;
//-(void)userDataFromServer;
//-(void) userDataCallback:(id)document delegate:(id)delegate;
@end
