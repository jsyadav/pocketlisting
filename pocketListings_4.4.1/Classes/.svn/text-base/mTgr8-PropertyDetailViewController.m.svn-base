#import "mTgr8-PropertyDetailViewController.h"
#import "Photo.h"
#import "Property.h"
#import "pocketListingsAppDelegate.h"
#import "PageViewController.h"
#import "mTgr8DateSelector.h"
#import <QuartzCore/QuartzCore.h>
#import "TBXML.h"
#import "NSDataAdditions.h"
#import "Utils.h"
#import "webViewController.h"
#import "MortgageViewController.h"
#import "MyAnnotation.h"
#import "TouchView.h"
#import "OpenHouse.h"
#import "AppUtils.h"
#import "SchoolAnnotation.h"
#import "SchoolDetail.h"
#import "MoreInfoView.h"

@implementation AddressAnnotation

@synthesize coordinate;

- (NSString *)subtitle{
	return @"";
}
- (NSString *)title{
	return @" ";
}

-(id)initWithCoordinate:(CLLocationCoordinate2D) c{
	coordinate=c;
	//NSLog(@"%f,%f",c.latitude,c.longitude);
	return self;
}

@end

@implementation mTgr8_PropertyDetailViewController

CATransition *animation;
NSString * const DM_ANNOTATION_SELECTED = @"dmselected";

@synthesize tableView,objProperty,annot,moreInfoView;
@synthesize block1Cell,remarkCell,areaCell,areaMoreCell,schoolsCell,schoolsMoreCell,listingDetailsCell,listingDetailsMoreCell,otherCell,otherMoreCell,sendToFriendCell,
pictureCell,sendDetails,disclaimerCell,mapView,touchView,myPhotoCell;
@synthesize isAreaExpanded,isSchoolsExpanded,isListingDetailsExpanded,isOtherExpanded,propertyData,detailsCell,isNotesHide, lblZoning;
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
	
    [super viewDidLoad];
    
//    touchView = [[TouchView alloc] initWithFrame:CGRectMake(0, 0, 320, 373)];
	touchView.delegate = self;
	touchView.callAtHitTest = @selector(stopFollowLocation);
    
//    [touchView addSubview:mapView];
    
}

-(void)viewWillAppear:(BOOL)animated{
	
//	if(!appDelegate.isSkip)
	{
		arrImgData = [[NSMutableArray alloc]init]; //leak 11/12
		defaults = [NSUserDefaults standardUserDefaults];
		
		appDelegate = (pocketListingsAppDelegate *)[[UIApplication sharedApplication] delegate];
		
		txtNotes.text = [defaults objectForKey:objProperty.listingId_var];
		
		NSString *strContact = [NSString stringWithFormat:@"Contact %@",appDelegate.agentFirstName];
		[btnContact setTitle:strContact forState:UIControlStateNormal];
		
		if(objProperty.photos_var.photo_var.count > 0)
		{
			[activityIndicator startAnimating];
			[activityMain startAnimating];
			imgNotAv.hidden = TRUE;
			[NSThread detachNewThreadSelector:@selector(fetchImages) toTarget: self withObject: nil];
		}
		else 
		{
			
			if(segmentedControl.selectedSegmentIndex == 2)
			{
				segmentedControl.selectedSegmentIndex = 1;
				[segmentedControl removeSegmentAtIndex:2 animated:NO];
				[segmentedControl insertSegmentWithTitle:@"Photos (0)" atIndex:2 animated:NO];
				segmentedControl.selectedSegmentIndex = 2;
			}
			else {
				[segmentedControl removeSegmentAtIndex:2 animated:NO];
				[segmentedControl insertSegmentWithTitle:@"Photos (0)" atIndex:2 animated:NO];
				
			}
			
			
			isPictureHide = YES;
			//[tableView reloadData];
			imgPrimary.image = [UIImage imageNamed:@"imagenotavail85x85.png"];
			[activityMain removeFromSuperview];
			
		}
		
		
		
		//[pictureCell addSubview:pageControl];
		//[pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
		
		if(objProperty.agentName_var != nil)
		{
			lblAgentAndOfficeDetail.text = [NSString stringWithFormat:@"%@",objProperty.agentName_var];
		}
		else if( objProperty.agentFirstName_var != nil && objProperty.agentLastName_var != nil)
		{
			lblAgentAndOfficeDetail.text = [NSString stringWithFormat:@"%@ %@",objProperty.agentFirstName_var,objProperty.agentLastName_var];
		}
		else {
			lblAgentAndOfficeDetail.text = @"--";
		}
		
		
		btnImg = [[UIImageView alloc]init];
		
		
		[btnImg setContentMode:UIViewContentModeScaleAspectFit];
		[btnImg setFrame:CGRectMake(0, 0, 40, 44)];
		
		btnFav = [UIButton buttonWithType:UIButtonTypeCustom];
		[btnFav setFrame:CGRectMake(0, 0, 40, 44)];
		
		[btnFav addSubview:btnImg];	
		[btnFav addTarget:self action:@selector(addToFavorite) forControlEvents:UIControlEventTouchUpInside];			
		
		
		
		for(int	f = 0; f < appDelegate.arrFavStore.count; f++)
		{
			
			if([[appDelegate.arrFavStore objectAtIndex:f] isEqualToString:objProperty.listingId_var])
			{
				isAdded = YES;
				//isNotesHide = NO;
				btnImg.image = [UIImage imageNamed:@"remove.png"];
				break;
			}
			
			if(f == appDelegate.arrFavStore.count-1)
			{
				isAdded = NO;
				//isNotesHide = YES;
				btnImg.image = [UIImage imageNamed:@"add.png"]; //leak
				break;
			}
			
		}
		
		if(appDelegate.arrFavStore.count < 1)
		{
			isAdded = NO;
			//isNotesHide = YES;
			btnImg.image = [UIImage imageNamed:@"add.png"];
		}
		
		self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btnFav]; //leak
		
		
		[appDelegate performDismiss:0];
		
		
		[self fillData];
		
//		[NSThread detachNewThreadSelector:@selector(showMap) toTarget: self withObject: nil];
        [self showMap];
        
        self.moreInfoView.frame = CGRectMake(20.0, 30.0 - 500.0, self.moreInfoView.frame.size.width, self.moreInfoView.frame.size.height);
        [self.mapView addSubview:self.moreInfoView];
		
	}
	
//	appDelegate.isSkip = NO;
	
    [super viewWillAppear:animated];
}

- (void) fillData
{
	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
//	if (appDelegate.agentFeedName != NULL && [appDelegate.agentFeedName rangeOfString:@"solidearth"].location != NSNotFound)
//	{
//		lblZoningLabel.text = @"Type:";
//		lblCountyLabel.text = @"Subdivision:";
//	}
	
	NSString *county = objProperty.county_var;
	county = [appDelegate countyName:county];
	lblCounty.text = county;
	lblCounty.text = lblCounty.text!=nil?lblCounty.text:@"--";
	
	lblStatus.text = objProperty.status_var;
	lblStatus.text= lblStatus.text!=nil?lblStatus.text:@"--";
	
	NSString *strStyle = objProperty.style_var;
	strStyle = strStyle!=nil?strStyle:@"--";
	lblStyle.text = strStyle;
	
	lblCountry.text = objProperty.country_var;
	lblCountry.text = lblCountry.text!=nil?lblCountry.text:@"--";
	//lblCountry.text = [NSString stringWithFormat:@"Country: %@",lblCountry.text];
	
	lblLotSize.text = objProperty.lotSqFt_var;
	lblLotSize.text = lblLotSize.text!=nil?lblLotSize.text:@"--";
	
    NSString* lsUnits = objProperty.lotSizeArea_Units_var!=nil?objProperty.lotSizeArea_Units_var:@"sq.ft./Acre";
    lblLotSize.text = [NSString stringWithFormat:@"%@ %@",lblLotSize.text,lsUnits];
	
	NSString *strListingID = objProperty.listingId_var;
	strListingID = strListingID!=nil?strListingID:@"--";
	
	NSString *strListingDate = objProperty.exteriorFeatures_var;
	strListingDate = strListingDate!=nil?strListingDate:@"--";
	
	lblListingID.text = strListingID;
	lblListingDate.text = strListingDate;
	//lblListingDate.text = [lblListingDate.text stringByReplacingOccurrencesOfString:@"00:00:00" withString:@"" options:NSBackwardsSearch range:NSMakeRange(0, [lblListingDate.text length])];
	NSString *strOff = objProperty.agentCompany_var;
	strOff = strOff!=nil?strOff:@"--";
	
	NSString *strAgentF = objProperty.agentFirstName_var;
	strAgentF = strAgentF!=nil?strAgentF:@"--";
	
	NSString *strAgentL = objProperty.agentLastName_var;
	strAgentL = strAgentL!=nil?strAgentL:@"--";
	
	NSString *strOffDetail;
	if([strAgentF isEqualToString:@"--"] && [strAgentL isEqualToString:@"--"] && [strOff isEqualToString:@"--"])
	{
		strOffDetail = @"--";
	}
	else if([strAgentF isEqualToString:@"--"] && [strAgentL isEqualToString:@"--"])
	{
		strOffDetail = [NSString stringWithFormat:@"%@",strOff];
	}
	else {
		strOffDetail = [NSString stringWithFormat:@"%@ %@,\n%@",strAgentF,strAgentL,strOff];
	}
	
	strOffDetail = [strOffDetail stringByReplacingOccurrencesOfString:@"--" withString:@"" options:NSBackwardsSearch range:NSMakeRange(0, [strOffDetail length])];
	lblAgentAndOfficeDetail.text = strOffDetail;
	[lblAgentAndOfficeDetail sizeToFit];
	
	
	NSString *yrBuilt = objProperty.yearBuilt_var;
	yrBuilt = yrBuilt!=nil?yrBuilt:@"--";
	//yrBuilt = [NSString stringWithFormat:@"Year Built: %@",yrBuilt];
	
	NSString *otherRooms = objProperty.garageDescription_var;
	otherRooms = otherRooms!=nil?otherRooms:@"--";
	//garage = [NSString stringWithFormat:@"Garage: %@",garage];
	
	//txtOther.text = [NSString stringWithFormat:@"%@\n%@\n%@\n%@",yrBuilt,waterFrontLocation,garage,associationFee];
	
	lblYrBuilt.text = yrBuilt;
	lblGarage.text = otherRooms;
	
	if(otherRooms.length < 21)
	{
		[lblGarage sizeToFit];
	}
	
	NSString *zoning = objProperty.area_var;
	zoning = zoning!=nil?zoning:@"--";
	lblZoning.text = zoning;
	
	NSString* latitudeString = [objProperty.latitude_var stringValue];
	latitudeString = latitudeString!=nil?latitudeString:@"--";
	
	NSString* longitudeString = [objProperty.longitude_var stringValue];
	longitudeString = longitudeString!=nil?longitudeString:@"--";
	
	if([latitudeString isEqualToString:@"--"] || [longitudeString isEqualToString:@"--"] || [latitudeString isEqualToString:@"0"] || [longitudeString isEqualToString:@"0"])
	{
		[self getPropCoordinate:objProperty];
	}
	else {
		propCoordinate.latitude = [latitudeString doubleValue];
		propCoordinate.longitude = [longitudeString doubleValue];
	}
	//[self getWalkScore];
	
	[NSThread detachNewThreadSelector:@selector(getWalkScore) toTarget: self withObject: nil];
	
	[pool drain];
	
}


- (IBAction)CalculateMortgage:(id)sender
{
	
	[appDelegate showActivityViewer];
		[defaults setBool:YES forKey:@"isCalculate"];
		[defaults setObject:objProperty.listPrice_var forKey:@"ListPrice"];
		
	[appDelegate performSelector:@selector(MortUserDataFromServer) withObject:nil afterDelay:0.1]; //[appDelegate MortUserDataFromServer];
}




- (void) addToFavorite
{
	if(!isAdded)
	{
		isAdded = YES;
		//isNotesHide = NO;
		[appDelegate.arrFavorite addObject:objProperty];
		[appDelegate.arrFavStore addObject:objProperty.listingId_var];
		//[defaults setObject:appDelegate.arrFavStore forKey:@"FavStore"];
		btnImg.image = [UIImage imageNamed:@"remove.png"];
		
		[defaults setObject:appDelegate.arrFavStore forKey:@"FavStore"];
		

	}
	else
	{

		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning..!!" message:@"This will also remove your Notes for this property.\nDo you want to continue?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"Yes",nil];
		[alert show];
		[alert release];
	}
	
	[defaults synchronize];

}

- (IBAction)SaveNote:(id)sender
{
	if(!isAdded)
	{
		isAdded = YES;
		
		[appDelegate.arrFavorite addObject:objProperty];
		[appDelegate.arrFavStore addObject:objProperty.listingId_var];
		//[defaults setObject:appDelegate.arrFavStore forKey:@"FavStore"];
		btnImg.image = [UIImage imageNamed:@"remove.png"];
		
		[defaults setObject:appDelegate.arrFavStore forKey:@"FavStore"];
	}	
	
	[defaults setObject:txtNotes.text forKey:objProperty.listingId_var];
	
	
	
	animation = [CATransition animation];
	animation.delegate = self;
	animation.duration = 0.5f;
	animation.timingFunction = UIViewAnimationCurveEaseInOut;
	animation.type = kCATransitionPush;
	animation.subtype = kCATransitionFromTop;
	
	[[viewNotes layer] addAnimation:animation forKey:@"animation"];
	viewNotes.hidden = TRUE;
	
	[txtNotes resignFirstResponder];
	[self.tableView reloadData];
	
	[defaults synchronize];
}

- (IBAction)CancelNote:(id)sender
{
	animation = [CATransition animation];
	animation.delegate = self;
	animation.duration = 0.5f;
	animation.timingFunction = UIViewAnimationCurveEaseInOut;
	animation.type = kCATransitionPush;
	animation.subtype = kCATransitionFromTop;
	
	[[viewNotes layer] addAnimation:animation forKey:@"animation"];
	viewNotes.hidden = TRUE;
	
	[txtNotes resignFirstResponder];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex 
{
	if(buttonIndex == 0)
	{
		UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning..!!" message:@"This will also remove your Notes for this property.\nDo you want to continue?" delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"Yes",nil];
		[alert show];
		[alert release];
	}
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if([alertView.title isEqualToString:@"Warning..!!"])
	{
		if(buttonIndex == 1)
		{
			for(int	f = 0; f < appDelegate.arrFavStore.count; f++)
			{
								
				if([[appDelegate.arrFavStore objectAtIndex:f] isEqualToString:objProperty.listingId_var])
				{
					if(appDelegate.arrFavorite.count > 0)
					{
						for(int i = 0; i < appDelegate.arrFavorite.count; i++)
						{
							Property *objpro = [appDelegate.arrFavorite objectAtIndex:i];
							if([objpro.listingId_var isEqualToString:objProperty.listingId_var])
							{
								[appDelegate.arrFavorite removeObjectAtIndex:i];
							}
							
						}
						
					}
					[appDelegate.arrFavStore removeObjectAtIndex:f];
					//[defaults setObject:appDelegate.arrFavStore forKey:@"FavStore"];
					[defaults setObject:nil forKey:objProperty.listingId_var];
					isAdded = NO;
					//isNotesHide = YES;
					btnImg.image = [UIImage imageNamed:@"add.png"];
					[defaults setObject:appDelegate.arrFavStore forKey:@"FavStore"];
					[defaults synchronize];
					return;
				}
			}
		}
	}
}


- (IBAction)Contact:(id)sender
{
	appDelegate.isDetail = YES;
	appDelegate.listingID = objProperty.listingId_var;
	appDelegate.listingAdd = objProperty.fullAddress_var;
	[self detailActionsheetShow];
}

- (void) detailActionsheetShow
{
	
	UIImageView *agentImg = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 90, 90)];
	if(appDelegate.imgData > 0)
	{
		agentImg.image = [UIImage imageWithData:appDelegate.imgData];
	}
	else
	{
		agentImg.image = [UIImage imageNamed:@"agent_image_notavailable.png"];
	}
	[agentImg setContentMode:UIViewContentModeScaleAspectFit];
	
	UILabel *lblAgentName = [[UILabel alloc]initWithFrame:CGRectMake(120, 40, 75, 21)];
	lblAgentName.text = [NSString stringWithFormat:@"%@ %@", appDelegate.agentFirstName,appDelegate.agentLastName];
	[lblAgentName setBackgroundColor:[UIColor clearColor]];
	[lblAgentName setTextColor:[UIColor whiteColor]];
	[lblAgentName sizeToFit];
	
	UILabel *lblAgentOff = [[UILabel alloc]initWithFrame:CGRectMake(120, 60, 200, 90)];
	lblAgentOff.text = appDelegate.agentOff;
	[lblAgentOff setBackgroundColor:[UIColor clearColor]];
	[lblAgentOff setTextColor:[UIColor whiteColor]];
	[lblAgentOff setNumberOfLines:0];
	[lblAgentOff sizeToFit];
	
	CGRect frame = CGRectMake(0, 0, 320, 320);
	UIImageView *imgBng = [[UIImageView alloc] initWithFrame:frame];
	[imgBng setImage:[UIImage imageNamed:@"background.png"]];
	[imgBng setAlpha:0.8];
	
	actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
	
	UIButton *btnEmail = [[UIButton alloc]initWithFrame:CGRectMake(20, 120, 82, 75)];
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
	
	UIButton *btnText = [[UIButton alloc] initWithFrame:CGRectMake(120, 120, 82, 75)];
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
	
	UIButton *btnCall = [[UIButton alloc] initWithFrame:CGRectMake(220, 120, 82, 75)];
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
	
	UIButton *btnCancelAct = [[UIButton alloc] initWithFrame:CGRectMake(15, 210, 291, 43)];
	[btnCancelAct setImage:[UIImage imageNamed:@"btn_Cancel.png"] forState:UIControlStateNormal];
	[btnCancelAct addTarget:self action:@selector(CancelAction) forControlEvents:UIControlEventTouchUpInside];
	
	
	[actionSheet addSubview:imgBng];
	[actionSheet addSubview:agentImg];
	[actionSheet addSubview:lblAgentName];
	[actionSheet addSubview:lblAgentOff];
	[actionSheet addSubview:btnEmail];
	[actionSheet addSubview:btnText];
	[actionSheet addSubview:btnCall];
	[actionSheet addSubview:btnCancelAct];
	[actionSheet showFromTabBar:appDelegate.tabController.tabBar];
	[actionSheet setBounds:CGRectMake(0,0,320, 520)];
	
	[imgBng release];
	[agentImg release];
	[lblAgentName release];
	[lblAgentOff release];
	[btnEmail release];
	[btnText release];
	[btnCall release];
	[btnCancelAct release];
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
	
	
	
	NSString *subject;
	NSString *body;
	
//	if(appDelegate.currentDevOS >= 4)
//	{
//		NSDictionary *dictionary = 
//		[NSDictionary dictionaryWithObjectsAndKeys:[defaults objectForKey:@"UserID"],@"MTAG",nil];
//		[FlurryAPI logEvent:@"DETAILS_PAGE_EMAIL_EVENT" withParameters:dictionary];
//		
//	}
	
    NSString* fburl=[NSString stringWithFormat:@"http://spreadyourbrand.com/fbsearch/fbprint.php?id=%@&mtag=%@",objProperty.listingId_var,appDelegate.agentData.mTag_var];
    NSString* moreDetails=[NSString stringWithFormat:@"<a href='%@'>More Details...</a>",fburl];

		subject = [NSString stringWithFormat:@"MLS# %@",appDelegate.listingID];
	body = [NSString stringWithFormat:@"I am interested in learning more details about this listing:<br/>%@<br/>%@<br/>%@",appDelegate.listingAdd,moreDetails,[appDelegate getStandardEmailFooter]];
	
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
//		[FlurryAPI logEvent:@"DETAILS_PAGE_SMS_EVENT" withParameters:dictionary];
//		
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
//		[FlurryAPI logEvent:@"DETAILS_PAGE_CALL_EVENT" withParameters:dictionary];		
//		
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

- (IBAction)ScheduleVisit:(id)sender
{
	mTgr8DateSelector *objDateSelector = [[mTgr8DateSelector alloc] initWithNibName:@"mTgr8DateSelector" bundle:nil];
	objDateSelector.strListingId = [NSString stringWithFormat:@"MLS# %@", objProperty.listingId_var];
    objDateSelector.onlyId = objProperty.listingId_var;
	objDateSelector.strListingAdd = objProperty.fullAddress_var;
	[self.navigationController pushViewController:objDateSelector animated:YES];
	[objDateSelector release];
}

- (IBAction)SendToFriend:(id)sender
{
	NSString *fullAdd = objProperty.fullAddress_var;
	fullAdd = fullAdd!=nil?fullAdd:@"";
	
	NSString* city  = objProperty.city_var;
//	city = [appDelegate cityName:city];
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
	
	NSString *strStyle = objProperty.exteriorFeatures_var;
	strStyle = strStyle!=nil?strStyle:@"--";
	
	NSString *strSqFT;
	if(objProperty.sqFt_var != nil)
		strSqFT = [NSString stringWithFormat:@"%@ sq.ft.", objProperty.sqFt_var];
	else {
		strSqFT = @"-- sq.ft.";
	}
    
    NSString* fburl=[NSString stringWithFormat:@"http://spreadyourbrand.com/fbsearch/fbprint.php?id=%@&mtag=%@",objProperty.listingId_var,appDelegate.agentData.mTag_var];
    NSString* moreDetails=[NSString stringWithFormat:@"<a href='%@'>More Details...</a>",fburl];
	
	sendDetails = [NSString stringWithFormat:@"%@<br/>%@<br/>$%@<br/>%@ %@<br/>%@<br/>%@<br/>%@",fullAdd,
				   [NSString stringWithFormat:@"%@ %@ %@",city,stateOrProvince,postalCode],
				   objProperty.listPrice_var,[NSString stringWithFormat:@"%@ Bed/(%@F,%@H) Bath", bed,fBath,hBath],strSqFT,strStyle,[NSString stringWithFormat:@"MLS# %@",objProperty.listingId_var],moreDetails];
	
	
	//NSString *strImgURL = [NSString stringWithFormat:<#(NSString *)format#>
	NSString *subject = [NSString stringWithFormat:@"MLS# %@", objProperty.listingId_var]; //sendDetails
	NSString *body;
	if(txtNotes.text.length > 2)
	{
		body = [NSString stringWithFormat:@"I would like to share this Listing:<br/>%@<br/><br/>Notes:%@<br/><br/>%@",sendDetails,txtNotes.text,[appDelegate getStandardEmailFooter]];
	}
	else
	{
		body = [NSString stringWithFormat:@"I would like to share this Listing:<br/>%@<br/><br/><br/>%@",sendDetails,[appDelegate getStandardEmailFooter]];
	}
	
//	if(appDelegate.currentDevOS >= 4)
//	{
//		NSDictionary *dictionary = 
//		[NSDictionary dictionaryWithObjectsAndKeys:[defaults objectForKey:@"UserID"],@"MTAG",nil];
//		[FlurryAPI logEvent:@"DETAILS_PAGE_SEND_FRIEND_EMAIL_EVENT" withParameters:dictionary];
//		
//	}
	
		
	//Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
	
	if ([MFMailComposeViewController canSendMail])
	{
		MFMailComposeViewController *composeVC = [[MFMailComposeViewController alloc] init];
		composeVC.mailComposeDelegate = self;
		[composeVC setSubject:subject];
		//NSArray *arrTo = [NSArray arrayWithObject:mailTo];
		//[composeVC setToRecipients:arrTo];
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

- (void)segmentAction:(id)sender
{
	[tableView reloadData];
}

- (void)fetchImages
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	//sendImgURL = [[NSMutableString alloc]init];
	for (int i = 0; i < objProperty.photos_var.photo_var.count; i++) {
		
		Photo *objPhoto = [objProperty.photos_var.photo_var objectAtIndex:i]; //leak//[[Photo alloc]autorelease];
		//objPhoto = [objProperty.photos_var.photo_var objectAtIndex:i]; //leak
		
		if(objPhoto.url_var != nil)
		{
			//[sendImgURL appendFormat:@"%@\n",objPhoto.url_var];
			NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:objPhoto.url_var]]; //leak 11/12
			
			if(imgData > 0)
			{
				[arrImgData addObject:imgData];
				//[imgData release];
			}
		}
		
	}
	
	//appDelegate.arrPropertyImg = [[NSMutableArray alloc]init]; //leak
	appDelegate.arrPropertyImg = arrImgData;
	
	if(arrImgData.count > 0)
	{
		imgPrimary.image = [UIImage imageWithData:[arrImgData objectAtIndex:0]];
		//UIImageWriteToSavedPhotosAlbum([UIImage imageWithData:[arrImgData objectAtIndex:0]], nil, nil, nil);
	}
	else
	{
		isPictureHide = YES;
		[tableView reloadData];
		imgPrimary.image = [UIImage imageNamed:@"imagenotavail85x85.png"];
	}
		[activityMain removeFromSuperview];
	
	currentPage = [[PageViewController alloc] initWithNibName:@"PageView" bundle:nil];
	nextPage = [[PageViewController alloc] initWithNibName:@"PageView" bundle:nil];
	[scrollView addSubview:currentPage.view];
	[scrollView addSubview:nextPage.view];
	
	NSInteger widthCount = arrImgData.count;
	
//	NSMutableArray *imgNo = [[[NSMutableArray alloc]initWithObjects:@"Details",@"Map",[NSString stringWithFormat:@"Photos (%i)", widthCount],nil]autorelease];
	
//	segmentedControl = [[UISegmentedControl alloc] initWithItems:imgNo];
	
	if(segmentedControl.selectedSegmentIndex == 2)
	{
		segmentedControl.selectedSegmentIndex = 1;
		[segmentedControl removeSegmentAtIndex:2 animated:NO];
		[segmentedControl insertSegmentWithTitle:[NSString stringWithFormat:@"Photos (%i)", widthCount] atIndex:2 animated:NO];
		segmentedControl.selectedSegmentIndex = 2;
	}
	else {
		[segmentedControl removeSegmentAtIndex:2 animated:NO];
		[segmentedControl insertSegmentWithTitle:[NSString stringWithFormat:@"Photos (%i)", widthCount] atIndex:2 animated:NO];

	}

		
	if (widthCount == 0)
	{
		widthCount = 1;
	}
	
    scrollView.contentSize =
	CGSizeMake(
			   scrollView.frame.size.width * widthCount,
			   scrollView.frame.size.height);
	scrollView.contentOffset = CGPointMake(0, 0);
	[scrollView setPagingEnabled:YES];
	
	pageControl.numberOfPages = arrImgData.count;
	pageControl.currentPage = 0;
	
	[self applyNewIndex:0 pageController:currentPage];
	[self applyNewIndex:1 pageController:nextPage];
	
	//pageControl = [[UIPageControl alloc] init];
	//pageControl.frame = CGRectMake(20, 354, 271, 36);
	pageControl.numberOfPages = arrImgData.count;
	pageControl.currentPage = 0;
	
	[activityIndicator removeFromSuperview];
	
	[pool drain];
}

- (IBAction)toggleDetails:(id)sender {
    self.isListingDetailsExpanded = !self.isListingDetailsExpanded;
    [self.tableView reloadData];
    [self.tableView setNeedsLayout];
    [self.tableView setNeedsDisplay];
}


#pragma mark -
#pragma mark Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	if([[self nameForSection:indexPath.section] isEqual:@"Summary"]){
		return 220;
	}
	
	if([[self nameForSection:indexPath.section] isEqual:@"Static Map"]){
		return 310;
	}
	
//	if([[self nameForSection:indexPath.section] isEqual:@"WalkScore"]){
//		return 50;
//	}
	
	if([[self nameForSection:indexPath.section] isEqual:@"Description"]){
		//return 220;
		
		NSString *remarkStr = objProperty.remarks_var;
		remarkStr = remarkStr!=nil?remarkStr:@"--";
        //NSLog(@"CellText:------->> %@",cellText);
	
		if([remarkStr isEqualToString:@"--"])
		{
			return 40;
		}
		else
		{
			UIFont *cellFont = [UIFont fontWithName:@"Helvetica" size:13.0];
			CGSize constraintSize = CGSizeMake(280.0f, MAXFLOAT);
			CGSize labelSize = [remarkStr sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
			return labelSize.height + 30;
		}
			
		//return 220;

	}
	

	if([[self nameForSection:indexPath.section] isEqual:@"Details"]){
		return 260;
	}
    
    if([[self nameForSection:indexPath.section] isEqual:@"Open House"]){
		if(objProperty != nil && objProperty.openHouses_var != nil && [objProperty.openHouses_var.openHouse_var count] > 0){
            int lines = [self getOpenHouseString:YES];
            int height = (lines)*16;
            CGRect frame= CGRectMake(5 ,1, 290, height+1);
            openHouseView.frame = frame;
            return height+4;
        }else{
            return 0;
        }	
    }
    
    if([[self nameForSection:indexPath.section] isEqual:@"More Details"]){
		if( self.isListingDetailsExpanded){
            int lines = [self getDetailsString:YES];
            int height = (lines)*14;
            CGRect frame= CGRectMake(5 ,27, 290, height+27);
            txtMoreDetails.frame = frame;
            return height+27+30;
        }else{
            return 40;
        }
	}
	
	if([[self nameForSection:indexPath.section] isEqual:@"My Notes"]){
		//return 220;
		
		NSString *strNotes = txtNotes.text;
		strNotes = strNotes!=nil?strNotes:@"--";
        //NSLog(@"CellText:------->> %@",cellText);
		
		if([strNotes isEqualToString:@"--"])
		{
			return 40;
		}
		else
		{
			UIFont *cellFont = [UIFont fontWithName:@"Helvetica" size:13.0];
			CGSize constraintSize = CGSizeMake(280.0f, MAXFLOAT);
			CGSize labelSize = [strNotes sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
			return labelSize.height + 40;
		}
		
		//return 220;
		
	}
	
	if([[self nameForSection:indexPath.section] isEqual:@"Send To Friend"]){
		return 100;
	}
	
	if([[self nameForSection:indexPath.section] isEqual:@"Pictures"]){
		return 310;
	}
	
	if([[self nameForSection:indexPath.section] isEqual:@"Disclaimers"]){
		return 350;
	}
	
	return 0;	
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
		
	
//	if(isPictureHide)
//	{
//		return 7;
//	}
//	else
//	{
//		//return 8;
//		return 6;
//	}
	
	if(segmentedControl.selectedSegmentIndex == 0)
	{
		return 8;
	}
	else {
		return 1;
	}


    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	

	
	if(segmentedControl.selectedSegmentIndex == 0)
	{
		if(section == 1)
		{
			if(objProperty != nil && objProperty.openHouses_var != nil && [objProperty.openHouses_var.openHouse_var count] > 0){
                return @"Open House";
            }else{
                return @"";
            }
		}
        else if(section == 2)
		{
			return @"Remarks";
		}
		else if(section == 3)
		{
			return @"Details";
		}
        else if(section == 4)
		{
			//return @"More Details";
            return @"";
		}
		else if(section == 6)
		{
			//return @"Send To Friend";
            return @"";
		}
		else if(section == 7)
		{
			return @"Disclaimers";
		}
        else if(section == 5)
		{
			return @"My Notes";
		}
		else
		{
			return @"";
		}
	}
	else 
	{
		return @"";
	}



}	

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	
	
	if([[self nameForSection:indexPath.section] isEqual:@"Summary"]){
		block1Cell.selectionStyle = UITableViewCellSelectionStyleNone;
		lblAddress.text = objProperty.fullAddress_var;
		lblAgent.text = objProperty.agentCompany_var;
		
		NSString* listPrice= objProperty.listPrice_var;
		listPrice = listPrice!=nil?listPrice:@"--";
		
		//lblPrice.text = [NSString stringWithFormat:@"$%@", objProperty.listPrice_var];
		
		NSNumberFormatter *numberFormatter = [[[NSNumberFormatter alloc] init] autorelease];
		[numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
		//[numberFormatter setAllowsFloats:NO];
		[numberFormatter setMaximumFractionDigits:0];
		NSNumber *price = [NSNumber numberWithInteger:[listPrice intValue]];
		
		//If you print next thing
		listPrice = [NSString stringWithFormat: @"%@",[numberFormatter stringForObjectValue:price]];
		
		lblPrice.text = listPrice;
		
		NSString* city  = objProperty.city_var;
//		city = [appDelegate cityName:city];
		city = city!=nil?city:@"";
		NSString *stateOrProvince=objProperty.state_var;
		stateOrProvince = stateOrProvince!=nil?stateOrProvince:@"";
		NSString *postalCode=objProperty.zip_var;
		postalCode = postalCode!=nil?postalCode:@"";
		
		lblCityState.text = [NSString stringWithFormat:@"%@ %@ %@",city,stateOrProvince,postalCode];
		lblMLSNo.text = [NSString stringWithFormat:@"MLS# %@",objProperty.listingId_var];
		
		NSString *strType = objProperty.exteriorFeatures_var;
		strType = strType!=nil?strType:@"--";
		
		lblHomeType.text = strType;
		NSString *fBath = objProperty.fullBathrooms_var;
		fBath = fBath!=nil?fBath:@"--";
		NSString *hBath = objProperty.halfBathrooms_var;
		hBath = hBath!=nil?hBath:@"--";
		NSString *bed = objProperty.bedrooms_var;
		bed = bed!=nil?bed:@"--";
		lblBedBath.text = [NSString stringWithFormat:@"%@ Bed/(%@F,%@H) Bath", bed,fBath,hBath];
		if(objProperty.sqFt_var != nil)
		lblSqft.text = [NSString stringWithFormat:@"%@ sq.ft.", objProperty.sqFt_var];
		else {
			lblSqft.text = @"-- sq.ft.";
		}

		//sendDetails = [NSString stringWithFormat:@"%@\n%@\n$ %@\n%@\n%@ %@\n%@",lblAddress.text,lblCityState.text,listPrice,lblBedBath.text,lblSqft.text,lblHomeType.text,lblMLSNo.text];
		
		return block1Cell;
	}
	
	if([[self nameForSection:indexPath.section] isEqual:@"Static Map"]){
		
		/*
		MKCoordinateRegion region;
		MKCoordinateSpan span;
		span.latitudeDelta=0.2;
		span.longitudeDelta=0.2;
		
		CLLocationCoordinate2D coordinate;// = [self addressLocation];
		
		
		NSString *mapLat = [objProperty.latitude_var stringValue];
		mapLat = mapLat!=nil?mapLat:@"--";
		
		NSString *mapLong = [objProperty.longitude_var stringValue];
		mapLong = mapLong!=nil?mapLong:@"--";

		if([mapLat isEqualToString:@"--"] || [mapLong isEqualToString:@"--"] || [mapLat isEqualToString:@"0"] || [mapLong isEqualToString:@"0"] )
		{

			[self getPropCoordinate:objProperty];
						
			coordinate.latitude = propCoordinate.latitude;
			coordinate.longitude = propCoordinate.longitude;
		}
		else
		{
			
			coordinate.latitude = [objProperty.latitude_var floatValue];
			coordinate.longitude = [objProperty.longitude_var floatValue];
		
		}
		
		region.span=span;
		region.center=coordinate;
		
		if(addAnnotation != nil) {
			[mapView removeAnnotation:addAnnotation];
			[addAnnotation release];
			addAnnotation = nil;
		}
		
		addAnnotation = [[AddressAnnotation alloc] initWithCoordinate:coordinate];
		[mapView addAnnotation:addAnnotation];
		
		[mapView setRegion:region animated:TRUE];
		[mapView regionThatFits:region];
		 */
		return mapCell;
	}
	
	if([[self nameForSection:indexPath.section] isEqual:@"WalkScore"]){
		
		walkScoreCell.selectionStyle = UITableViewCellSelectionStyleNone;
		//[self getWalkScore];
	
//		NSString *embedHTML = @"<div style=\"position: relative; width:160px; height: 40px; background: url(http://cdn.walkscore.com/images/widget/back-blue3.gif) top left no-repeat;overflow:hidden;border:0;outline:0;margin:0;padding:0;\">  <h1 style=\"position: absolute; left: 125px; top: 4px;border:0;outline:0;margin:0;padding:0;text-align: left; text-decoration:none; font-style: normal; vertical-align: baseline; background: none;font:16px 'trebuchet ms', Geneva, Arial, Helvetica, sans-serif; font-weight: bold; color:#4b76c6;\">%@</h1>  <p style=\"position: absolute; left: 8px; top: 25px;border:0;outline:0;margin:0;padding:0;text-align: left; text-decoration:none; font-style: normal; vertical-align: baseline; background: none;font: 11px/11px Verdana, Arial, Helvetica, sans-serif; font-weight: normal; color: #666; vertical-align: top;width: 152px; text-align: center;\"><span style=\"background-color: #eff4ff; padding:0 2px;\">%@</span></p>  <a href=\"http://www.walkscore.com/score/&utm_medium=overlay_link&utm_campaign=widget3\" target=\"_blank\" style=\"position:absolute;top:0;left:0;display:block;background:url(http://www.walkscore.com/images/fulltrans.png) 0 0 repeat;z-index:5;text-indent:-999999px;width:160px;height:40px;border:0;outline:0;margin:0;padding:0;\">Walk Score</a></div>";
//		NSString *html = [NSString stringWithFormat:embedHTML, strWalkScore,strWalkDesc];
		
//		[webViewWalkScore loadHTMLString:html baseURL:nil];
		
		return walkScoreCell;
	}
	
	
	if([[self nameForSection:indexPath.section] isEqual:@"Description"]){
		remarkCell.selectionStyle = UITableViewCellSelectionStyleNone;
		//txtRemarks.text = objProperty.remarks_var;
		
		NSString *remarkStr = objProperty.remarks_var;
		remarkStr = remarkStr!=nil?remarkStr:@"--";
		
		NSString *strDesc = [NSString stringWithFormat:@"\n%@",remarkStr];
		remarkCell.textLabel.text = strDesc;
		remarkCell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
		remarkCell.textLabel.numberOfLines = 0;
		[remarkCell.textLabel setFont:[UIFont fontWithName:@"Helvetica" size:13]];
//		
		return remarkCell;
	}
	
	if([[self nameForSection:indexPath.section] isEqual:@"Details"]){
		detailsCell.selectionStyle = UITableViewCellSelectionStyleNone;
		return detailsCell;
	}
    
    if([[self nameForSection:indexPath.section] isEqual:@"Open House"]){
        if(objProperty != nil && objProperty.openHouses_var != nil && [objProperty.openHouses_var.openHouse_var count] > 0){
            NSString* resStr = [self getOpenHouseString:NO];
            [openHouseView loadHTMLString:resStr baseURL:nil];
            return openHouseCell;
        }
        return openHouseEmptyCell;
    }
    
    if([[self nameForSection:indexPath.section] isEqual:@"More Details"]){
        if( self.isListingDetailsExpanded ){
            NSString* resStr =[self getDetailsString:NO];
            [txtMoreDetails loadHTMLString:resStr baseURL:nil];
            return self.listingDetailsMoreCell;
        }else{
            return self.listingDetailsCell;
        }
	}
	
	if([[self nameForSection:indexPath.section] isEqual:@"Send To Friend"]){
		sendToFriendCell.selectionStyle = UITableViewCellSelectionStyleNone;
		[sendToFriendCell setBackgroundColor:[UIColor clearColor]];
		return sendToFriendCell;
	}
	
	if([[self nameForSection:indexPath.section] isEqual:@"My Notes"]){
		notesCell.selectionStyle = UITableViewCellSelectionStyleNone;
		//txtRemarks.text = objProperty.remarks_var;
		
		NSString *strNotes = [defaults objectForKey:objProperty.listingId_var];
		strNotes = strNotes!=nil?strNotes:@"--";
		
		NSString *strDesc = [NSString stringWithFormat:@"\n%@",strNotes];
		notesCell.textLabel.text = strDesc;
		notesCell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
		notesCell.textLabel.numberOfLines = 0;
		UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(260, 3, 40, 35)];
		imgView.image = [UIImage imageNamed:@"Picture1_right.png"];
		[notesCell addSubview:imgView];
		[imgView release];
		[notesCell.textLabel setFont:[UIFont fontWithName:@"Helvetica" size:13]];
		//		
		return notesCell;
	}
	
	if([[self nameForSection:indexPath.section] isEqual:@"Pictures"]){
		pictureCell.selectionStyle = UITableViewCellSelectionStyleNone;
		return pictureCell;
	}
		
	if([[self nameForSection:indexPath.section] isEqual:@"Disclaimers"]){
		disclaimerCell.selectionStyle = UITableViewCellSelectionStyleNone;
		
		
			if(appDelegate.agentOffImage.length > 0)
			{
				if([appDelegate.agentOffImage hasPrefix:@"http://"])
				{
					appDelegate.agentOffImage = [appDelegate.agentOffImage stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
					[webViewDisclaim loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:appDelegate.agentOffImage]]];
				}
				else
				{
					[webViewDisclaim loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@", appDelegate.agentOffImage]]]];
				}
			}
		
		
		return disclaimerCell;
	}
	
	return nil;
}

- (NSString *)nameForSection:(NSInteger)section
{
	
	if(segmentedControl.selectedSegmentIndex == 0)
	{
		if(section == 0){
			return @"Summary";
		}
		
		if(section == 1){
			return @"Open House";
		}
        
        if(section == 2){
			return @"Description";
		}
		
		if(section == 3)
		{
			return @"Details";
		}
        
        if(section == 4)
		{
			return @"More Details";
		}
		
		if(section == 6){
			return @"Send To Friend";
		}
		
		if(section == 7)
		{
			return @"Disclaimers";
		}
        
        if(section == 5){
			return @"My Notes";
		}
		
	}
	else if(segmentedControl.selectedSegmentIndex == 1)
	{
		if(section == 0)
		{
			return @"Static Map";
		}
	}
	else if(segmentedControl.selectedSegmentIndex == 2)
	{
		if(section == 0){
			return @"Pictures";
		}
		
	}
	
	//	}
	return @"";
	
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	

	if([[self nameForSection:indexPath.section] isEqual:@"My Notes"])
	{
		animation = [CATransition animation];
		animation.delegate = self;
		animation.duration = 0.5f;
		animation.timingFunction = UIViewAnimationCurveEaseInOut;
		animation.type = kCATransitionPush;
		animation.subtype = kCATransitionFromBottom;
		
		[[viewNotes layer] addAnimation:animation forKey:@"animation"];
		viewNotes.hidden = FALSE;
		[txtNotes becomeFirstResponder];
	}else if([[self nameForSection:indexPath.section] isEqual:@"More Details"])
	{
		[self toggleDetails:nil];
	}
//	else if([[self nameForSection:indexPath.section] isEqual:@"WalkScore"])
//	{
//		webViewController *objWebViewController = [[webViewController alloc] initWithNibName:@"webViewController" bundle:nil];
//		[self.navigationController pushViewController:objWebViewController animated:NO];
//		[objWebViewController release];
//		
//	}
}

//- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
//	
//	MKPinAnnotationView* pinView = nil;
//	
//	pinView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pinview"] autorelease];
//	
//	if(nil == pinView) {
//		pinView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pinview"] autorelease];
//	}
//	
//
//	[pinView setPinColor:MKPinAnnotationColorGreen];
//	pinView.animatesDrop=YES;
//	pinView.userInteractionEnabled=TRUE;
//	pinView.canShowCallout=NO;	
//	return pinView;
//	
//}

-(id)getOpenHouseString:(BOOL)linesOnly{
    int lines=0;
    NSString* resStr = @"<html><body>";
    for(int i=0;i< [objProperty.openHouses_var.openHouse_var count];i++){
        OpenHouse* openHouse = [objProperty.openHouses_var.openHouse_var objectAtIndex:i];
        if( openHouse  != nil ){
            NSString *oh = @"<p style='font-family:helvetica;font-size:12px;font-weight:bold'>";
            oh=[oh stringByAppendingFormat:@"%@",[mTgr8_PropertyDetailViewController formatOpenHouseShowTime:openHouse.startDateTime_var endTime:openHouse.endDateTime_var]]; 
            oh=[oh stringByAppendingString:@"</p>"];
            lines++;lines++;
            
            if( openHouse.openHousePublicRemarks_var != nil){
                if([openHouse.openHousePublicRemarks_var length]){
                    BOOL isUpperCase = NO;
                    NSString* upStr = [openHouse.openHousePublicRemarks_var uppercaseString];
                    if( [upStr compare:openHouse.openHousePublicRemarks_var] == 0){
                        // uppercase, make sentence case
                        openHouse.openHousePublicRemarks_var = [openHouse.openHousePublicRemarks_var capitalizedString];
                    }
                    int nL = [openHouse.openHousePublicRemarks_var length]/45;
                    lines += nL;
//                    if( nL == 0 )
                        lines++; // for content
                    lines++; // for para
                }
                oh=[oh stringByAppendingFormat:@"<p style='font-family:helvetica;font-size:12px;'>%@</p>",openHouse.openHousePublicRemarks_var]; 
                
            }
            
            resStr = [resStr stringByAppendingFormat:@"%@",oh];                                
        }
    }
    resStr =[resStr stringByAppendingString:@"</body></html>"];
    if( linesOnly ){
        return lines;
    }else{
        return resStr;
    }
}

+(NSString*) formatOpenHouseShowTime:(NSString*)startTime endTime:(NSString*)endTime{
    NSString* resTime = @"";
    NSRange range = [startTime rangeOfString:@","];
    if( range.location > 0){
        NSString* firstOne = [startTime substringToIndex:range.location];
        NSString* commonOne = [startTime substringToIndex:range.location+7];
        NSString* firstReminder = [startTime stringByReplacingOccurrencesOfString:commonOne withString:@""];
        NSRange spLocFirst = [firstReminder rangeOfString:@" "];
        spLocFirst.length = 3;
        spLocFirst.location = spLocFirst.location -3;
        firstReminder = [firstReminder stringByReplacingCharactersInRange:spLocFirst withString:@""];
        NSString* secondOne = [endTime stringByReplacingOccurrencesOfString:commonOne withString:@""];
        if( secondOne != nil){
            spLocFirst = [secondOne rangeOfString:@" "];
            spLocFirst.length = 3;
            spLocFirst.location = spLocFirst.location -3;
            secondOne = [secondOne stringByReplacingCharactersInRange:spLocFirst withString:@""];
            resTime = [resTime stringByAppendingFormat:@"%@,%@ - %@",firstOne,firstReminder,secondOne];
            return resTime;
        }
    }
                     
    return [resTime stringByAppendingFormat:@"%@ - %@",startTime,endTime];;
}

-(id)getDetailsString:(BOOL)linesOnly{
    int lines=0;
    NSString* resStr = @"<html><body><div style='font-family:helvetica;font-size:12px;'>";
    if( objProperty.amenities_var != nil){
        NSString *amenities = @"<p style='font-family:helvetica;font-size:12px;font-weight:bold'>Amenities</p><p style='font-family:helvetica;font-size:12px;word-wrap:break-word;'>";
        lines = lines+2; // one amenties + one para end
        amenities=[amenities stringByAppendingString:objProperty.amenities_var];
        if ([objProperty.amenities_var length]) {
            int nL = [objProperty.amenities_var length]/45;
            lines += nL;
            lines++;
        }
        if(objProperty.property_Inclusions_var != nil){
            amenities=[amenities stringByAppendingFormat:@"%@",objProperty.property_Inclusions_var]; 
            if ([objProperty.property_Inclusions_var length]) {
                int nL = [objProperty.amenities_var length]/45;
                lines += nL;
                lines++;
            }
        }
        amenities=[amenities stringByAppendingString:@"</p>"];
        lines++; // para end
        resStr = [resStr stringByAppendingFormat:@"%@",amenities];            
    }
    if( objProperty.floorCovering_var != nil){
        NSString *aStr = @"<p><b>Floor</b></p><p>";
        lines++;lines++; // floor and para end
        aStr=[aStr stringByAppendingFormat:@"%@</p>",objProperty.floorCovering_var];
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];
        lines++;lines++; // content and para end
    }
    if( objProperty.roof_var != nil){
        NSString *aStr = @"<p><b>Roof</b></p><p>";
        lines++;lines++ ;// roof and para
        aStr=[aStr stringByAppendingFormat:@"%@</p>",objProperty.roof_var];
        resStr = [resStr stringByAppendingFormat:@"%@",aStr]; 
        lines++;lines++; // content and para
    }
    
    resStr = [resStr stringByAppendingFormat:@"%@",@"<p><b>Heating/Cooling</b></p>"];
    lines++;lines++;
    if( objProperty.heating_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>%@</p>",objProperty.heating_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.cooling_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>%@</p>",objProperty.cooling_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    
    resStr = [resStr stringByAppendingFormat:@"%@",@"<p><b>Bath/Shower/Tub</b></p>"];
    lines++;lines++;
    if( objProperty.bathroomFeatures_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>%@</p>",objProperty.bathroomFeatures_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.shower_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>%@</p>",objProperty.shower_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.tub_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>%@</p>",objProperty.tub_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.showerTub_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>%@</p>",objProperty.showerTub_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.property_HotTub_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>%@</p>",objProperty.property_HotTub_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    
    
    resStr = [resStr stringByAppendingFormat:@"%@",@"<p><b>Dining/Kitchen</b></p>"];
    lines++;lines++;
    if( objProperty.formalDiningRoom_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>%@</p>",objProperty.formalDiningRoom_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.inFormalDiningRoom_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>%@</p>",objProperty.inFormalDiningRoom_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    
    resStr = [resStr stringByAppendingFormat:@"%@",@"<p><b>Other Rooms & Areas</b></p>"];
    lines++;lines++;
    if( objProperty.bedroomDescription_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>%@</p>",objProperty.bedroomDescription_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.familyRoom_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>%@</p>",objProperty.familyRoom_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.otherRooms_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>%@</p>",objProperty.otherRooms_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.otherAreas_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>%@</p>",objProperty.otherAreas_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    
    resStr = [resStr stringByAppendingFormat:@"%@",@"<p><b>Fireplace</b></p>"];
    lines++;lines++;
    if( objProperty.hasFireplaces_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>%@</p>",objProperty.hasFireplaces_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.fireplaceLocation_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>%@</p>",objProperty.fireplaceLocation_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.fireplaceFeatures_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>%@</p>",objProperty.fireplaceFeatures_var];
        if ([objProperty.fireplaceFeatures_var length]) {
            int nL = [objProperty.fireplaceFeatures_var length]/45;
            lines += nL;
            lines++;
        }
        lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.firePlace_Details_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>%@,</p>",objProperty.firePlace_Details_var];
        if ([objProperty.firePlace_Details_var length]) {
            int nL = [objProperty.firePlace_Details_var length]/45;
            lines += nL;
            lines++;
        }
        lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    
    resStr = [resStr stringByAppendingFormat:@"%@",@"<p><b>Pool</b></p>"];
    lines++;lines++;
    if( objProperty.hasPool_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>%@</p>",objProperty.hasPool_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.pool_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>%@</p>",objProperty.pool_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.poolOptions_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>%@</p>",objProperty.poolOptions_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    
    resStr = [resStr stringByAppendingFormat:@"%@",@"<p><b>Exterior</b></p>"];
    lines++;lines++;
    if( objProperty.exterior_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>%@</p>",objProperty.exterior_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.yardGrounds_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>%@</p>",objProperty.yardGrounds_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.lotDescription_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>%@</p>",objProperty.lotDescription_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    
    resStr = [resStr stringByAppendingFormat:@"%@",@"<p><b>Utility</b></p>"];
    lines++;lines++;
    if( objProperty.sewerSeptic_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>%@</p>",objProperty.sewerSeptic_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.water_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>%@</p>",objProperty.water_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    
    resStr = [resStr stringByAppendingFormat:@"%@",@"<p><b>Location</b></p>"];
    lines++;lines++;
    if( objProperty.county_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>County: %@</p>",objProperty.county_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.tractName_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>Tract Name: %@</p>",objProperty.tractName_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.crossStreet_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>Cross Street: %@</p>",objProperty.crossStreet_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.directions_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>Directions: %@</p>",objProperty.directions_var];
        if ([objProperty.directions_var length]) {
            int nL = [objProperty.directions_var length]/45;
            lines += nL;
            lines++;
        }
        lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.view_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>View: %@</p>",objProperty.view_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    
    resStr = [resStr stringByAppendingFormat:@"%@",@"<p><b>Misc</b></p>"];
    lines++;lines++;
    if( objProperty.foundation_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>Foundation: %@</p>",objProperty.foundation_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.insulation_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>Insulation: %@</p>",objProperty.insulation_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.stories_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>Stories: %@</p>",objProperty.stories_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.levels_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>Levels: %@</p>",objProperty.levels_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.property_Energy_Information_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>Energy Feature: %@,</p>",objProperty.property_Energy_Information_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.property_Disability_Features_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>Disability Feature: %@</p>",objProperty.property_Disability_Features_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    resStr = [resStr stringByAppendingFormat:@"%@",@"<p>Horse Property:"];
    if( objProperty.horseProp_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"%@",objProperty.horseProp_var];
        lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.horsePropDesc_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"%@",objProperty.horsePropDesc_var];
        lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    resStr = [resStr stringByAppendingString:@"</p>"];
    lines++;
    
    resStr = [resStr stringByAppendingFormat:@"%@",@"<p><b>Association</b></p>"];
    lines++;lines++;
    if( objProperty.associationFee_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>Fee: %@</p>",objProperty.associationFee_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.associationFeeIncludes_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>Fee Includes: %@</p>",objProperty.associationFeeIncludes_var];
        if ([objProperty.associationFeeIncludes_var length]) {
            int nL = [objProperty.associationFeeIncludes_var length]/45;
            lines += nL;
            lines++;
        }
        lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.unitLocation_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>Location: %@</p>",objProperty.unitLocation_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.unitDescription_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>Description: %@</p>",objProperty.unitDescription_var];
        if ([objProperty.unitDescription_var length]) {
            int nL = [objProperty.unitDescription_var length]/45;
            lines += nL;
            lines++;
        }
        lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.totalUnits_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>Total Units: %@</p>",objProperty.totalUnits_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.community_CommunityName_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>Name: %@</p>",objProperty.community_CommunityName_var];
        lines++;lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    if( objProperty.complex_Features_var != nil){
        NSString *aStr = @"";
        aStr=[aStr stringByAppendingFormat:@"<p>Features: %@</p>",objProperty.complex_Features_var];
        if ([objProperty.complex_Features_var length]) {
            int nL = [objProperty.complex_Features_var length]/45;
            lines += nL;
            lines++;
        }
        lines++;
        resStr = [resStr stringByAppendingFormat:@"%@",aStr];            
    }
    
    
    resStr =[resStr stringByAppendingString:@"<div></body></html>"];
    if(linesOnly){
        return lines;
    }else{
        return resStr;
    }
}




//- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view
//{
//	[self DriveHere:nil];
//}


- (IBAction)WalkScore:(id)sender
{
	webViewController *objWebViewController = [[webViewController alloc] initWithNibName:@"webViewController" bundle:nil];
	[self.navigationController pushViewController:objWebViewController animated:YES];
    [[objWebViewController webView] loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:appDelegate.strWebViewURL]]];
	//[objWebViewController release];
}

- (void) getWalkScore
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	NSString *addressStr = objProperty.fullAddress_var;
	addressStr = addressStr!=nil?addressStr:@"";
	
	if([addressStr isEqualToString:@"Hidden Address"])
	{
		addressStr = @"";
	}
	
	
	NSString *propAdd = [NSString stringWithFormat:@"%@ %@ %@ %@",addressStr,objProperty.city_var,objProperty.state_var,objProperty.zip_var];
	
	propAdd = [Utils urlencode:propAdd];
	
	NSString *walkScoreURL = [NSString stringWithFormat:@"http://api.walkscore.com/score?format=xml&address=%@&lat=%@&lon=%@&wsapikey=8104f317ed6d53027a9ca0140831cf3b",propAdd,[[NSNumber numberWithDouble:propCoordinate.latitude]stringValue],[[NSNumber numberWithDouble:propCoordinate.longitude]stringValue]];
	
	TBXML * tbxml = [[TBXML tbxmlWithURL:[NSURL URLWithString:walkScoreURL]] retain];
	
	// Obtain root element
	TBXMLElement * root = tbxml.rootXMLElement;
	
	// if root element is valid
	if (root) {
		// search for the first author element within the root element's children
		TBXMLElement *statusElement = [TBXML childElementNamed:@"status" parentElement:root];
		if([[TBXML textForElement:statusElement] isEqualToString:@"1"])
		{
			TBXMLElement *walkscoreElement = [TBXML childElementNamed:@"walkscore" parentElement:root];
			strWalkScore = [TBXML textForElement:walkscoreElement];
			
			//NSLog(@"WalkScore: %@",[TBXML textForElement:walkscoreElement]);
			
			TBXMLElement *walkDescElement = [TBXML childElementNamed:@"description" parentElement:root];
			strWalkDesc = [TBXML textForElement:walkDescElement];
			
			
			TBXMLElement *walkLinkElement = [TBXML childElementNamed:@"ws_link" parentElement:root];
			appDelegate.strWebViewURL = [TBXML textForElement:walkLinkElement];

		}
				
	}
	
	strWalkScore = strWalkScore!=nil?strWalkScore:@"--";
	strWalkDesc = strWalkDesc!=nil?strWalkDesc:@"Undefined";

	// release resources
	[tbxml release];
	
	NSString *embedHTML = @"<div style=\"position: relative; width:160px; height: 40px; background: url(http://cdn.walkscore.com/images/widget/back-blue3.gif) top left no-repeat;overflow:hidden;border:0;outline:0;margin:0;padding:0;\">  <h1 style=\"position: absolute; left: 125px; top: 4px;border:0;outline:0;margin:0;padding:0;text-align: left; text-decoration:none; font-style: normal; vertical-align: baseline; background: none;font:16px 'trebuchet ms', Geneva, Arial, Helvetica, sans-serif; font-weight: bold; color:#4b76c6;\">%@</h1>  <p style=\"position: absolute; left: 8px; top: 25px;border:0;outline:0;margin:0;padding:0;text-align: left; text-decoration:none; font-style: normal; vertical-align: baseline; background: none;font: 11px/11px Verdana, Arial, Helvetica, sans-serif; font-weight: normal; color: #666; vertical-align: top;width: 152px; text-align: center;\"><span style=\"background-color: #eff4ff; padding:0 2px;\">%@</span></p>  <a href=\"http://www.walkscore.com/score/&utm_medium=overlay_link&utm_campaign=widget3\" target=\"_blank\" style=\"position:absolute;top:0;left:0;display:block;background:url(http://www.walkscore.com/images/fulltrans.png) 0 0 repeat;z-index:5;text-indent:-999999px;width:160px;height:40px;border:0;outline:0;margin:0;padding:0;\">Walk Score</a></div>";
	NSString *html = [NSString stringWithFormat:embedHTML, strWalkScore,strWalkDesc];
	
	[webViewWalkScore loadHTMLString:html baseURL:nil];
	
	[pool drain];
}

- (IBAction)DriveHere:(id)sender
{
	NSString *addressStr = objProperty.fullAddress_var;
	addressStr = addressStr!=nil?addressStr:@"--";
	
	NSString* city  = objProperty.city_var;
//	city = [appDelegate cityName:city];
	city = city!=nil?city:@"";
	NSString *stateOrProvince=objProperty.state_var;
	stateOrProvince = stateOrProvince!=nil?stateOrProvince:@"";
	
	
	NSString* latitudeString = [objProperty.latitude_var stringValue];
	latitudeString = latitudeString!=nil?latitudeString:@"--";
	
	NSString* longitudeString = [objProperty.longitude_var stringValue];
	longitudeString = longitudeString!=nil?longitudeString:@"--";
	
	NSString *urltext = @"";
	
//	if([latitudeString isEqualToString:@"--"] || [longitudeString isEqualToString:@"--"] || [latitudeString isEqualToString:@"0"] || [longitudeString isEqualToString:@"0"])
//	{
//		//NSLog(@"Lat - Long Not Available");
//		
//		NSString *geoURL = [NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/xml?address=%@,+%@,+%@&sensor=false",addressStr,city,stateOrProvince];
//		geoURL = [geoURL stringByReplacingOccurrencesOfString:@" " withString:@"+" options:NSBackwardsSearch range:NSMakeRange(0, [geoURL length])];
//		geoURL = [geoURL stringByReplacingOccurrencesOfString:@"#" withString:@"%23" options:NSBackwardsSearch range:NSMakeRange(0, [geoURL length])];
//		
//		TBXML * tbxml = [[TBXML tbxmlWithURL:[NSURL URLWithString:geoURL]] retain];
//		
//		// Obtain root element
//		TBXMLElement * root = tbxml.rootXMLElement;
//		
//		// if root element is valid
//		if (root) {
//			// search for the first author element within the root element's children
//			TBXMLElement *statusElement = [TBXML childElementNamed:@"status" parentElement:root];
//			if([[TBXML textForElement:statusElement] isEqualToString:@"OK"])
//			{
//				TBXMLElement *resultElement = [TBXML childElementNamed:@"result" parentElement:root];
//				TBXMLElement *geometryElement = [TBXML childElementNamed:@"geometry" parentElement:resultElement];
//				TBXMLElement *locationElement = [TBXML childElementNamed:@"location" parentElement:geometryElement];
//				TBXMLElement *latElement = [TBXML childElementNamed:@"lat" parentElement:locationElement];
//				TBXMLElement *lngElement = [TBXML childElementNamed:@"lng" parentElement:locationElement];
//				
//				CLLocationCoordinate2D coordinate;
//				coordinate.latitude = [[TBXML textForElement:latElement] doubleValue];
//				coordinate.longitude= [[TBXML textForElement:lngElement] doubleValue];
//				
//				urltext = [NSString stringWithFormat:@"http://maps.google.com/?saddr=%1.6f,%1.6f&daddr=%1.6f,%1.6f",
//									 appDelegate.mLastCoordinate.latitude, appDelegate.mLastCoordinate.longitude,propCoordinate.latitude,propCoordinate.longitude];
//				
//				
//			}
//			
//			
//		}
//		
//		// release resources
//		[tbxml release];	
//		
//	}
//	else
//	{
//		urltext = [NSString stringWithFormat:@"http://maps.google.com/?saddr=%1.6f,%1.6f&daddr=%@,%@",
//							 appDelegate.mLastCoordinate.latitude, appDelegate.mLastCoordinate.longitude,objProperty.latitude_var,objProperty.longitude_var];
        urltext = [NSString stringWithFormat:@"http://maps.google.com/?saddr=%@&daddr=%@,%@",
               @"Current Location",objProperty.latitude_var,objProperty.longitude_var];
		
//	}
	
    
    NSString* strUrl = [urltext stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    NSURL *url=[NSURL URLWithString:strUrl];
    //NSLog(@"Direction URL -%@",urltext);
    
    if (![[UIApplication sharedApplication]openURL:url])
    {
        NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
        UIAlertView *progressAlert = [[[UIAlertView alloc] initWithTitle:@""
                                                   message:@"Map Failed,Please try again later"
                                                  delegate: self
                                         cancelButtonTitle: nil
                                         otherButtonTitles: @"Ok",nil] autorelease];
        [progressAlert show];
        [pool drain];
        
    }
    //[urltext release];	
	
}

- (void)applyNewIndex:(NSInteger)newIndex pageController:(PageViewController *)pageController
{
	NSInteger pageCount = arrImgData.count;
	BOOL outOfBounds = newIndex >= pageCount || newIndex < 0;
	
	if (!outOfBounds)
	{
		CGRect pageFrame = pageController.view.frame;
		pageFrame.origin.y = 0;
		pageFrame.origin.x = scrollView.frame.size.width * newIndex;
		pageController.view.frame = pageFrame;
	}
	else
	{
		CGRect pageFrame = pageController.view.frame;
		pageFrame.origin.y = scrollView.frame.size.height;
		pageController.view.frame = pageFrame;
	}
	
	pageController.pageIndex = newIndex;
}

//- (void)viewDidLoad
//{
//	currentPage = [[PageViewController alloc] initWithNibName:@"PageView" bundle:nil];
//	nextPage = [[PageViewController alloc] initWithNibName:@"PageView" bundle:nil];
//	[scrollView addSubview:currentPage.view];
//	[scrollView addSubview:nextPage.view];
//	
//	NSInteger widthCount = arrImgData.count;
//	if (widthCount == 0)
//	{
//		widthCount = 1;
//	}
//	
//    scrollView.contentSize =
//	CGSizeMake(
//			   scrollView.frame.size.width * widthCount,
//			   scrollView.frame.size.height);
//	scrollView.contentOffset = CGPointMake(0, 0);
//	
//	pageControl.numberOfPages = arrImgData.count;
//	pageControl.currentPage = 0;
//	
//	[self applyNewIndex:0 pageController:currentPage];
//	[self applyNewIndex:1 pageController:nextPage];
//}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    CGFloat pageWidth = scrollView.frame.size.width;
    float fractionalPage = scrollView.contentOffset.x / pageWidth;
	
	NSInteger lowerNumber = floor(fractionalPage);
	NSInteger upperNumber = lowerNumber + 1;
	
	if (lowerNumber == currentPage.pageIndex)
	{
		if (upperNumber != nextPage.pageIndex)
		{
			[self applyNewIndex:upperNumber pageController:nextPage];
		}
	}
	else if (upperNumber == currentPage.pageIndex)
	{
		if (lowerNumber != nextPage.pageIndex)
		{
			[self applyNewIndex:lowerNumber pageController:nextPage];
		}
	}
	else
	{
		if (lowerNumber == nextPage.pageIndex)
		{
			[self applyNewIndex:upperNumber pageController:currentPage];
		}
		else if (upperNumber == nextPage.pageIndex)
		{
			[self applyNewIndex:lowerNumber pageController:currentPage];
		}
		else
		{
			[self applyNewIndex:lowerNumber pageController:currentPage];
			[self applyNewIndex:upperNumber pageController:nextPage];
		}
	}
	
	[currentPage updateTextViews:NO];
	[nextPage updateTextViews:NO];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)newScrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    float fractionalPage = scrollView.contentOffset.x / pageWidth;
	NSInteger nearestNumber = lround(fractionalPage);
	
	if (currentPage.pageIndex != nearestNumber)
	{
		PageViewController *swapController = currentPage;
		currentPage = nextPage;
		nextPage = swapController;
	}
	
	[currentPage updateTextViews:YES];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)newScrollView
{
	[self scrollViewDidEndScrollingAnimation:newScrollView];
	pageControl.currentPage = currentPage.pageIndex;
}

- (IBAction)changePage:(id)sender
{
	NSInteger pageIndex = pageControl.currentPage;
	
	// update the scroll view to the appropriate page
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * pageIndex;
    frame.origin.y = 0;
    [scrollView scrollRectToVisible:frame animated:YES];
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


- (void) calculateSpan
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	NSMutableArray *arrCoordinateLat;
	NSMutableArray *arrCoordinateLon;
	NSArray* annots=[mapView annotations];
	CLLocationCoordinate2D coordinate;
    CLLocationDegrees minLatitude=-90,maxLatitude=90,minLongitude=-180,maxLongitude=180;
	for (int d = 0; d < [annots count]; d++)
	{
		NSObject<MKAnnotation>* annot = [annots objectAtIndex:d];
        
		
        coordinate=annot.coordinate;
            
            if( minLatitude==-90 && maxLatitude==90){
                minLatitude = coordinate.latitude;
                maxLatitude = coordinate.latitude;
            }else{
                if( coordinate.latitude <= minLatitude ){
                    minLatitude = coordinate.latitude;
                }else{
                    if(coordinate.latitude >= maxLatitude){
                        maxLatitude = coordinate.latitude;
                    }
                }
            }
            
            if( minLongitude==-180 && maxLongitude==180){
                minLongitude = coordinate.longitude;
                maxLongitude = coordinate.longitude;
            }else{
                if( coordinate.longitude <= minLongitude ){
                    minLongitude = coordinate.longitude;
                }else{
                    if(coordinate.longitude >= maxLongitude){
                        maxLongitude = coordinate.longitude;
                    }
                }
            }
            
			
//			[arrCoordinateLat addObject:latitudeString];
//			[arrCoordinateLon addObject:longitudeString];
		
		
	}
//	isSpan = YES;
	MKCoordinateRegion region;
    CLLocation *nearest = [[CLLocation alloc] initWithLatitude:minLatitude longitude:minLongitude];
    CLLocation *farthest = [[CLLocation alloc] initWithLatitude:maxLatitude longitude:maxLongitude];
    float distance = [nearest distanceFromLocation:farthest];
    
    
    region.center.latitude = (nearest.coordinate.latitude + farthest.coordinate.latitude) / 2.0;
    region.center.longitude = (nearest.coordinate.longitude + farthest.coordinate.longitude) / 2.0;
    region.span.latitudeDelta = distance / 111319.5;
    region.span.longitudeDelta = 0.0;
    
    [self.mapView setRegion: region animated: YES];
    
    [self.mapView regionThatFits:region];
	
	[pool drain];
	
}

- (void) showMap
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	span.latitudeDelta=0.2;
	span.longitudeDelta=0.2;
	
	CLLocationCoordinate2D coordinate;// = [self addressLocation];
	
	
	NSString *mapLat = [objProperty.latitude_var stringValue];
	mapLat = mapLat!=nil?mapLat:@"--";
	
	NSString *mapLong = [objProperty.longitude_var stringValue];
	mapLong = mapLong!=nil?mapLong:@"--";
	
	if([mapLat isEqualToString:@"--"] || [mapLong isEqualToString:@"--"] || [mapLat isEqualToString:@"0"] || [mapLong isEqualToString:@"0"] )
	{
		
		propCoordinate = [self getPropCoordinate:objProperty];
		
		coordinate.latitude = propCoordinate.latitude;
		coordinate.longitude = propCoordinate.longitude;
	}
	else
	{
		
		coordinate.latitude = [objProperty.latitude_var floatValue];
		coordinate.longitude = [objProperty.longitude_var floatValue];
		
	}
	
    if( coordinate.latitude != 0 && coordinate.longitude != 0){
        [appDelegate schoolsFromServer:[NSString stringWithFormat:@"%f",coordinate.latitude] longitudeStr:[NSString stringWithFormat:@"%f",coordinate.longitude] target:self targetFunction:@selector(schoolsCallBack:delegate:)];
        region.span=span;
        region.center=coordinate;
        
        if(addAnnotation != nil) {
            [mapView removeAnnotation:addAnnotation];
            [addAnnotation release];
            addAnnotation = nil;
        }
        
        addAnnotation = [[AddressAnnotation alloc] initWithCoordinate:coordinate];
        [mapView addAnnotation:addAnnotation];
        
    }
	
	[pool drain];
    
}
-(void) schoolsCallBack:(id)resObject delegate:(id)delegate{
    if ( [resObject isKindOfClass: [NSArray class]] ){
        NSArray* gotArray = (NSArray*)resObject;
        for(int i=0;i< [gotArray count];i++){
            NSDictionary* school = [[gotArray objectAtIndex:i] objectForKey:@"school"] ;
            NSString* schoolType = [school objectForKey:@"schooltype"];
//            NSLog([NSString stringWithFormat:@"%@",school]);
            if( [schoolType isEqualToString:@"Public"]){
                CLLocationCoordinate2D lc;
                NSDecimalNumber* latitude = [school objectForKey:@"latitude"];
                NSDecimalNumber* longitude = [school objectForKey:@"longitude"];
                lc.latitude = [latitude doubleValue];
                lc.longitude = [longitude doubleValue];
                
                PublicSchoolAnnotation* psa = [[PublicSchoolAnnotation alloc] initWithCoordinate:lc details:school];
                [mapView addAnnotation:psa]; 
            }else {
                CLLocationCoordinate2D lc;
                NSDecimalNumber* latitude = [school objectForKey:@"latitude"];
                NSDecimalNumber* longitude = [school objectForKey:@"longitude"];
                lc.latitude = [latitude doubleValue];
                lc.longitude = [longitude doubleValue];
                
                PrivateSchoolAnnotation* pra = [[PrivateSchoolAnnotation alloc] initWithCoordinate:lc details:school];
                [mapView addAnnotation:pra]; 
            }
            
        }
        
    }else if([resObject isKindOfClass: [NSDictionary class]] ){
//        NSLog(resObject);
    }else{
        // should never be here 
    }
    [self calculateSpan];
}

- (CLLocationCoordinate2D) getPropCoordinate:(id)propData
{
	
	Property* annotPropertyData = propData;
	NSString *addressStr = annotPropertyData.fullAddress_var;
	addressStr = addressStr!=nil?addressStr:@"";
	
	if([addressStr isEqualToString:@"Hidden Address"])
	{
		addressStr = @"";
	}
	
	NSString* city  = annotPropertyData.city_var;
    //	city = [appDelegate cityName:city];
	city = city!=nil?city:@"";
	NSString *stateOrProvince=annotPropertyData.state_var;
	stateOrProvince = stateOrProvince!=nil?stateOrProvince:@"";
	
	NSString *geoURL = [NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/xml?address=%@,+%@,+%@&sensor=false",addressStr,city,stateOrProvince];
	geoURL = [geoURL stringByReplacingOccurrencesOfString:@" " withString:@"+" options:NSBackwardsSearch range:NSMakeRange(0, [geoURL length])];
	geoURL = [geoURL stringByReplacingOccurrencesOfString:@"#" withString:@"%23" options:NSBackwardsSearch range:NSMakeRange(0, [geoURL length])];
	
	TBXML * tbxml = [[TBXML tbxmlWithURL:[NSURL URLWithString:geoURL]] retain];
	
	// Obtain root element
	TBXMLElement * root = tbxml.rootXMLElement;
	
	// if root element is valid
	if (root) {
		// search for the first author element within the root element's children
		TBXMLElement *statusElement = [TBXML childElementNamed:@"status" parentElement:root];
		if([[TBXML textForElement:statusElement] isEqualToString:@"OK"])
		{
			TBXMLElement *resultElement = [TBXML childElementNamed:@"result" parentElement:root];
			TBXMLElement *geometryElement = [TBXML childElementNamed:@"geometry" parentElement:resultElement];
			TBXMLElement *locationElement = [TBXML childElementNamed:@"location" parentElement:geometryElement];
			TBXMLElement *latElement = [TBXML childElementNamed:@"lat" parentElement:locationElement];
			TBXMLElement *lngElement = [TBXML childElementNamed:@"lng" parentElement:locationElement];
			
			propCoordinate.latitude = [[TBXML textForElement:latElement] doubleValue];
			propCoordinate.longitude= [[TBXML textForElement:lngElement] doubleValue];
			
			
		}
		
		
	}
	
	// release resources
	[tbxml release];
	return propCoordinate;
}

- (void)mapType:(id)sender
{
	if(mapTypeSegment.selectedSegmentIndex==0){
		mapView.mapType=MKMapTypeStandard;
	}
	else if (mapTypeSegment.selectedSegmentIndex==1){
		mapView.mapType=MKMapTypeSatellite;
	}
	else if (mapTypeSegment.selectedSegmentIndex==2){
		mapView.mapType=MKMapTypeHybrid;
	}
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    SchoolDetail *schoolViewController = [[SchoolDetail alloc] initWithNibName:@"SchoolDetail" bundle:nil];
    if([view.annotation isKindOfClass:[PublicSchoolAnnotation class]]){
        schoolViewController.schoolData = [view.annotation details];
    }
	[self.navigationController pushViewController:schoolViewController animated:YES];
	[schoolViewController release];
}

- (IBAction) schoolDetails:(id)sender
{
    SchoolDetail *schoolViewController = [[SchoolDetail alloc] initWithNibName:@"SchoolDetail" bundle:nil];
    if([moreInfoView.annotation isKindOfClass:[SchoolAnnotation class]]){
        schoolViewController.schoolData = [moreInfoView.annotation details];
    }
    [self.navigationController pushViewController:schoolViewController animated:YES];
    [schoolViewController release];
	
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
	
    NSString *action = (NSString*)context;
	
    
    if([action isEqualToString:DM_ANNOTATION_SELECTED]){
        BOOL annotationAppeared = [[change valueForKey:@"new"] boolValue];
		if (annotationAppeared) {
            SchoolAnnotation* currentAnnot = ((MKAnnotationView*) object).annotation;
            [self showAnnotation:currentAnnot];
		}
		else {
			[self hideAnnotation];
		}
	}
}

- (void) stopFollowLocation {
	//NSLog(@"stopFollowLocation called.");
	
	MyAnnotation* annotation;
	for (annotation in mapView.selectedAnnotations) {
		[mapView deselectAnnotation:annotation animated:NO];
	}
	
	[self hideAnnotation];
	
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation{
    if([annotation isKindOfClass:[AddressAnnotation class]]){
        MKPinAnnotationView *annView=[[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"currentloc"]autorelease];
        annView.pinColor = MKPinAnnotationColorGreen;
        annView.animatesDrop=TRUE;
        annView.canShowCallout = YES;
        annView.calloutOffset = CGPointMake(-5, 5);
        
        UIButton *advertButton = [UIButton buttonWithType:UIButtonTypeCustom];
        advertButton.frame = CGRectMake(0, 0, 170, 32);
        advertButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        advertButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        
        [advertButton setImage:[UIImage imageNamed:@"direction_1.png"] forState:UIControlStateNormal];
        [advertButton addTarget:self action:@selector(DriveHere:) forControlEvents:UIControlEventTouchUpInside];
        
        annView.rightCalloutAccessoryView = advertButton;
        
        return annView;
    }
    else if([annotation isKindOfClass:[SchoolAnnotation class]]){
        static NSString *AnnotationViewID = @"schoolViewID";
        
        MKAnnotationView *annotationView = (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
        
        if (annotationView == nil)
        {
            annotationView = [[[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID] autorelease];
        }
        
        annotationView.canShowCallout = NO;
        
        UIImage *flagImage = nil;
        if([annotation isKindOfClass:[PublicSchoolAnnotation class]]){
            flagImage = [UIImage imageNamed:@"public_school_green.png"];
        }else{
            flagImage = [UIImage imageNamed:@"private_school_2.png"];
        }
        
        CGRect resizeRect;
        
        resizeRect.size = flagImage.size;
        CGSize maxSize = CGRectInset(self.view.bounds,
                                     10.0,
                                     10.0).size;
        maxSize.height -= self.navigationController.navigationBar.frame.size.height + 40.0;
        if (resizeRect.size.width > maxSize.width)
            resizeRect.size = CGSizeMake(maxSize.width, resizeRect.size.height / resizeRect.size.width * maxSize.width);
        if (resizeRect.size.height > maxSize.height)
            resizeRect.size = CGSizeMake(resizeRect.size.width / resizeRect.size.height * maxSize.height, maxSize.height);
        
        resizeRect.origin = (CGPoint){0.0f, 0.0f};
        UIGraphicsBeginImageContext(resizeRect.size);
        [flagImage drawInRect:resizeRect];
        UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        annotationView.image = resizedImage;
        annotationView.opaque = NO;

//        UIButton *advertButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
//        
//        
//        annotationView.rightCalloutAccessoryView = advertButton;
        
        
        [annotationView addObserver:self
                  forKeyPath:@"selected"
                     options:NSKeyValueObservingOptionNew
                     context:DM_ANNOTATION_SELECTED];
        
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *customButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightButton setFrame:CGRectMake(240.0, 15.0, 62.0, 62.0)];
        [customButton setFrame:CGRectMake(0, 0, 286, 109)];
        UIImage* indicatorImage = [UIImage imageNamed:@"disclosure.png"];
        [rightButton setImage:(UIImage*)indicatorImage forState:UIControlStateNormal];
        [customButton addTarget:self action:@selector(schoolDetails:) forControlEvents:UIControlEventTouchUpInside];
        [customButton addTarget:self action:@selector(schoolDetails:) forControlEvents:UIControlEventTouchDown];
        [customButton addTarget:self action:@selector(schoolDetails:) forControlEvents:UIControlEventTouchDownRepeat];
        [self.moreInfoView addSubview:rightButton]; 
        [self.moreInfoView addSubview:customButton]; 
        //annotationView = pinView;
//        annotationView.animatesDrop=YES;
        annotationView.userInteractionEnabled=TRUE;
        annotationView.canShowCallout=NO;
        
        return annotationView;
    }
}

- (void)showAnnotation:(SchoolAnnotation*) annot {
    
	self.moreInfoView.alpha = 1.0; 
	self.moreInfoView.titleLabel.text = annot.title;//KC-16Feb.
	self.moreInfoView.subTitleLabel.text = annot.subtitle;//KC-16Feb.
    self.moreInfoView.annotation = annot;
    
	[UIView beginAnimations: @"moveCNGCallout" context: nil];
	[UIView setAnimationDelegate: self];
	[UIView setAnimationDuration: 0.5];
	[UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
	self.moreInfoView.frame = CGRectMake(20.0, 30.0, self.moreInfoView.frame.size.width, self.moreInfoView.frame.size.height);
	[UIView commitAnimations];	
	
}

- (void)hideAnnotation {
	[UIView beginAnimations: @"moveCNGCalloutOff" context: nil];
	[UIView setAnimationDelegate: self];
	[UIView setAnimationDuration: 0.5];
	[UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];//KC- jlt
	self.moreInfoView.frame = CGRectMake(10.0, 30.0 - 500.0, self.moreInfoView.frame.size.width, self.moreInfoView.frame.size.height);
	[UIView commitAnimations];
}



- (void)dealloc {
    [super dealloc];
}


@end
