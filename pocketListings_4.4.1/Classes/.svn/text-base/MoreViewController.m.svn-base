//
//  MoreViewController.m
//  pocketListings
//
//  Created by Kaustubh Chavan on 11/2/10.
//  Copyright 2010 Xoriant Corporation. All rights reserved.
//

#import "MoreViewController.h"
#import "mTgr8More.h"
//#import "FlurryAPI.h"
#import "pocketListingsAppDelegate.h"
#import "SBJson.h"
#import "FbGraphFile.h"
#import "SettingsViewController.h"
#import "MortgageViewController.h"
#import "AppUtils.h"
#import "mTgr8SearchHistory.h"


@implementation MoreViewController

@synthesize fbGraph;
@synthesize feedPostId;

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
	
	defaults = [NSUserDefaults standardUserDefaults];
	
	self.navigationItem.title = @"More...";
	
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated{
	
//	if([defaults boolForKey:@"isCalculate"])
//	{
//		[self showMortgage];
//	}
}

- (IBAction) showHistory:(id)sender{
    appDelegate.isHistory = YES;
    mTgr8SearchHistory *objHistory = [[mTgr8SearchHistory alloc] initWithNibName:@"mTgr8SearchHistory" bundle:nil];
    [self.navigationController pushViewController:objHistory animated:YES];
    [objHistory release];
}

- (IBAction) About:(id)sender
{
	mTgr8More *objmTgr8More = [[mTgr8More alloc] initWithNibName:@"mTgr8More" bundle:nil];
	[self.navigationController pushViewController:objmTgr8More animated:YES];
	[objmTgr8More release];
}

- (IBAction) ShareApp:(id)sender
{
	NSString *subject = @"pocketListings –Most reliable MLS Data on mobile";
//	NSString *body = [NSString stringWithFormat:@"<p>I would like to share this Real Estate search app: <b>pocketListings</b> provided to me by my Realtor <b>%@</b>.\n\n<p>To activate the app use ID below.</p> <p>\n\n<i>Access ID</i> : <b>%@</b> </p>\n\n<p><p>\n\nDownload application from : <a href=\"http://m.syb.me\">http://m.syb.me</a>.</p><p>\n\nOr search for <b><i>pocketListings</i></b> in Apple App Store or Android Market.</p></p>",appDelegate.agentFirstName,[defaults objectForKey:@"UserID"]];
    
    NSString *body = [NSString stringWithFormat:@"<p>I would like to share this Real Estate search app: <b>pocketListings</b> provided by my Realtor <b>%@ %@</b>.\n\n<p>To Download the app tap <a href='http://spreadyourbrand.com/profile.php?code=%@'>here</a></p>",appDelegate.agentFirstName,appDelegate.agentLastName,[defaults objectForKey:@"UserID"]];
	
//	if(appDelegate.currentDevOS >= 4)
//	{
//		NSDictionary *dictionary = 
//		[NSDictionary dictionaryWithObjectsAndKeys:[defaults objectForKey:@"UserID"],@"MTAG",nil];
//		[FlurryAPI logEvent:@"ABOUT_PAGE_SHARING_EVENT" withParameters:dictionary];		
//	}
	
	//Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
	
	if ([MFMailComposeViewController canSendMail])
	{
		MFMailComposeViewController *composeVC = [[MFMailComposeViewController alloc] init];
		composeVC.mailComposeDelegate = self;
		[composeVC setSubject:subject];
        [composeVC setCcRecipients:[NSArray arrayWithObject:appDelegate.agentEmail]];
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
//	if(appDelegate.currentDevOS >= 4)
//	{
//		NSDictionary *dictionary = 
//		[NSDictionary dictionaryWithObjectsAndKeys:[defaults objectForKey:@"UserID"],@"MTAG",nil];
//		[FlurryAPI logEvent:@"ABOUT_PAGE_SHARING_EVENT" withParameters:dictionary];		
//	}
	
	//Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
	NSString *strSubject = [NSString stringWithFormat:@"pocketListings Feedback"];
	NSString *body = [NSString stringWithFormat:@"\n\n%@",[appDelegate getStandardEmailFooter]];
	
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

- (IBAction) SettingApp:(id)sender
{
	SettingsViewController *objSettingsViewController = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
	[self.navigationController pushViewController:objSettingsViewController animated:YES];
	[objSettingsViewController release];
}

- (IBAction) Mortgage:(id)sender
{
//	[appDelegate showActivityViewer];
//	[self userDataFromServer];
	
	[appDelegate MortUserDataFromServer];
	
//	[self showMortgage];
}

- (void) showMortgage
{
	
	MortgageViewController *objMortgageViewController = [[MortgageViewController alloc] initWithNibName:@"MortgageViewController" bundle:nil];
	//objMortgageViewController.agentData = data;
	[self.navigationController pushViewController:objMortgageViewController animated:NO];
	[objMortgageViewController release];
	
	
//	if([defaults objectForKey:@"isAgreeTC"])
//	{
//		[appDelegate showActivityViewer];
//		[self userDataFromServer];
//
//	}
//	else {
//		
//		[webViewTC loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://mtgr8.com/mobile/pocketlistings/finance_tc.html"]]];
//		viewTC.hidden = FALSE;
//	}

}

- (IBAction) AgreeTC:(id)sender
{
	[defaults setBool:YES forKey:@"isAgreeTC"];
	[defaults synchronize];
	viewTC.hidden = TRUE;
	//[self showMortgage];
}

- (IBAction) QuiteTC:(id)sender
{
	viewTC.hidden = TRUE;
}

//-(void)userDataFromServer
//{
//	
//	
//	//NSString* urlStr=[NSString stringWithFormat:@"http://getyouridx.agentstorm.com/users/%@.xml?apikey=%@",txtUserID.text,appDelegate.API_KEY];
//	
//	NSString* urlStr=[NSString stringWithFormat:@"http://www.spreadyourbrand.com/webservice/webservice.php?mtag=%@",[defaults objectForKey:@"AgentId"]];
//	
//	NSURL *serviceURL = [NSURL URLWithString:urlStr];
//	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:serviceURL];
//	
//	NSData *XmlData = [NSData dataWithContentsOfURL:serviceURL];
//	NSString *strXmlContent = [[NSString alloc] initWithData:XmlData encoding:NSUTF8StringEncoding];
//	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//	NSString *documentsDirectory = [paths objectAtIndex:0];
//	NSString *dataFilePath = [[documentsDirectory stringByAppendingPathComponent:@"MortBrandingData.xml"] retain];
//	
//	[strXmlContent writeToFile:dataFilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
//	
//	[appDelegate startTimeOut];
//	
//	NSDate *today = [NSDate date];
//	[defaults setObject:today forKey:@"mortBrandingDate"];
//	[defaults synchronize];
//	
//	[urlRequest setHTTPMethod:@"GET"];
//	[urlRequest addValue: @"iPhone" forHTTPHeaderField:@"User-Agent"];
//	[urlRequest addValue: @"keep-alive" forHTTPHeaderField:@"Connection"];
//	[urlRequest addValue: @"GET" forHTTPHeaderField:@"Method"];
//	[urlRequest addValue: @"*/*" forHTTPHeaderField:@"Accept"];
//	
//	[AppUtils requestServer:urlRequest resultTarget:self targetFunction:@selector(userDataCallback:delegate:)];
//}
//
//- (void)userDataFromLocal
//{
//	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//	NSString *documentsDirectory = [paths objectAtIndex:0];
//	NSString *dataFilePath = [[documentsDirectory stringByAppendingPathComponent:@"BrandingData.xml"] retain];
//	
//	NSData *XmlData = [NSData dataWithContentsOfFile:dataFilePath];
//	if(XmlData > 0)
//	{
//		NSString *strXmlContent = [[NSString alloc] initWithData:XmlData encoding:NSUTF8StringEncoding];
//		
//		CXMLDocument *resDoc = [[[CXMLDocument alloc] initWithXMLString:strXmlContent options:0 error:nil] autorelease];
//		
//		[self userDataCallback:resDoc delegate:self];
//	}
//	
//	
//}
//
//-(void) userDataCallback:(id)document delegate:(id)delegate{
//	if(!appDelegate.isTimeOut)
//	{
//		[appDelegate invalidTimer];
//		if(delegate!=nil){
//			[document retain];
//			[delegate retain];
//			
//			//if(![[XMLUtil getXMLStringValue:@"@count" inNode:[document rootElement]] isEqual: @"0"])
//			if([[XMLUtil getXMLStringValue:@"Status" inNode:[document rootElement]] isEqualToString:@"Yes"])
//			{
//				
//				T_brandingData *objTBranding = [[[T_brandingData alloc] initWithXML:[document rootElement]] retain];
//				
//				//T_Users* objTUsers = [[[T_Users alloc] initWithXML:[document rootElement]] retain];
//				id data = objTBranding;
//				MortgageViewController *objMortgageViewController = [[MortgageViewController alloc] initWithNibName:@"MortgageViewController" bundle:nil];
//				objMortgageViewController.agentData = data;
//				[self.navigationController pushViewController:objMortgageViewController animated:NO];
//				[objMortgageViewController release];
//				
//			}
//			else
//			{
//				if([[XMLUtil getXMLStringValue:@"Status" inNode:[document rootElement]] isEqualToString:@"No"])
//				{
//					//UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"No records found! \nPossible causes: \nSearch Range too narrow.. \nServer does not support location.. \nServer session timed out..." message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//					UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Agent is Inactive" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//					[alert show];
//					[alert release];
//				}
//				else
//				{
//					UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Invalid Access ID" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//					[alert show];
//					[alert release];
//				}
//				
//			}
//		}else{
//			//[Utils showErrorAlert:@"Error, server call failed!"];
//		}
//		
//		[appDelegate performDismiss:0];
//	}
//}


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
//	
	//	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"E-Mail" message:message delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
	//	[alert show];
	//	[alert release];
	
	[self dismissModalViewControllerAnimated:YES];
	
}

- (IBAction) FBLike:(id)sender
{
	btnFBClose.hidden = FALSE;
	fbView.hidden = FALSE;
	
	NSString *embedHTML = @"\
	<html><head>\
	<style type=\"text/css\">\
	body {\
	background-color: transparent;\
	color: white;\
	}\
	</style>\
	<script src=\"http://connect.facebook.net/en_US/all.js#xfbml=1\"></script><fb:like-box href=\"http://www.facebook.com/apps/application.php?id=109689609101858\" width=\"280\" connections=\"10\" stream=\"false\" header=\"true\"></fb:like-box>\
	</head><body style=\"margin:0\">\
	</body></html>";
	
	//	<script src=\"http://connect.facebook.net/en_US/all.js#xfbml=1\"></script><fb:like-box href=\"http://www.facebook.com/pages/TestAppPage/165725373467811\" width=\"280\" connections=\"10\" stream=\"false\" header=\"true\"></fb:like-box>\	
//http://www.facebook.com/apps/application.php?id=109689609101858
	//NSString *html = @"http://www.facebook.com/pages/TestAppPage/165725373467811";
	//UIWebView *videoView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
	fbView.delegate = self;
	[fbView loadHTMLString:embedHTML baseURL:nil];
	//[webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:html]]];
	
}

- (IBAction) FBPost:(id)sender
{
	if([defaults boolForKey:@"isFBPosted"])
	{
//		btnFBClose.hidden = FALSE;
//		fbView.hidden = FALSE;
//		viewFB.hidden = FALSE;
//		[lblMSG setHidden:YES];
//		
//		NSString *embedHTML = @"\
//		<html><head>\
//		<style type=\"text/css\">\
//		body {\
//		background-color: transparent;\
//		color: white;\
//		}\
//		</style>\
//		<script src=\"http://connect.facebook.net/en_US/all.js#xfbml=1\"></script><fb:like-box href=\"http://www.facebook.com/apps/application.php?id=109689609101858\" width=\"320\" connections=\"10\" stream=\"false\" header=\"true\"></fb:like-box>\
//		</head><body style=\"margin:0\">\
//		</body></html>";
//		
//		fbView.delegate = self;
//		[fbView setFrame:CGRectMake(0, 0, 320, 380)];
//		[fbView loadHTMLString:embedHTML baseURL:nil];
//		self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(FBClose:)];
//		//http://www.facebook.com/profile.php?id=100000631512691
		
		UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"App already shared on Facebook." message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alertView show];
		[alertView release];
	}
	else 
	{
//		fbAgent = [[FacebookAgent alloc] initWithApiKey:@"109689609101858" 
//											  ApiSecret:@"0048c529820f631bc224f6e7d51c038a" 
//											   ApiProxy:nil];
//		fbAgent.delegate = self;
//		
//		
//		fbAgent.shouldResumeSession =YES;
//		
//		[fbAgent setStatus:[NSString stringWithFormat:@"I would like to share this Real Estate search app: pocketListings.\n\nTo access the app use this ID: %@ for My agent %@.\n\niPhone Users:\n\nPlease download application from following link:\npliphone.spreadyourbrand.com.\nor\n search for pocketListings in iTunes.\n\nAndroid users:\n\nPlease look for pocketListings in Android market.",[defaults objectForKey:@"UserID"],appDelegate.agentFirstName]];
//		
//		[lblMSG setHidden:NO];
		
		UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"App along with agent details will be posted on your wall." message:@"You can check this post by visiting facebook from your mobile or computer." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK",nil];
		[alertView show];
		[alertView release];
				
		//begin the authentication process.....
		//[fbGraph authenticateUserWithCallbackObject:self andSelector:@selector(fbGraphCallback:) andExtendedPermissions:@"user_photos,user_videos,publish_stream,offline_access"];
		
		
	}

	
			
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if(buttonIndex == 1)
	{
		if([alertView.title isEqualToString:@"App along with agent details will be posted on your wall."])
		{
			NSString *client_id = @"153630348016433";
			
			//alloc and initalize our FbGraph instance
			self.fbGraph = [[FbGraph alloc] initWithFbClientID:client_id];
			
			UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelFB)]; 
			self.navigationItem.rightBarButtonItem = cancelButton;
			[cancelButton release];
			
			[fbGraph authenticateUserWithCallbackObject:self andSelector:@selector(fbGraphCallback:) andExtendedPermissions:@"user_photos,user_videos,publish_stream,offline_access" andSuperView:self.view];
			
		}
		
	}
}

- (void)cancelFB
{
	UIWindow* window = [UIApplication sharedApplication].keyWindow;
	if (!window) {
		//window = [[UIApplication sharedApplication].windows objectAtIndex:0]; 01/07
		[[UIApplication sharedApplication].windows objectAtIndex:0];
	}
	[fbGraph.webView removeFromSuperview];
	[fbGraph.webView release];
	fbGraph.webView = nil;
	
	self.navigationItem.rightBarButtonItem = nil;
	
}

- (void)fbGraphCallback:(id)sender {
	
	//NSLog(@"------------>CONGRATULATIONS<------------, You're logged into Facebook...  Your oAuth token is:  %@", fbGraph.accessToken);
	
	self.navigationItem.rightBarButtonItem.enabled = FALSE;
	[self callLikePage];
}



//- (void) facebookAgent:(FacebookAgent*)agent requestFaild:(NSString*) message{
//    //fbAgent.shouldResumeSession =NO;
//    //[fbAgent setStatus:@"status from iPhone demo"];
//	[self callLikePage];
//}
//- (void) facebookAgent:(FacebookAgent*)agent statusChanged:(BOOL) success{
//	[defaults setBool:YES forKey:@"isFBPosted"];
//	[self callLikePage];
//}
//- (void) facebookAgent:(FacebookAgent*)agent loginStatus:(BOOL) loggedIn{
//	
//}

- (void) callLikePage
{
		
	
	NSMutableDictionary *variablesMe = [NSMutableDictionary dictionaryWithCapacity:3];
	[variablesMe setObject:[NSString stringWithFormat:@"I would like to share this Real Estate search app: pocketListings provided by my Realtor %@ %@.\n\nTo Download the FREE app click here: http://spreadyourbrand.com/profile.php?code=%@",appDelegate.agentFirstName,appDelegate.agentLastName,[defaults objectForKey:@"UserID"]] forKey:@"message"];
	
	if(![appDelegate.agentFacebookUrl isEqualToString:@"--"])
	{
		[variablesMe setObject:appDelegate.agentFacebookUrl forKey:@"link"];
		[variablesMe setObject:appDelegate.agentFacebookUrl forKey:@"name"];
	}
	else {
		[variablesMe setObject:@"http://www.facebook.com/pages/PocketListings/142806925766789" forKey:@"link"];
		[variablesMe setObject:@"PocketListings" forKey:@"name"];
	}

 	
	[fbGraph doGraphPost:@"me/feed" withPostVars:variablesMe];
	
//	SBJSON *parser = [[SBJSON alloc] init];
//	NSDictionary *facebook_response = [parser objectWithString:fb_graph_response.htmlResponse error:nil];	
//	[parser release];
//	
//	//let's save the 'id' Facebook gives us so we can delete it if the user presses the 'delete /me/feed button'
//	self.feedPostId = (NSString *)[facebook_response objectForKey:@"id"];
//	
//	
//	[fbGraph doGraphPost:[NSString stringWithFormat:@"%@/likes",self.feedPostId] withPostVars:nil];
	
	
	//[fbAgent logout];
//	[defaults setBool:YES forKey:@"isFBPosted"];
//	
//	btnFBClose.hidden = FALSE;
//	fbView.hidden = FALSE;
//	viewFB.hidden = FALSE;
//	[lblMSG setHidden:NO];
	
//	NSString *embedHTML = @"\
//	<html><head>\
//	<style type=\"text/css\">\
//	body {\
//	background-color: transparent;\
//	color: white;\
//	}\
//	</style>\
//	<script src=\"http://connect.facebook.net/en_US/all.js#xfbml=1\"></script><fb:like-box href=\"http://www.facebook.com/apps/application.php?id=109689609101858\" width=\"320\" connections=\"10\" stream=\"false\" header=\"true\"></fb:like-box>\
//	</head><body style=\"margin:0\">\
//	</body></html>";
//	
//	fbView.delegate = self;
//	[fbView loadHTMLString:embedHTML baseURL:nil];
//	
//	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(FBClose:)];
	
	[defaults setBool:YES forKey:@"isFBPosted"];
	
//	if(appDelegate.currentDevOS >= 4)
//	{
//		NSDictionary *dictionary = 
//		[NSDictionary dictionaryWithObjectsAndKeys:[defaults objectForKey:@"UserID"],@"MTAG",nil];
//		[FlurryAPI logEvent:@"SHARE_FACEBOOK_EVENT" withParameters:dictionary];		
//	}
	
	
	UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Message posted to your wall." message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alertView show];
	[alertView release];
	
	self.navigationItem.rightBarButtonItem = nil;
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
	//[appDelegate showActivityViewer];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
	//[appDelegate performDismiss:0];
}
- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType 
{
//	NSURL *url = request.URL;
//	NSString *urlLink = url.absoluteString;
//	NSLog(@"FB Link: %@",urlLink);
//	
//	if ([urlLink rangeOfString:@"http://www.facebook.com/connect/uiserver.php?method=opt.inlike"].location != NSNotFound || [urlLink rangeOfString:@"http://www.facebook.com/widgets/popup_closer.php?reload=1"].location != NSNotFound)
//	{
//		NSString *embedHTML = @"\
//		<html><head>\
//		<style type=\"text/css\">\
//		body {\
//		background-color: transparent;\
//		color: white;\
//		}\
//		</style>\
//		<script src=\"http://connect.facebook.net/en_US/all.js#xfbml=1\"></script><fb:like-box href=\"http://www.facebook.com/apps/application.php?id=109689609101858\" width=\"320\" connections=\"10\" stream=\"false\" header=\"true\"></fb:like-box>\
//		</head><body style=\"margin:0\">\
//		</body></html>";
//		
//		webView.delegate = self;
//		[webView loadHTMLString:embedHTML baseURL:nil];
//	}
		
	return YES;   
}

- (IBAction) FBClose:(id)sender
{
	btnFBClose.hidden = TRUE;
	fbView.hidden = TRUE;
	viewFB.hidden = TRUE;
	self.navigationItem.rightBarButtonItem = nil;
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
