//
//  mTgr8SearchHistory.h
//  idx
//
//  Created by Kaustubh Chavan on 27/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class pocketListingsAppDelegate,SearchResultController,MapViewController;
@interface mTgr8SearchHistory : UIViewController {

	pocketListingsAppDelegate *appDelegate;
	
	IBOutlet UITableView *tblView;
	
	NSMutableArray *arrData;
	BOOL isIdSearch;
	
	SearchResultController *cvCtrl;
	
	NSMutableArray *arrListingId;
	
	NSUserDefaults *defaults;
}

@property(nonatomic,retain) NSMutableArray *arrData;

+(NSString*)currentSelectedURL;
+(void)setCurrentSelectedURL:(NSString*)url;
  
-(void)propertiesFromServer:(NSString*) options;
-(void) propertiesCallback:(id)document delegate:(id)delegate;

//-(void)MLSFromServer:(NSString *)ListingId;
//-(void) MLSCallback:(id)document delegate:(id)delegate;
@end
