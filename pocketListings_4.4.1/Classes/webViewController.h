//
//  webViewController.h
//  pocketListings
//
//  Created by Kaustubh Chavan on 12/14/10.
//  Copyright 2010 Xoriant Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@class pocketListingsAppDelegate;
@interface webViewController : UIViewController<UIWebViewDelegate> {

	pocketListingsAppDelegate *appDelegate;
	
	IBOutlet UIWebView *webView;
}
@property (nonatomic, retain) UIWebView *webView;
 
@end
