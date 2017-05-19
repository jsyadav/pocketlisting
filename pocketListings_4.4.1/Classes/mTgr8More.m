//
//  mTgr8More.m
//  idx
//
//  Created by Kaustubh Chavan on 27/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "mTgr8More.h"
#import "pocketListingsAppDelegate.h"
#import <QuartzCore/QuartzCore.h>


@implementation mTgr8More

CATransition *animation;

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
	
	self.navigationItem.title = @"About";
	
	appDelegate = (pocketListingsAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	if(appDelegate.offLogoData > 0)
	{
		offLogo.image = [UIImage imageWithData:appDelegate.offLogoData];
	}
	
	
    [super viewDidLoad];
}

- (IBAction) ShareApp:(id)sender
{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSString *subject = @"pocketListings";
	NSString *body = [NSString stringWithFormat:@"I would like to share this Real Estate search app: pocketListings.<br/><br/>iPhone Users:<br/><br/>Please download application from following link:<br/>pliphone.spreadyourbrand.com.<br/>or<br/> search for pocketListings in Apple App Store.<br/><br/>Android users:<br/><br/>Please look for pocketListings in Android market.<br/><br/>To access the app use this ID:%@<br/><br/>Thank you.<br/><br/>%@",[defaults objectForKey:@"UserID"],[appDelegate getStandardEmailFooter]];
	
	//Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
	
	if ([MFMailComposeViewController canSendMail])
	{
		MFMailComposeViewController *composeVC = [[MFMailComposeViewController alloc] init];
		composeVC.mailComposeDelegate = self;
		[composeVC setSubject:subject];
		[composeVC setMessageBody:body isHTML:YES];
		[self presentModalViewController:composeVC animated:YES];
		[composeVC release];
		[self dismissModalViewControllerAnimated:YES];
	}
	else{
		UIAlertView *progressAlert = [[UIAlertView alloc] initWithTitle:@""
																message: @"Could not find an application to e-mail. Please configure."
															   delegate: self
													  cancelButtonTitle: nil
													  otherButtonTitles: @"Ok",nil];
		[progressAlert show];
		[progressAlert release];
	}
}

- (IBAction) Feedback:(id)sender
{
	//Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
	NSString *strSubject = [NSString stringWithFormat:@"pocketListings Feedback"];
	NSString *body = [NSString stringWithFormat:@"<br/><br/>%@",[appDelegate getStandardEmailFooter]];	
	if ([MFMailComposeViewController canSendMail])
	{
		MFMailComposeViewController *composeVC = [[MFMailComposeViewController alloc] init];
		composeVC.mailComposeDelegate = self;
		[composeVC setSubject:strSubject];
		NSArray *arrTo = [NSArray arrayWithObject:@"support@spreadyourbrand.com"];
		[composeVC setToRecipients:arrTo];
		[composeVC setMessageBody:body isHTML:YES];
		[self presentModalViewController:composeVC animated:YES];
		[composeVC release];
		[self dismissModalViewControllerAnimated:YES];
	}
	else{
		UIAlertView *progressAlert = [[UIAlertView alloc] initWithTitle:@""
																message: @"Could not find an application to e-mail. Please configure."
															   delegate: self
													  cancelButtonTitle: nil
													  otherButtonTitles: @"Ok",nil];
		[progressAlert show];
		[progressAlert release];
	}
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error 
{	
//	NSString *message;
//	switch (result)
//	{
//		case MFMailComposeResultCancelled:
//			message = @"Result: canceled";
//			break;
//		case MFMailComposeResultSaved:
//			message = @"Result: saved";
//			break;
//		case MFMailComposeResultSent:
//			message = @"The email was queued in your outbox.";
//			break;
//		case MFMailComposeResultFailed:
//			message = @"Result: failed";
//			break;
//		default:
//			message = @"Result: not sent";
//			break;
//	}
	
//	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"E-Mail" message:message delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
//	[alert show];
//	[alert release];
	
	[self dismissModalViewControllerAnimated:YES];
	
}

- (IBAction)TnC:(id)sender {
    NSString *urltext = @"http://mtgr8.com/mobile/pocketlistings/pocketListings_tc.html";
    
    NSString *strUrl = [urltext stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    NSURL *url = [NSURL URLWithString:strUrl];
    //NSLog(@"Direction URL -%@",urltext);
    
    
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    animation = [CATransition animation];
    [animation setDelegate:self];
    [animation setDuration:0.5f];
    [animation setType:kCATransitionPush];
    [animation setSubtype:kCATransitionFromTop];
    [[webView layer] addAnimation:animation forKey:@"animate"];
    
    webView.hidden = FALSE;
    btnGo.hidden=FALSE;
    
    //    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(cancel)];
    
    //[[UIApplication sharedApplication]openURL:url];
    [urltext release];
}

- (IBAction)cancel:(id)sender {
    animation = [CATransition animation];
    [animation setDelegate:self];
    [animation setDuration:0.5f];
    [animation setType:kCATransitionPush];
    [animation setSubtype:kCATransitionFromBottom];
    [[webView layer] addAnimation:animation forKey:@"animate"];
    
    [webView setHidden:YES];
    [btnGo setHidden:YES];
    self.navigationItem.leftBarButtonItem = nil;
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
    [super dealloc];
}


@end
