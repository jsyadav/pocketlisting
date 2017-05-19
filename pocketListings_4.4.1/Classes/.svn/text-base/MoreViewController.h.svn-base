//
//  MoreViewController.h
//  pocketListings
//
//  Created by Kaustubh Chavan on 11/2/10.
//  Copyright 2010 Xoriant Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "FbGraph.h"

@class pocketListingsAppDelegate;
@interface MoreViewController : UIViewController <MFMailComposeViewControllerDelegate,UIWebViewDelegate>{
	
	IBOutlet UIButton *btnShareApp;
	IBOutlet UIButton *btnFeedback;
	IBOutlet UIButton *btnAbout;
	IBOutlet UIButton *btnSetting;
	IBOutlet UIButton *btnMortgage;
	
	NSUserDefaults *defaults;
	
	IBOutlet UIButton *btnFBLike;
	IBOutlet UIButton *btnFBPost;
	
	IBOutlet UIWebView *fbView;
	IBOutlet UIButton *btnFBClose;
	
	IBOutlet UIView *viewFB;
	IBOutlet UILabel *lblMSG;
	
	pocketListingsAppDelegate *appDelegate;
	
	FbGraph *fbGraph;
	
	NSString *feedPostId;
	
	IBOutlet UIView *viewTC;
	IBOutlet UIWebView *webViewTC;
	IBOutlet UIButton *btnAgreeTC;
	IBOutlet UIButton *btnQuiteTC;
	
	IBOutlet UIScrollView *scrollView;
}
@property (nonatomic, retain) FbGraph *fbGraph;
@property (nonatomic, retain) NSString *feedPostId;

- (IBAction) ShareApp:(id)sender;
- (IBAction) Feedback:(id)sender;
- (IBAction) About:(id)sender;
- (IBAction) FBLike:(id)sender;
- (IBAction) FBPost:(id)sender;
- (IBAction) FBClose:(id)sender;
- (IBAction) SettingApp:(id)sender;
- (IBAction) Mortgage:(id)sender;

- (IBAction) AgreeTC:(id)sender;
- (IBAction) QuiteTC:(id)sender;
- (IBAction) showHistory:(id)sender;


- (void) callLikePage;

//- (void)userDataFromLocal;
//-(void)userDataFromServer;
- (void) showMortgage;
//-(void) userDataCallback:(id)document delegate:(id)delegate;
@end
