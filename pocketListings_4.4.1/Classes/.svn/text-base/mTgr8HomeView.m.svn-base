//
//  mTgr8HomeView.m
//  idx
//
//  Created by Kaustubh Chavan on 30/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "mTgr8HomeView.h"
#import "pocketListingsAppDelegate.h"
#import "mTgr8MyCriteria.h"
#import "mTgr8SearchHistory.h"
#import "T_brandingData.h"
#import "mTgr8AccessCode.h"
//#import "FlurryAPI.h"


@implementation mTgr8HomeView
@synthesize arrService,userData;
/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
 // Custom initialization
 }
 return self;
 }
 */

- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) {
		//self.searchItems = [[NSMutableArray alloc] init];
    }
    return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		//searchItems = [[NSMutableDictionary alloc] init];
		userData = [[T_brandingData alloc]init]; //leak 11/12
    }
    return self;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	appDelegate = (pocketListingsAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	[appDelegate.window addSubview:appDelegate.tabController.view];
	
	defaults = [NSUserDefaults standardUserDefaults];
	
	if(!appDelegate.isSecond)
	{
		appDelegate.isSecond = YES;
		appDelegate.agentData = [[T_brandingData alloc]init]; //leak 11/12
		appDelegate.agentData = userData;
	}
	else
	{
		userData = appDelegate.agentData;
	}
	
	self.navigationItem.hidesBackButton = YES;
    
    NSString *strFirstName = userData.agentFName_var;
	strFirstName = strFirstName!=nil?strFirstName:@"";
    
//    NSString* agtListingVar = [NSString stringWithFormat:@"%@'s Listings",strFirstName];
//	
//	arrService = [[NSMutableArray alloc]initWithObjects:@"Find Homes",agtListingVar,@"My Criteria",nil]; //leak 11/12
	
	
	
	NSString *strLastName = userData.agentLName_var;
	strLastName = strLastName!=nil?strLastName:@"";
	
	lblUserName.text = [[NSString stringWithFormat:@"%@ %@", strFirstName,strLastName]retain];
	
	NSString *strUsrLic = userData.agentLic_var;
	strUsrLic = strUsrLic!=nil?strUsrLic:@"";
	lblUserLic.text = [[NSString stringWithFormat:@"Lic: %@", strUsrLic]retain];
	
	lblOffName.text = userData.officeName_var;
	lblOffName.text = lblOffName.text!=nil?lblOffName.text:@"";
	
	NSString *strOffLic = userData.officeLic_var;
	strOffLic = strOffLic!=nil?strOffLic:@"";
	lblOffLic.text = [[NSString stringWithFormat:@"Lic: %@", strOffLic]retain];
	
	NSString *strVanityText = userData.vanityText_var;
	strVanityText = strVanityText!=nil?strVanityText:@"";
	lblVanityText.text = strVanityText;
	
	[defaults setObject:userData.agentId_var forKey:@"AgentId"];
	[defaults synchronize];
	
	if(userData.agentImage_var.length > 0)
	{
		NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:userData.agentImage_var]];
		appDelegate.imgData = imgData;
		if(imgData > 0)
		{
			imgAgent.image = [UIImage imageWithData:imgData];
		}
		else 
		{
			imgAgent.image = [UIImage imageNamed:@"agent_image_notavailable.png"];
		}

	}
	else
	{
		imgAgent.image = [UIImage imageNamed:@"agent_image_notavailable.png"];
	}
	
	
	
	[btnContact setTitle:[NSString stringWithFormat:@"Contact %@",strFirstName] forState:UIControlStateNormal];
	//self.navigationItem.title = @"Pocket Listings";
	
	appDelegate.agentContact = userData.agentPhone_var;
	appDelegate.agentEmail = userData.agentEmail_var;
	appDelegate.agentFirstName = strFirstName;
	appDelegate.agentLastName = strLastName;
	appDelegate.agentOff = lblOffName.text;
	appDelegate.offLogoData = [NSData dataWithContentsOfURL:[NSURL URLWithString:userData.officeLogoURL_var]];
	appDelegate.searchURL = userData.agentFeedURL_var;
	appDelegate.agentOffImage = userData.officeImage_var;
	appDelegate.agentFeedName = userData.agentFeedName_var;
	appDelegate.agentFacebookUrl = userData.facebookUrl_var;
	appDelegate.agentFacebookUrl = appDelegate.agentFacebookUrl!=nil?appDelegate.agentFacebookUrl:@"--";
	appDelegate.agentZip = userData.zipCode_var;
	appDelegate.agentZip = appDelegate.agentZip!=nil?appDelegate.agentZip:@"";
	
	if ([appDelegate.agentZip isEqualToString:@"0"]) {
		appDelegate.agentZip=@"";
	}
	else {
		
		NSString *strZip = [defaults objectForKey:@"zipCode"];
		
		if(strZip == nil)
		{
			[defaults setObject:appDelegate.agentZip forKey:@"zipCode"];
			[defaults synchronize];
		}
	}

	//[appDelegate showActivityViewer];
	
	//[appDelegate fetchFavPro];
	
//	[appDelegate fetchCityState];
//	
//	[appDelegate fetchPropertyType];
	
	//[appDelegate performDismiss:0];
	
//	NSString *temp = [appDelegate cityID:@"Watsonville"];
	
	if(appDelegate.offLogoData > 0)
	{
		CGRect appRect = [[UIScreen mainScreen] applicationFrame];
		appRect.origin = CGPointMake(0.0f,0.0f);
		UIView *MainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300.0f , 50.0f)];
		UIImageView *imageContents =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
		[imageContents setBackgroundColor:[[[UIColor alloc]initWithRed:0.28 green:0.43 blue:0.17 alpha:0] autorelease]]; //leak 11/12
		[imageContents setImage:[UIImage imageWithData:appDelegate.offLogoData]]; // :@"pocketListings.png"]];
		[imageContents setContentMode:UIViewContentModeScaleAspectFit];
		CGRect imgFrame = imageContents.frame;
		imgFrame.origin = CGPointMake(50,5);
		imageContents.frame = imgFrame;
		[MainView addSubview:imageContents];
		[imageContents release];
		
		  self.navigationItem.titleView = MainView;
	}


	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
  
	[self checkAgentPropsInServer];
	
    [super viewDidLoad];
}


-(IBAction)Contact:(id)sender
{
	[self actionSheetShow];
	
}

- (void)actionSheetShow
{
	CGRect frame = CGRectMake(0, 0, 320, 230);
	UIImageView *imgBng = [[UIImageView alloc] initWithFrame:frame];
	[imgBng setImage:[UIImage imageNamed:@"background.png"]];
	[imgBng setAlpha:0.8];
	
	actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
	
	UIButton *btnEmail = [[UIButton alloc]initWithFrame:CGRectMake(20, 20, 82, 75)];
	[btnEmail setImage:[UIImage imageNamed:@"icon_email.png"] forState:UIControlStateNormal];
	[btnEmail addTarget:self action:@selector(SendEmail) forControlEvents:UIControlEventTouchUpInside];
	if(appDelegate.agentEmail.length > 0)
	{
		[btnEmail setEnabled:YES];
	}
	else
	{
		[btnEmail setEnabled:NO];
	}
	
	UIButton *btnText = [[UIButton alloc] initWithFrame:CGRectMake(120, 20, 82, 75)];
	[btnText setImage:[UIImage imageNamed:@"icon_text.png"] forState:UIControlStateNormal];
	[btnText addTarget:self action:@selector(SendText) forControlEvents:UIControlEventTouchUpInside];
	if(appDelegate.agentContact.length > 0)
	{
		[btnText setEnabled:YES];
	}
	else
	{
		[btnText setEnabled:NO];
	}
	
	UIButton *btnCall = [[UIButton alloc] initWithFrame:CGRectMake(220, 20, 82, 75)];
	[btnCall setImage:[UIImage imageNamed:@"icon_call.png"] forState:UIControlStateNormal];
	[btnCall addTarget:self action:@selector(Call) forControlEvents:UIControlEventTouchUpInside];
	if(appDelegate.agentContact.length > 0)
	{
		[btnCall setEnabled:YES];
	}
	else
	{
		[btnCall setEnabled:NO];
	}
	
	UIButton *btnCancel = [[UIButton alloc] initWithFrame:CGRectMake(15, 140, 291, 43)];
	[btnCancel setImage:[UIImage imageNamed:@"btn_Cancel.png"] forState:UIControlStateNormal];
	[btnCancel addTarget:self action:@selector(CancelAction) forControlEvents:UIControlEventTouchUpInside];
	
	
	[actionSheet addSubview:imgBng];
	[actionSheet addSubview:btnEmail];
	[actionSheet addSubview:btnText];
	[actionSheet addSubview:btnCall];
	[actionSheet addSubview:btnCancel];
	[actionSheet showFromTabBar:appDelegate.tabController.tabBar];
	[actionSheet setBounds:CGRectMake(0,0,320, 420)];
	
	[imgBng release];
	[btnEmail release];
	[btnText release];
	[btnCall release];
	[btnCancel release];
	
	
}

- (void)SendEmail
{
	[self CancelAction];
	NSString *to;
	if(appDelegate.agentEmail.length > 0)
	{
		to = appDelegate.agentEmail;
	}
	else
	{
		to = @"nshukla@mtgr8.com";
	}
	
//	if(appDelegate.currentDevOS >= 4)
//	{
//		NSDictionary *dictionary = 
//		[NSDictionary dictionaryWithObjectsAndKeys:[defaults objectForKey:@"UserID"],@"MTAG",nil];
//		[FlurryAPI logEvent:@"MAIN_PAGE_EMAIL_EVENT" withParameters:dictionary];		
//	}
	
	NSString *subject;
	NSString *body;
	
		subject = @"pocketListings";
		body = [NSString stringWithFormat:@"<br/><br/>%@",[appDelegate getStandardEmailFooter]];

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
- (void)SendText
{
	[self CancelAction];
	NSString *telString;
	
	if(appDelegate.agentContact.length > 0)
	{
		telString = [NSString stringWithFormat:@"sms:%@",appDelegate.agentContact];
	}
	else
	{
		telString = [NSString stringWithFormat:@"sms:408-832-8904"];
	}
	
//	if(appDelegate.currentDevOS >= 4)
//	{
//		NSDictionary *dictionary = 
//		[NSDictionary dictionaryWithObjectsAndKeys:[defaults objectForKey:@"UserID"],@"MTAG",nil];
//		[FlurryAPI logEvent:@"MAIN_PAGE_SMS_EVENT" withParameters:dictionary];		
//	}
	
	if(![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:telString]]){
		NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
		UIAlertView *progressAlert = [[UIAlertView alloc] initWithTitle:@""
																message: @"Could not find an application to SMS, Sim may not be inserted."
															   delegate: self
													  cancelButtonTitle: nil
													  otherButtonTitles: @"Ok",nil];
		
		[progressAlert show];
		[progressAlert release];
		[pool drain];
		
	}
	else
	{
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:telString]];
	}
}
- (void)Call
{
	
	
	[self CancelAction];
	NSString *telString;
	
	if(appDelegate.agentContact.length > 0)
	{
		telString = [NSString stringWithFormat:@"tel:%@",appDelegate.agentContact];
	}
	else
	{
		telString = [NSString stringWithFormat:@"tel:408-832-8904"];
	}
	//NSString *telString = [NSString stringWithFormat:@"tel:408-832-8904"];
	
//	if(appDelegate.currentDevOS >= 4)
//	{
//		NSDictionary *dictionary = 
//		[NSDictionary dictionaryWithObjectsAndKeys:[defaults objectForKey:@"UserID"],@"MTAG",nil];
//		[FlurryAPI logEvent:@"MAIN_PAGE_CALL_EVENT" withParameters:dictionary];		
//	}
	
	if(![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:telString]]){
		NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
		UIAlertView *progressAlert = [[UIAlertView alloc] initWithTitle:@""
																message: @"Could not find an application to Call, Sim may not be inserted."
															   delegate: self
													  cancelButtonTitle: nil
													  otherButtonTitles: @"Ok",nil];
		
		[progressAlert show];
		[progressAlert release];
		[pool drain];
		
	}
	else
	{
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:telString]];
	}
	
}

- (void)CancelAction
{
	[actionSheet dismissWithClickedButtonIndex:0 animated:YES];	
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

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex 
{
	if(buttonIndex == 0)
	{
				
	}
	else if(buttonIndex == 1)
	{
		
	}
	else if(buttonIndex == 2)
	{
			}
}

#pragma mark -
#pragma mark Table view data source



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return arrService.count;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	}
	
	// Configure the cell...
	//cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
	UIImageView *imgView = [[[UIImageView alloc]initWithFrame:CGRectMake(260, 5, 38, 32)]autorelease];
	imgView.image = [UIImage imageNamed:@"Picture1_right.png"];
	[cell addSubview:imgView];
 	cell.textLabel.text = [arrService objectAtIndex:indexPath.row];
	[cell setSelectionStyle:UITableViewCellSelectionStyleGray];
	
	
	return cell;
	
	
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSString *str = [arrService objectAtIndex:indexPath.row];
	
	[defaults setObject:@"Home" forKey:@"NavigateFrom"];
	[defaults synchronize];
	
	if([str isEqualToString:@"Find Homes"])
	{
		
		appDelegate.isSearchTab = NO;
		appDelegate.isHistory = NO;
        appDelegate.isAgtListing = NO;
        
//		if([defaults boolForKey:@"isMLSLast"])
//		{
//			appDelegate.historyMLS = [defaults objectForKey:@"MLSHistory"];
//			//isIdSearch = YES;
//			appDelegate.isSearchMap = NO;
//			[appDelegate MLSFromServer:appDelegate.historyMLS];
//		}
//		else
		{
			appDelegate.isSearchMap = YES;
			[appDelegate propertiesFromServer];
		}
			
	}
    else if([str isEqualToString:@"Search History"])
	{
		appDelegate.isSearchTab = YES;
		mTgr8SearchHistory *objHistory = [[mTgr8SearchHistory alloc] initWithNibName:@"mTgr8SearchHistory" bundle:nil];
		[self.navigationController pushViewController:objHistory animated:YES];
		[objHistory release];
	}
	else if([str rangeOfString:@"Listings"].location != NSNotFound)
	{
		appDelegate.isAgtListing = YES;
        appDelegate.isSearchTab = NO;
		appDelegate.isHistory = NO;
        appDelegate.isRegionSearch= NO;
        
        NSString* feedName= appDelegate.agentData.agentFeedName_var;
        NSString* listingAgentLic = nil;
        if( [feedName isEqualToString:@"mlslistings"] || [feedName isEqualToString:@"mlslidx"]){
           listingAgentLic = [NSString stringWithFormat:@"ListingAgentLic=%@",[userData agentLic_var]]; 
        }else{
            listingAgentLic = [NSString stringWithFormat:@"ListingAgentLic=%@",[userData agentLogin_var]];
        }
        
        [appDelegate propertiesFromServer:listingAgentLic];
        
	}
	else if([str isEqualToString:@"My Criteria"])
	{
		appDelegate.isHistory = NO;
		mTgr8MyCriteria *objCriteria = [[mTgr8MyCriteria alloc] initWithNibName:@"mTgr8MyCriteria" bundle:nil];
		[self.navigationController pushViewController:objCriteria animated:YES];
		[objCriteria release];
		
	}
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
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

-(void) checkAgentPropsInServer{
    NSString* feedName= appDelegate.agentData.agentFeedName_var;
    NSString * status = appDelegate.agentData.status_var;
    if (![status isEqualToString:@"Demo"]){
    NSString* listingAgentLic = nil;
    if( [feedName isEqualToString:@"mlslistings"] || [feedName isEqualToString:@"mlslidx"]){
        listingAgentLic = [NSString stringWithFormat:@"ListingAgentLic=%@",[userData agentLic_var]]; 
    }else{
        listingAgentLic = [NSString stringWithFormat:@"ListingAgentLic=%@",[userData agentLogin_var]];
    }
    
    [appDelegate agentPropsFromServer:listingAgentLic resultTarget:self targetFunction:@selector(agentPropertiesCallback:delegate:)];
    }
}

-(void) agentPropertiesCallback:(id)document delegate:(id)delegate{
	
	if(delegate!=nil){
			[document retain];
			[delegate retain];
            [appDelegate performDismiss2:nil];
			if(![[XMLUtil getXMLStringValue:@"@count" inNode:[document rootElement]] isEqual: @"0"]) //leak
			{
                NSString *strFirstName = userData.agentFName_var;
                strFirstName = strFirstName!=nil?strFirstName:@"";
                
                NSString* agtListingVar = [NSString stringWithFormat:@"%@'s Listings",strFirstName];
                
                arrService = [[NSMutableArray alloc]initWithObjects:@"Find Homes",agtListingVar,@"My Criteria",nil]; //leak 11/12

            }else{
                arrService = [[NSMutableArray alloc]initWithObjects:@"Find Homes",@"Search History",@"My Criteria",nil]; //leak 11/12

            }
        [tableView reloadData];
    }
}


@end
