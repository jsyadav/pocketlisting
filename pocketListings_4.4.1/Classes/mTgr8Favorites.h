//
//  mTgr8Favorites.h
//  pocketListings
//
//  Created by Kaustubh Chavan on 9/27/10.
//  Copyright 2010 Xoriant Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@class pocketListingsAppDelegate;
@interface mTgr8Favorites : UIViewController<UIActionSheetDelegate,MFMailComposeViewControllerDelegate> {

	pocketListingsAppDelegate *appDelegate;
	
	IBOutlet UITableView *tbFavorite;
	
	NSString *mailTo;
	NSMutableString *mailSubject;
	NSMutableString *mailBody;
	NSMutableString *sendImgURL;
	NSMutableString *listingStr;
	
	UISegmentedControl *segmentedControl;
	
	NSString *strListingID;
	
	NSUserDefaults *defaults;
}

//-(void)propertiesFromServer:(NSString *)ListingId;
- (void) prepareBody:(NSInteger)buttonIndex;
- (void) sendMail;
-(void) showLoading;

@end
