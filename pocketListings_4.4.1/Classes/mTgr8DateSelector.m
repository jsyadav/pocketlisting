//
//  mTgr8DateSelector.m
//  idx
//
//  Created by Kaustubh Chavan on 9/8/10.
//  Copyright 2010 Xoriant Corporation. All rights reserved.
//

#import "mTgr8DateSelector.h"
#import "pocketListingsAppDelegate.h"
//#import "FlurryAPI.h"

@implementation mTgr8DateSelector
@synthesize strListingId,strListingAdd,onlyId;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	appDelegate = (pocketListingsAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSDate *today = [NSDate date];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.month = 1;
    NSDate *nextMonth = [gregorian dateByAddingComponents:components toDate:today options:0];
    [components release];
	
	[dtPicker setDate:today];
    [dtPicker setMinimumDate:today];
    [dtPicker setMaximumDate:nextMonth];
    
	
	defaults = [NSUserDefaults standardUserDefaults];
	
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(saveDate)];
    [super viewDidLoad];
}

- (void)saveDate
{
	NSDateFormatter* dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
	[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
	
	//[dateFormatter setDateFormat:(NSString*) @"h:mm a"];
	
	//NSLog(@"Schedule date: %@",[dateFormatter stringFromDate:[dtPicker date]]); 
	
	//NSString *to = @"nshukla@mtgr8.com";
	
	NSString *to;
	if(appDelegate.agentEmail.length > 0)
	{
		to = appDelegate.agentEmail;
	}
	else
	{
		to = @"nshukla@mtgr8.com";
	}
	
    NSString* fburl=[NSString stringWithFormat:@"http://spreadyourbrand.com/fbsearch/fbprint.php?id=%@&mtag=%@",self.onlyId,[appDelegate.agentData mTag_var]];
    NSString* moreDetails=[NSString stringWithFormat:@"<a href='%@'>More Details...</a>",fburl];
	
	NSString *subject = strListingId;//[NSString stringWithFormat:@"Schedule Visit on %@",[dateFormatter stringFromDate:[dtPicker date]]];
	NSString *body = [NSString stringWithFormat:@"I am interested in visiting this listing on %@ : %@ <br/>%@<br/><br/>%@",[dateFormatter stringFromDate:[dtPicker date]],strListingAdd,moreDetails,[appDelegate getStandardEmailFooter]];
		
	//Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
	
	if ([MFMailComposeViewController canSendMail])
	{
		MFMailComposeViewController *composeVC = [[MFMailComposeViewController alloc] init];
		composeVC.mailComposeDelegate = self;
		[composeVC setSubject:subject];
		NSArray *arrTo = [NSArray arrayWithObject:to];
		[composeVC setToRecipients:arrTo];
		[composeVC setMessageBody:body isHTML:YES];
		[self presentModalViewController:composeVC animated:YES];
		[composeVC release];
		[self dismissModalViewControllerAnimated:YES];
	}
	else {
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
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
