//
//  webViewController.m
//  pocketListings
//
//  Created by Kaustubh Chavan on 12/14/10.
//  Copyright 2010 Xoriant Corporation. All rights reserved.
//

#import "webViewController.h"
#import "pocketListingsAppDelegate.h"

@implementation webViewController
@synthesize webView;
/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	appDelegate = (pocketListingsAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	appDelegate.isSkip = YES;
	[webView setDelegate:self];
	//[webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:appDelegate.strWebViewURL]]];
	//[appDelegate showActivityViewer];
    [super viewDidLoad];
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
//	[appDelegate showActivityViewer];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
	[appDelegate performDismiss:0];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[webView release];
    [super dealloc];
}


@end
