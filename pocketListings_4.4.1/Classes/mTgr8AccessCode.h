//
//  mTgr8AccessCode.h
//  idx
//
//  Created by Kaustubh Chavan on 9/8/10.
//  Copyright 2010 Xoriant Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@class pocketListingsAppDelegate;
@interface mTgr8AccessCode : UIViewController<UIActionSheetDelegate,UIPickerViewDataSource, UIPickerViewDelegate> {

	pocketListingsAppDelegate *appDelegate;
	
	IBOutlet UITextField *txtUserID;
	IBOutlet UIButton *btnGo;
    IBOutlet UIButton *btnRequireCode;
	
	UIActionSheet *actionSheet;
	
	IBOutlet UIView *loadingView;
	IBOutlet UIButton *btnTnC;
	
	IBOutlet UIWebView *webView;
	
	NSUserDefaults *defaults;
    
    IBOutlet UIPickerView *pickerView;
	NSMutableArray *arrayCities;
    
    IBOutlet UIButton *btnWhyId;
    IBOutlet UIButton *btnWhyDone;

}

- (IBAction)Go:(id)sender;
-(IBAction)requestCode:(id)sender;
-(IBAction)TnC:(id)sender;

-(IBAction)whyIdSelected:(id)sender;
-(IBAction)whyIdCancelled:(id)sender;

-(void)userDataFromServer;
- (void)userDataFromLocal;
-(void) userDataCallback:(id)document delegate:(id)delegate;
- (void) animateTextField: (UITextField*) textField up: (BOOL) up;
- (void) fetchData;

@end
