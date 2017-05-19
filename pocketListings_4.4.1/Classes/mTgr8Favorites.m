//
//  mTgr8Favorites.m
//  pocketListings
//
//  Created by Kaustubh Chavan on 9/27/10.
//  Copyright 2010 Xoriant Corporation. All rights reserved.
//

#import "mTgr8Favorites.h"
#import "pocketListingsAppDelegate.h"
#import "SearchCell.h"
#import "mTgr8-PropertyDetailViewController.h"
#import "MapViewController.h"
#import "AppUtils.h"
#import "Properties.h"
#import "Photo.h"
#import "MapViewController.h"
//#import "FlurryAPI.h"


@implementation mTgr8Favorites
int responseCount = 0;

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
	
	NSArray *segmentTextContent = [NSArray arrayWithObjects:@"MAP", @"LIST", nil];
	//NSLocalizedString(@"MAP", @""),
	//NSLocalizedString(@"LIST", @"A"),
	//nil];
    segmentedControl = [[UISegmentedControl alloc] initWithItems:segmentTextContent];
    segmentedControl.selectedSegmentIndex = 1;
    segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    segmentedControl.frame = CGRectMake(0, 0, 100, 31);
	[segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithCustomView:segmentedControl];
	
	self.navigationItem.leftBarButtonItem = item;
	
	
//	if(appDelegate.arrFavorite.count < 1 )
    if(appDelegate.arrFavorite.count < 1 || appDelegate.arrFavorite.count != appDelegate.arrFavStore.count )    
	{
//		[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
//		[appDelegate showActivityViewer];
//		
//		[NSThread detachNewThreadSelector:@selector(fetchData) toTarget: self withObject: nil];
		
//		[appDelegate fetchFavPro];
		
	}
	
	
	
	
	mailSubject = [[NSMutableString alloc]init];
	mailBody = [[NSMutableString alloc]init];
	sendImgURL = [[NSMutableString alloc]init];
	
    [super viewDidLoad];
}

- (void) makeData
{
	
	mailSubject = [[NSMutableString alloc]init];
	mailBody = [[NSMutableString alloc]init];
	sendImgURL = [[NSMutableString alloc]init];
	
}


- (void)segmentAction:(id)sender
{
	
	
	
	segmentedControl = sender;
	//NSLog(@"segment clicked %d", [segmentedControl selectedSegmentIndex]);
	
	if([segmentedControl selectedSegmentIndex]==0)
	{
		[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		[appDelegate showActivityViewer];
		//[self segmentCall];
		[self performSelector:@selector(segmentCall)  withObject:nil afterDelay:1.0];
	}
	
}

- (void) segmentCall
{
	if ([appDelegate.arrFavorite count]>0) 
	{
		//			if(appDelegate.isCurrentLocation)
		//			{
		NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
		
		//[self showLoading];
		
		//[NSThread detachNewThreadSelector:@selector(showActivityViewer) toTarget:appDelegate withObject: nil];
		
		MapViewController *objMapViewController = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
		objMapViewController.propertyData = appDelegate.arrFavorite;
		[self.navigationController pushViewController:objMapViewController animated:YES];
		[objMapViewController release];
		[pool drain];
		
		//[appDelegate performDismiss:0];
		//			}
		//			else {
		//				
		//				segmentedControl.selectedSegmentIndex = 1;
		//				UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Current location is not available..!!" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		//				[alertView show];
		//				[alertView release];
		//			}
	}
	else {
		
		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
		[appDelegate performDismiss:0];
		segmentedControl.selectedSegmentIndex = 1;
	}
	
}

-(void) showLoading
{
	[appDelegate showActivityViewer];
}


-(void)viewWillAppear:(BOOL)animated{
	
	segmentedControl.selectedSegmentIndex = 1;
	[tbFavorite reloadData];
    [tbFavorite setNeedsLayout];
	
	if(appDelegate.arrFavStore.count > 0)
	{
		self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(shareOptions)];
		
		[segmentedControl setUserInteractionEnabled:YES];
		[segmentedControl setHidden:NO];
	}
	else {
		
		[segmentedControl setUserInteractionEnabled:NO];
		[segmentedControl setHidden:YES];
		
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"You have no saved favorites." message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
		[alert release];
		self.navigationItem.rightBarButtonItem = nil;
	}
    
   [tbFavorite layoutIfNeeded];
//    [tbFavorite reloadData]; 
	
//	[appDelegate fetchFavPro];
}


- (void) shareOptions
{
	UIActionSheet *action = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:[NSString stringWithFormat:@"Send To %@",appDelegate.agentFirstName],@"Send To Friend",nil];
	[action showFromTabBar:appDelegate.tabController.tabBar];
	[action release];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex 
{
	if(buttonIndex == 1)
	{
		mailTo = @"";
		//mailSubject = [NSString stringWithFormat:@"MLS# %@", objProperty.listingId_var];
		mailBody = [[NSMutableString alloc]init];
		[self prepareBody:buttonIndex];
		mailBody = [NSMutableString stringWithFormat:@"I would like to share following Listings:<br/><br/>%@<br/><br/>%@",mailBody,[appDelegate getStandardEmailFooter]];
		
//		if(appDelegate.currentDevOS >= 4)
//		{
//			NSDictionary *dictionary = 
//			[NSDictionary dictionaryWithObjectsAndKeys:[defaults objectForKey:@"UserID"],@"MTAG",nil];
//			[FlurryAPI logEvent:@"FAVORITES_PAGE_SEND_FRIEND_EMAIL_EVENT" withParameters:dictionary];		
//						
//		}
		
		[self sendMail];
		
	}
	else if(buttonIndex == 0)
	{
		mailTo = appDelegate.agentEmail;
		//mailSubject = [NSString stringWithFormat:@"MLS# %@",listingID];
		//mailBody = [NSString stringWithFormat:@"I am interested in learning more details about this listing: %@",listingAdd];
		
		mailBody = [[NSMutableString alloc]init];
		[self prepareBody:buttonIndex];
		mailBody = [NSMutableString stringWithFormat:@"I am interested in learning more details about following listings:<br/><br/>%@<br/><br/>%@",mailBody,[appDelegate getStandardEmailFooter]];
		
//		if(appDelegate.currentDevOS >= 4)
//		{
//			NSDictionary *dictionary = 
//			[NSDictionary dictionaryWithObjectsAndKeys:[defaults objectForKey:@"UserID"],@"MTAG",nil];
//			[FlurryAPI logEvent:@"FAVORITES_PAGE_SEND_AGENT_EMAIL_EVENT" withParameters:dictionary];
//			
//		}
		
		[self sendMail];
		
	}
}

- (void) prepareBody:(NSInteger)buttonIndex
{
	for(int p = 0; p < appDelegate.arrFavorite.count; p++)
	{
		//Property *objProperty = [[Property alloc]init];
		Property *objProperty = nil;//[Property alloc]; //01/07
		objProperty = [appDelegate.arrFavorite objectAtIndex:p];
		
		NSString *fullAdd = objProperty.fullAddress_var;
		fullAdd = fullAdd!=nil?fullAdd:@"";
		
		NSString* city  = objProperty.city_var;
//		city = [appDelegate cityName:city];
		city = city!=nil?city:@"";
		NSString *stateOrProvince=objProperty.state_var;
		stateOrProvince = stateOrProvince!=nil?stateOrProvince:@"";
		NSString *postalCode=objProperty.zip_var;
		postalCode = postalCode!=nil?postalCode:@"";
		
		
		NSString *fBath = objProperty.fullBathrooms_var;
		fBath = fBath!=nil?fBath:@"--";
		NSString *hBath = objProperty.halfBathrooms_var;
		hBath = hBath!=nil?hBath:@"--";
		NSString *bed = objProperty.bedrooms_var;
		bed = bed!=nil?bed:@"--";
		
		NSString* propertySubtype  = objProperty.exteriorFeatures_var;
		propertySubtype = propertySubtype!=nil?propertySubtype:@"--";
		
		NSString *strSqFT;
		if(objProperty.sqFt_var != nil)
			strSqFT = [NSString stringWithFormat:@"%@ sq.ft.", objProperty.sqFt_var];
		else {
			strSqFT = @"-- sq.ft.";
		}
        
        NSString* fburl=[NSString stringWithFormat:@"http://spreadyourbrand.com/fbsearch/fbprint.php?id=%@&mtag=%@",objProperty.listingId_var,[appDelegate.agentData mTag_var]];
        NSString* moreDetails=[NSString stringWithFormat:@"<a href='%@'>More Details...</a>",fburl];
		
		NSMutableString *sendDetails = [NSString stringWithFormat:@"MLS# %@<br/>%@<br/>%@<br/>$%@<br/>%@ %@<br/>%@<br/>%@",objProperty.listingId_var,fullAdd,
								 [NSString stringWithFormat:@"%@ %@ %@",city,stateOrProvince,postalCode],objProperty.listPrice_var
								 ,[NSString stringWithFormat:@"%@ Bed/(%@F,%@H) Bath", bed,fBath,hBath],strSqFT,propertySubtype,moreDetails];
	
		NSString *strNotes = [defaults objectForKey:objProperty.listingId_var];
		

			if(strNotes.length > 2)
			{
				[mailBody appendFormat:@"%i) %@<br/><br/>Notes:%@<br/><br/><br/>",p+1,sendDetails,strNotes];
			}
			else
			{
				[mailBody appendFormat:@"%i) %@<br/><br/><br/>",p+1,sendDetails];
			}
		
	}
}

- (void) sendMail
{
	//[mailSubject appendFormat:@"My Favorites"];
	
	mailSubject = [NSMutableString stringWithFormat:@"My Favorites"];
	
	//Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
	
	
	if ([MFMailComposeViewController canSendMail])
	{
		MFMailComposeViewController *composeVC = [[MFMailComposeViewController alloc] init];
		composeVC.mailComposeDelegate = self;
		[composeVC setSubject:mailSubject];
		
		if(![mailTo isEqualToString:@""])
		{
			NSArray *arrTo = [NSArray arrayWithObject:mailTo];
			[composeVC setToRecipients:arrTo];
		}

		[composeVC setMessageBody:mailBody isHTML:YES];
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	return 100;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return appDelegate.arrFavorite.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

		//static NSString *CellIdentifier = @"searchCell";
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"searchCell"];
		if (cell == nil) {
			cell = [[SearchCell alloc] initFromResource];
		}
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator ;
        
		[cell setCellObject:[appDelegate.arrFavorite objectAtIndex:indexPath.row]];
        return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	mTgr8_PropertyDetailViewController *objDetail = [[mTgr8_PropertyDetailViewController alloc] initWithNibName:@"mTgr8-PropertyDetailViewController" bundle:nil];
	objDetail.objProperty = [appDelegate.arrFavorite objectAtIndex:indexPath.row];
	[self.navigationController pushViewController:objDetail animated:NO];
	[objDetail release];
	
	[tbFavorite deselectRowAtIndexPath:indexPath animated:YES];
}

//-(void)propertiesFromServer:(NSString *)ListingId
//{
//	//[self showActivityViewer];
//	//NSString* urlStr=[NSString stringWithFormat:@"http://getyouridx.agentstorm.com/properties.xml?apikey=%@&limit=20&sort=ListPrice&sort_direction=DESC&Bedrooms=2+&FullBaths=2+",self.API_KEY];
//
//	NSString* urlStr=[NSString stringWithFormat:@"%@?apikey=%@&limit=%i&ListingId=%@&%@",appDelegate.searchURL,appDelegate.API_KEY,appDelegate.arrFavStore.count,ListingId,[appDelegate getListingStatus]];
//	urlStr = [urlStr stringByReplacingOccurrencesOfString:@"+" withString:@"%2B" options:NSBackwardsSearch range:NSMakeRange(0, [urlStr length])];
//	urlStr = [urlStr stringByReplacingOccurrencesOfString:@" " withString:@"%20" options:NSBackwardsSearch range:NSMakeRange(0, [urlStr length])];
//	//NSLog(@"url: %@",urlStr);
//
//	[appDelegate startTimeOut];
//
//	NSURL *serviceURL = [NSURL URLWithString:urlStr];
//	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:serviceURL];
//
//	[urlRequest setHTTPMethod:@"GET"];
//	[urlRequest addValue: @"iPhone" forHTTPHeaderField:@"User-Agent"];
//	[urlRequest addValue: @"keep-alive" forHTTPHeaderField:@"Connection"];
//	[urlRequest addValue: @"GET" forHTTPHeaderField:@"Method"];
//	[urlRequest addValue: @"*/*" forHTTPHeaderField:@"Accept"];
//
//	[AppUtils requestServer:urlRequest resultTarget:self targetFunction:@selector(propertiesCallback:delegate:)];
//}

-(void) propertiesCallback:(id)document delegate:(id)delegate{
	
	if(!appDelegate.isTimeOut)
	{
		[appDelegate invalidTimer];
	if(delegate!=nil){
		[document retain];
		[delegate retain];
		if(![[XMLUtil getXMLStringValue:@"@count" inNode:[document rootElement]] isEqual: @"0"]) //leak
		{
			//totalProperties = [[XMLUtil getXMLStringValue:@"@totalcount" inNode:[document rootElement]]retain];
			Properties* properties = [[[Properties alloc] initWithXML:[document rootElement]] autorelease]; //leak
			[appDelegate.arrFavStore removeAllObjects];
			for(int i=0;i<properties.property_var.count;i++){
				id aI = [[properties property_var] objectAtIndex:i];
				[appDelegate.arrFavorite addObject:aI];
			}
			//[appDelegate.arrFavorite addObject:[properties.property_var objectAtIndex:0]];
			[tbFavorite reloadData];
			[appDelegate performDismiss:0];
			//[properties release]; //10/05
		}
		else{
			
			[appDelegate performDismiss:0];
			UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"No response from server. Please try again later." message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[alertView show];
			[alertView release];
		}
		
	}else{
	
		[appDelegate performDismiss:0];
		UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"No response from server. Please try again later." message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alertView show];
		[alertView release];
	}
//		responseCount ++;
//	
		if(appDelegate.arrFavStore.count != appDelegate.arrFavorite.count)
		{
			[appDelegate.arrFavStore removeAllObjects];
				for (int j = 0; j < appDelegate.arrFavorite.count; j++)
				{
					Property *objPro = [appDelegate.arrFavorite objectAtIndex:j];
					[appDelegate.arrFavStore addObject:objPro.listingId_var];
				}
		}
		
	}
		
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
