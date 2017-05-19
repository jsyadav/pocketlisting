//
//  PropertyTypeVC.h
//  pocketListings
//
//  Created by Kaustubh Chavan on 1/14/11.
//  Copyright 2011 Xoriant Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@class pocketListingsAppDelegate;
@interface PropertyTypeVC : UIViewController {

	pocketListingsAppDelegate *appDelegate;
	NSUserDefaults *defaults;
	
	NSMutableArray *arrTempList;
}

@end
