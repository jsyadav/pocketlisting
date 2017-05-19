#import "pocketListingsAppDelegate.h"
#import "AppUtils.h"
#import "Properties.h"
#import "SearchResultController.h"
#import "mTgr8More.h"
#import "mTgr8MyCriteria.h"
#import "mTgr8NewSearch.h"
#import "mTgr8SearchHistory.h"
#import "mTgr8HomeView.h"
#import "mTgr8SearchSettingObject.h"
#import "mTgr8AccessCode.h"
#import "mTgr8HomeView.h"
#import "mTgr8Favorites.h"
#import "T_brandingData.h"
#import "Property.h"
#import "MoreViewController.h"
#import "MapViewController.h"
#import "MortgageViewController.h"
#import "LocationWrapper.h"
#import "TBXML.h"
#import "CityStateData.h"
#import "Utils.h"

@implementation pocketListingsAppDelegate

@synthesize window,navigationController,API_KEY,arrPropertyImg,tabController,newSearchNavController,favoritesNavController,myCriteriaNavController,settingsObj,arrHistory
,moreNavController,isHistory,isSearchTab,isAgtListing,agentContact,agentEmail,totalProperties,agentFirstName,isSecond,
agentData,listingAdd,listingID,isDetail,imgData,agentOff,agentLastName,offLogoData,searchURL,arrFavorite,arrFavStore;
@synthesize isRangeSelector,agentOffImage,agentFeedName,isMSLSearch,isCurrentLocation,invalidCity,isApply,isTimeOut;
@synthesize arrListingData,callBack,totalID,cityIDArray,cityNameArray,countyCodeArray,countyNameArray,callTimer,
actionSheet,stateCodeArray,stateNameArray,strWebViewURL,currentDevOS,agentFacebookUrl,
isSearchMap,offset,isFavoriteMap,userPhoneNo,agentZip,isSkip,arrMyPhoto,photoIndex;
@synthesize gotGeoCodings,arrCityStateData,selectedCities,arrSelectedCtSt,arrPropertyType,arrSelectedPropType,selectedPropType,isCityDone;
@synthesize arrUpdateInOptions,currentUpdateInOption,locationManager,currentLocation,isRegionSearch,region;
@synthesize regCallbackTarget;
@synthesize regCallback;

- (NSMutableArray*)arrSearchResult {
    return arrSearchResult;
}
- (void)setArrSearchResult:(NSMutableArray*)newArray {
    NSLog(@"setting new param from class: %@",
          NSStringFromClass([newArray class]));
    [newArray retain];
    [arrSearchResult release];
    arrSearchResult = newArray;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
    gotGeoCodings = [NSMutableDictionary new];
	
	navigationController = [[UINavigationController alloc] init];
	//[navigationController.navigationBar setBarStyle:1];
    [window addSubview:navigationController.view];
	
	settingsObj = [[mTgr8SearchSettingObject alloc]init];
	agentData = [[T_brandingData alloc]init];
	arrPropertyImg = [[NSMutableArray alloc]init]; //10/05
	arrListingData = [[NSMutableArray alloc]init];
	arrSearchResult = [[NSMutableArray alloc]init];
	arrCityStateData = [[NSMutableArray alloc]init];
	
	arrSelectedPropType = [[NSMutableArray alloc]init];
	arrMyPhoto = [[NSMutableArray alloc]init];
	
	offset = 20;
		
	defaults = [NSUserDefaults standardUserDefaults];
	
	arrHistory = [defaults objectForKey:@"History"];
	
	if(arrHistory.count < 1)
	{
		arrHistory = [[NSMutableArray alloc]init];
	}
	
	arrFavStore = [defaults objectForKey:@"FavStore"];
	
	if(arrFavStore.count < 1)
	{
		arrFavStore = [[NSMutableArray alloc]init];
	}
	arrFavorite = [[NSMutableArray alloc]init];
	
	self.tabController = [[UITabBarController alloc] init];
	mTgr8HomeView *objHome = [[mTgr8HomeView alloc] init];
	self.navigationController = [[UINavigationController alloc] initWithRootViewController:objHome];
	self.navigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Home" image:[UIImage imageNamed:@"home.png"] tag:0];
	
	
	SearchResultController *objSearchRes = [[SearchResultController alloc] init];
	self.newSearchNavController = [[UINavigationController alloc] initWithRootViewController:objSearchRes];
	//self.newSearchNavController.navigationBar.barStyle = UIBarStyleBlackOpaque;
	self.newSearchNavController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Search" image:[UIImage imageNamed:@"new_search.png"] tag:1];
	
	
	mTgr8Favorites *objmTgr8Favorites = [[mTgr8Favorites alloc] init];
	self.favoritesNavController = [[UINavigationController alloc] initWithRootViewController:objmTgr8Favorites];
	//self.searchHistoryNavController.navigationBar.barStyle = UIBarStyleBlackOpaque;
	self.favoritesNavController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Favorites" image:[UIImage imageNamed:@"heart_outline.png"] tag:2];	
	
	mTgr8MyCriteria *objmTgr8MyCriteria = [[mTgr8MyCriteria alloc] init];
	self.myCriteriaNavController = [[UINavigationController alloc] initWithRootViewController:objmTgr8MyCriteria];
	//self.myCriteriaNavController.navigationBar.barStyle = UIBarStyleBlackOpaque;
	self.myCriteriaNavController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Criteria" image:[UIImage imageNamed:@"criteria.png"] tag:3];
	
	MoreViewController *objMoreViewController = [[MoreViewController alloc] init];
	self.moreNavController = [[UINavigationController alloc] initWithRootViewController:objMoreViewController];
	//self.moreNavController.navigationBar.barStyle = UIBarStyleBlackOpaque;
	self.moreNavController.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemMore tag:4];
	
	
	[tabController setViewControllers:[NSArray arrayWithObjects:self.navigationController, self.newSearchNavController, self.favoritesNavController
									   ,self.myCriteriaNavController,self.moreNavController,nil]animated:YES];
	[tabController setDelegate:self];
	
	[window addSubview:navigationController.view];
	//[window addSubview:tabController.view];
    
    NSObject* urlStr = [launchOptions objectForKey:UIApplicationLaunchOptionsURLKey];
    if(urlStr != nil){
        NSString* aStr = @"pocketlistings://";
        NSString* urlContent = [NSString stringWithFormat:@"%@",urlStr];
        urlContent =[urlContent stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if( [urlContent length]>[aStr length] && [urlContent rangeOfString:aStr].location != NSNotFound ){
            urlContent = [urlContent substringFromIndex:aStr.length];
            urlContent =[urlContent stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            [[NSUserDefaults standardUserDefaults] setObject:urlContent forKey:@"UserID"];
            [[NSUserDefaults standardUserDefaults] synchronize]; 
            NSLog(@"%@",urlStr); 
        }
        
    }
    
    self.locationManager = [[CLLocationManager alloc] init];
	self.locationManager.delegate = self;
	[self.locationManager setDistanceFilter:kCLDistanceFilterNone];
	[self.locationManager setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
	
//	if(locationManager.locationServicesEnabled)
//	{
//		[locationManager startUpdatingLocation];
//	}
    
    arrUpdateInOptions = [[NSMutableArray alloc] init];
    [arrUpdateInOptions addObject:@"Any"];
    [arrUpdateInOptions addObject:@"1 Day"];
    [arrUpdateInOptions addObject:@"2 Days"];
    [arrUpdateInOptions addObject:@"3 Days"];
    [arrUpdateInOptions addObject:@"4 Days"];
    [arrUpdateInOptions addObject:@"5 Days"];
    [arrUpdateInOptions addObject:@"6 Days"];
    [arrUpdateInOptions addObject:@"7 Days"];
    
    currentUpdateInOption = [defaults objectForKey:@"currentUpdateInOption"];
    if( currentUpdateInOption == nil){
        currentUpdateInOption = [arrUpdateInOptions objectAtIndex:0];
    }
	
	//	if([defaults objectForKey:@"UserID"] == nil)
	//	{
	mTgr8AccessCode *objAccess = [[mTgr8AccessCode alloc] initWithNibName:@"mTgr8AccessCode" bundle:nil];
	[self.navigationController pushViewController:objAccess animated:NO];
	[objAccess release];
	//	}
	//	else
	//	{
	//		NSLog(@"%@",[defaults objectForKey:@"UserID"]);
	//		[self userDataFromServer];
	//	}
	
//    [self schoolsFromServer:@"37.294399" longitudeStr:@"-122.065002"];
	
	[objHome release];
	[objSearchRes release];
	[objmTgr8Favorites release];
	[objmTgr8MyCriteria release];
	[objMoreViewController release];
	
    [window makeKeyAndVisible];
	
	return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	[defaults setObject:arrFavStore forKey:@"FavStore"];
	[defaults synchronize];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
	
	[defaults setObject:arrFavStore forKey:@"FavStore"];
	[defaults synchronize];
}

//- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
//{
//    if (!url) {  return NO; }
//    
//    NSString *userId = [url absoluteString];
//    NSLog(userId);
//    
//    [[NSUserDefaults standardUserDefaults] setObject:@"1234567890" forKey:@"UserID"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//    //[self.navigationController.topViewController setTxtUserID:@"1234567890"];
//    //[self.navigationController.topViewController userDataFromServer];
//    
////    id data = currentAgent;
////    [AppUtils getAppDelegate].API_KEY = currentAgent.apiKey_var;
////    mTgr8HomeView *objHome = [[mTgr8HomeView alloc] initWithNibName:@"mTgr8HomeView" bundle:nil];
////    objHome.userData = data;
////    [self.navigationController pushViewController:objHome animated:NO];
////    [objHome release];
//    
//    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"isUserActive"])
//    {
//        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isUserActive"];        
//    }
//   
//    return YES;
//}


-(NSString *)favoriteDataPath
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	return [documentsDirectory stringByAppendingPathComponent:@"Favorites.plist"];
}

- (BOOL) connectedToNetwork
{
	NSURLRequest *imageReq = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://google.com"]]; //leak
	NSData *returnData = [NSURLConnection sendSynchronousRequest:imageReq returningResponse:nil error:nil];
	if ([returnData length] > 0)
	{
		//isNetwork = YES;
		return YES;
	}
	
	//isNetwork = NO;
	return NO;
	
}

- (void) fetchFavPro
{
	
	if(arrFavStore.count > 0)
	{
		arrFavorite = [[NSMutableArray alloc]init];
		listingStr = [[NSMutableString alloc]init];
		
	}
	
	for(int i = 0; i < arrFavStore.count; i ++)
	{
		//[self propertiesFromServer:[appDelegate.arrFavStore objectAtIndex:i]];
		
		if(i == arrFavStore.count-1)
		{
			[listingStr appendFormat:@"%@",[arrFavStore objectAtIndex:i]];
		}
		else
		{
			[listingStr appendFormat:@"%@,",[arrFavStore objectAtIndex:i]];
		}
		
	}
	
	if(listingStr.length > 0)
	{
		[self favPropertiesFromServer:listingStr];
	}
	
}

- (void)tabBarController:(UITabBarController *)tabBarController
 didSelectViewController:(UIViewController *)viewController {
    
	self.isAgtListing= NO;

	if (viewController == [tabController.viewControllers objectAtIndex:0])
    {
		self.newSearchNavController.tabBarItem.enabled = YES;
		[self.navigationController popToRootViewControllerAnimated:NO];
		
		isFavoriteMap = NO;
	}
	
	else if (viewController == [tabController.viewControllers objectAtIndex:1])
    {
		self.isHistory = NO;
		
		isFavoriteMap = NO;
		
		[defaults setObject:@"Search" forKey:@"NavigateFrom"];
		[defaults synchronize];
        
		
		self.newSearchNavController.tabBarItem.enabled = NO;
		[self.newSearchNavController popToRootViewControllerAnimated:NO];
		
		isSearchTab = YES;
        
		// TODO
//		if([defaults boolForKey:@"isMLSLast"])
//		{
//			historyMLS = [defaults objectForKey:@"MLSHistory"];
//			//isIdSearch = YES;
//			isSearchMap = NO;
//			[self MLSFromServer:historyMLS];
//		}
//		else 
		{
			isSearchMap = YES;
			[self propertiesFromServer];
		}
		
		
	}
	
	else if (viewController == [tabController.viewControllers objectAtIndex:2])
    {
		isFavoriteMap = YES;
		isSearchMap = NO;
		[defaults setObject:@"Favorite" forKey:@"NavigateFrom"];
		[defaults synchronize];
        
		self.newSearchNavController.tabBarItem.enabled = YES;
		[self.favoritesNavController popToRootViewControllerAnimated:NO];
        
        [self fetchFavPro];
		
	}
	else if (viewController == [tabController.viewControllers objectAtIndex:4])
    {
		isFavoriteMap = NO;
		
		[defaults setObject:@"More" forKey:@"NavigateFrom"];
		[defaults synchronize];
        
		
		self.newSearchNavController.tabBarItem.enabled = YES;
		[self.moreNavController popToRootViewControllerAnimated:NO];
	}
	else 
	{
		isFavoriteMap = NO;
		
		self.newSearchNavController.tabBarItem.enabled = YES;
	}
	
}


-(void)showActivityViewer
{
	
	actionSheet = [[UIActionSheet alloc]initWithTitle:@"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
	
	activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	activityView.center = window.center;
	
	[actionSheet addSubview:activityView];
	[activityView startAnimating];
	[actionSheet setAlpha:0.3];
	[actionSheet showInView:self.window];
	[actionSheet setBounds:CGRectMake(0,0,320, 490)];
	
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
	if(agentEmail.length > 0)
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
	if(agentContact.length > 0)
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
	if(agentContact.length > 0)
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
	[actionSheet showFromTabBar:self.tabController.tabBar];
	[actionSheet setBounds:CGRectMake(0,0,320, 420)];
	
	[imgBng release];
	[btnEmail release];
	[btnText release];
	[btnCall release];
	[btnCancel release];
}

- (void) detailActionsheetShow
{
	
	UIImageView *agentImg = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 90, 90)];
	if(imgData > 0)
	{
		agentImg.image = [UIImage imageWithData:imgData];
	}
	else
	{
		agentImg.image = [UIImage imageNamed:@"agent_image_notavailable.png"];
	}
	[agentImg setContentMode:UIViewContentModeScaleAspectFit];
	
	UILabel *lblAgentName = [[UILabel alloc]initWithFrame:CGRectMake(120, 40, 75, 21)];
	lblAgentName.text = [NSString stringWithFormat:@"%@ %@", agentFirstName,agentLastName];
	[lblAgentName setBackgroundColor:[UIColor clearColor]];
	[lblAgentName setTextColor:[UIColor whiteColor]];
	[lblAgentName sizeToFit];
	
	UILabel *lblAgentOff = [[UILabel alloc]initWithFrame:CGRectMake(120, 60, 200, 90)];
	lblAgentOff.text = agentOff;
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
	if(agentEmail.length > 0)
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
	if(agentContact.length > 0)
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
	if(agentContact.length > 0)
	{
		[btnCall setEnabled:YES];
	}
	else
	{
		[btnCall setEnabled:NO];
	}
	
	UIButton *btnCancel = [[UIButton alloc] initWithFrame:CGRectMake(15, 210, 291, 43)];
	[btnCancel setImage:[UIImage imageNamed:@"btn_Cancel.png"] forState:UIControlStateNormal];
	[btnCancel addTarget:self action:@selector(CancelAction) forControlEvents:UIControlEventTouchUpInside];
	
	
	[actionSheet addSubview:imgBng];
	[actionSheet addSubview:agentImg];
	[actionSheet addSubview:lblAgentName];
	[actionSheet addSubview:lblAgentOff];
	[actionSheet addSubview:btnEmail];
	[actionSheet addSubview:btnText];
	[actionSheet addSubview:btnCall];
	[actionSheet addSubview:btnCancel];
	[actionSheet showFromTabBar:self.tabController.tabBar];
	[actionSheet setBounds:CGRectMake(0,0,320, 520)];
	
	[imgBng release];
	[agentImg release];
	[lblAgentName release];
	[lblAgentOff release];
	[btnEmail release];
	[btnText release];
	[btnCall release];
	[btnCancel release];
}

-(void)sendMail:(NSString*)subject to:(NSString*)to body:(NSString*)body{
    [self CancelAction];
    
    NSString *mailString = [NSString stringWithFormat:@"mailto:?to=%@&subject=%@&body=%@",
							[to stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding],
							[subject stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding],
							[body  stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
	
	
	if(![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:mailString]]){
		NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
		UIAlertView *progressAlert = [[UIAlertView alloc] initWithTitle:@""
																message: @"Could not find an application to\ne-mail. Please configure."
															   delegate: self
													  cancelButtonTitle: nil
													  otherButtonTitles: @"Ok",nil];
		
		[progressAlert show];
		[progressAlert release];
		[pool drain];
		
	}
	else
	{
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:mailString]];
	}
}

- (void)SendEmail
{
	[self CancelAction];
	NSString *to;
	if(agentEmail.length > 0)
	{
		to = agentEmail;
	}
	else
	{
		to = @"nshukla@mtgr8.com";
	}
	
	NSString *subject;
	NSString *body;
	
	if(isDetail)
	{
		isDetail = NO;
		subject = [NSString stringWithFormat:@"MLS# %@",listingID];
		body = [NSString stringWithFormat:@"I am interested in learning more details about this listing:\n%@\n\n%@",listingAdd,[self getStandardEmailFooter]];
	}
	else
	{
		subject = @"pocketListings";
		body = @"";
	}
	
	NSString *mailString = [NSString stringWithFormat:@"mailto:?to=%@&subject=%@&body=%@",
							[to stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding],
							[subject stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding],
							[body  stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
	
	
	if(![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:mailString]]){
		NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
		UIAlertView *progressAlert = [[UIAlertView alloc] initWithTitle:@""
																message: @"Could not find an application to\ne-mail. Please configure."
															   delegate: self
													  cancelButtonTitle: nil
													  otherButtonTitles: @"Ok",nil];
		
		[progressAlert show];
		[progressAlert release];
		[pool drain];
		
	}
	else
	{
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:mailString]];
	}
	
}
- (void)SendText
{
	[self CancelAction];
	NSString *telString;
	
	if(agentContact.length > 0)
	{
		telString = [NSString stringWithFormat:@"sms:%@",agentContact];
	}
	else
	{
		telString = [NSString stringWithFormat:@"sms:408-832-8904"];
	}
	
	
	
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
	
	if(agentContact.length > 0)
	{
		telString = [NSString stringWithFormat:@"tel:%@",agentContact];
	}
	else
	{
		telString = [NSString stringWithFormat:@"tel:408-832-8904"];
	}
	//NSString *telString = [NSString stringWithFormat:@"tel:408-832-8904"];
	
	
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


- (void)actionSheetDismiss
{
	[actionSheet dismissWithClickedButtonIndex:0 animated:YES];
}

- (void)performDismiss: (NSTimer *)timer
{
	[activityView stopAnimating];
	[actionSheet dismissWithClickedButtonIndex:0 animated:NO];
}

- (void)performDismiss2: (NSTimer *)timer
{
	[activityView2 stopAnimating];
	[actionSheet2 dismissWithClickedButtonIndex:0 animated:NO];
}


-(void)showActivityViewer2
{
	actionSheet2 = [[UIActionSheet alloc]initWithTitle:@"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
	
	activityView2 = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	activityView2.center = window.center;
	
	[actionSheet2 addSubview:activityView2];
	[activityView2 startAnimating];
	[actionSheet2 setAlpha:0.3];
	[actionSheet2 showInView:self.window];
	[actionSheet2 setBounds:CGRectMake(0,0,320, 490)];
}

-(void) agentPropsFromServer:(NSString*)searchQuery resultTarget:(id)target targetFunction:(SEL)function{
    if( searchQuery != nil){
        [self showActivityViewer2];
        NSString* urlStr = searchQuery;
        
        urlStr = [urlStr stringByReplacingOccurrencesOfString:@"+" withString:@"%2B" options:NSBackwardsSearch range:NSMakeRange(0, [urlStr length])];
		urlStr = [urlStr stringByReplacingOccurrencesOfString:@" " withString:@"%20" options:NSBackwardsSearch range:NSMakeRange(0, [urlStr length])];
        urlStr = [NSString stringWithFormat:@"%@?%@",searchURL,urlStr];
        NSURL *serviceURL = [NSURL URLWithString:urlStr];
        //        NSLog(@"History URL=%@",serviceURL);
		NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:serviceURL];
		
		[urlRequest setHTTPMethod:@"GET"];
		[urlRequest addValue: @"iPhone" forHTTPHeaderField:@"User-Agent"];
		[urlRequest addValue: @"keep-alive" forHTTPHeaderField:@"Connection"];
		//[urlRequest addValue: @"gzip" forHTTPHeaderField:@"Accepts-Encoding"];
		[urlRequest addValue:@"gzip,deflate" forHTTPHeaderField:@"Accepts-Encoding"];
        
		[urlRequest addValue: @"GET" forHTTPHeaderField:@"Method"];
		[urlRequest addValue: @"*/*" forHTTPHeaderField:@"Accept"];
		
		[AppUtils requestServer:urlRequest resultTarget:target targetFunction:function];
    }
}

-(void) propertiesFromServer:(NSString*)searchParamsAsQuery {
    if( searchParamsAsQuery != nil){
        [self showActivityViewer2];
        NSString* urlStr = searchParamsAsQuery;
        
        urlStr = [urlStr stringByReplacingOccurrencesOfString:@"+" withString:@"%2B" options:NSBackwardsSearch range:NSMakeRange(0, [urlStr length])];
		urlStr = [urlStr stringByReplacingOccurrencesOfString:@" " withString:@"%20" options:NSBackwardsSearch range:NSMakeRange(0, [urlStr length])];
        urlStr = [NSString stringWithFormat:@"%@?%@",searchURL,urlStr];
        NSURL *serviceURL = [NSURL URLWithString:urlStr];
//        NSLog(@"History URL=%@",serviceURL);
		NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:serviceURL];
        [self startTimeOut];
		
		[urlRequest setHTTPMethod:@"GET"];
		[urlRequest addValue: @"iPhone" forHTTPHeaderField:@"User-Agent"];
		[urlRequest addValue: @"keep-alive" forHTTPHeaderField:@"Connection"];
		//[urlRequest addValue: @"gzip" forHTTPHeaderField:@"Accepts-Encoding"];
		[urlRequest addValue:@"gzip,deflate" forHTTPHeaderField:@"Accepts-Encoding"];
        
		[urlRequest addValue: @"GET" forHTTPHeaderField:@"Method"];
		[urlRequest addValue: @"*/*" forHTTPHeaderField:@"Accept"];
		
		[AppUtils requestServer:urlRequest resultTarget:self targetFunction:@selector(propertiesCallback:delegate:)];
    }
}

-(void)propertiesFromServer
{
	
	//NSString* urlStr=[NSString stringWithFormat:@"http://getyouridx.agentstorm.com/properties.xml?apikey=%@&limit=20&sort=ListPrice&sort_direction=DESC&Bedrooms=2+&FullBaths=2+",self.API_KEY];
	//ASC
	
	NSString *getURL = nil;
    if (isRegionSearch ){
        getURL = [self getRegionSearchURLString:region];
    }   else{
        getURL = [self getCompleteSearchURLString];
    }
	
	if(getURL != nil)
	{
		[self showActivityViewer2];
        NSString* queryParamStr = [NSString stringWithFormat:@"apikey=%@&limit=20%@%@&%@%@",self.API_KEY,[self getSortingBy],[self getSortingDirection],[self getListingStatus],getURL];
		NSString* urlStr=[NSString stringWithFormat:@"%@?%@",searchURL,queryParamStr];
		urlStr = [urlStr stringByReplacingOccurrencesOfString:@"+" withString:@"%2B" options:NSBackwardsSearch range:NSMakeRange(0, [urlStr length])];
		urlStr = [urlStr stringByReplacingOccurrencesOfString:@" " withString:@"%20" options:NSBackwardsSearch range:NSMakeRange(0, [urlStr length])];
		NSLog(@"url: %@",urlStr);
		
		if(isApply)
		{
			isApply = NO;
			[self storeHistory:queryParamStr];
		}
		
		[self startTimeOut];
		
		NSURL *serviceURL = [NSURL URLWithString:urlStr];
		NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:serviceURL];
		
		[urlRequest setHTTPMethod:@"GET"];
		[urlRequest addValue: @"iPhone" forHTTPHeaderField:@"User-Agent"];
		[urlRequest addValue: @"keep-alive" forHTTPHeaderField:@"Connection"];
		//[urlRequest addValue: @"gzip" forHTTPHeaderField:@"Accepts-Encoding"];
		[urlRequest addValue:@"gzip,deflate" forHTTPHeaderField:@"Accepts-Encoding"];
        
		[urlRequest addValue: @"GET" forHTTPHeaderField:@"Method"];
		[urlRequest addValue: @"*/*" forHTTPHeaderField:@"Accept"];
		
		[AppUtils requestServer:urlRequest resultTarget:self targetFunction:@selector(propertiesCallback:delegate:)];
		
	}
	
}

/**
* For this the default return value is '&sort_direction=ASC'
*/
- (NSString *) getSortingDirection
{
	if([defaults objectForKey:@"SortDirection"] != nil)
	{
		if([[defaults objectForKey:@"SortDirection"] isEqualToString:@"None"])
		{
			return @"&sort_direction=ASC";
		}
		else 
		{
			return [NSString stringWithFormat:@"&sort_direction=%@",[defaults objectForKey:@"SortDirection"]];
		}
        
		
	}
	return @"&sort_direction=ASC";
}

/**
* For this the default return value is '&sort=ListPrice'
*/
- (NSString *) getSortingBy
{
	if([defaults objectForKey:@"SortBy"] != nil)
	{
		if([[defaults objectForKey:@"SortBy"] isEqualToString:@"None"])
		{
			return @"&sort=ListPrice";
		}
		else {
			return [NSString stringWithFormat:@"&sort=%@",[defaults objectForKey:@"SortBy"]];
		}
        
	}
    //default value should be ListPrice
	return @"&sort=ListPrice";
}


- (NSString *) getListingStatus
{
    //	if([defaults objectForKey:@"SortListingStatus"] != nil)
    //	{
    //		return [defaults objectForKey:@"SortListingStatus"];
    //	}
    //	return @"A";
	
    //	if (agentFeedName != NULL && [agentFeedName rangeOfString:@"mlslistings"].location != NSNotFound)
    //	{
    //		return @"StatusCode=1";
    //	}
    //	else {
    //		return @"Status=A";
    //	}
    int lsStat = [defaults integerForKey:@"listingstatus"];
    if( lsStat == 1){
        return @"Status=Active";
    }else if(lsStat ==2){
        return @"Status=Pending";
    }else{
	return @"Status=A";
    }
}

- (NSString *) getSortingDirectionShow
{
	if([defaults objectForKey:@"SortDirectionShow"] != nil)
	{
		return [defaults objectForKey:@"SortDirectionShow"];
	}
	return @"Ascending";
}

- (NSString *) getSortingByShow
{
	if([defaults objectForKey:@"SortByShow"] != nil)
	{
		return [defaults objectForKey:@"SortByShow"];
	}
	return @"ListPrice";
}

- (NSString *) getPropertyType
{
	if([defaults objectForKey:@"SelectedPropertyTypeStr"] != nil)
	{
		if([[defaults objectForKey:@"SelectedPropertyTypeStr"] isEqualToString:@"ALL"])
		{
			return @"";
		}
		else {
			return [NSString stringWithFormat:@"&ExteriorFeatures=%@",[defaults objectForKey:@"SelectedPropertyTypeStr"]];
		}
        
		
	}
	return @"";
}


- (void) startTimeOut
{
	isTimeOut = NO;
	callTimer = [NSTimer scheduledTimerWithTimeInterval:60.0f target:self selector:@selector(callTimeOut) userInfo:nil repeats:NO];
}

- (void) callTimeOut
{
	
	[self invalidTimer];
	
	isTimeOut = YES;
	UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"No response from server. Please try again later." message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alertView show];
	[alertView release];
	
	//NSLog(@"callTimeOut alert");
	
	//	if([actionSheet isFirstResponder])
	//	{
	[self performDismiss:0];
	[self performDismiss2:0];
	//	}
	
}

- (void) invalidTimer
{
	//NSLog(@"Timer invalid start");
	if([callTimer isValid])
	{
		[callTimer invalidate];
	}
	//NSLog(@"Timer invalid stop");
}


- (void) storeHistory:(NSString*)url
{
	NSDateFormatter *format = [[[NSDateFormatter alloc] init] autorelease];
	[format setDateFormat:@"E/MMM dd, yyyy HH:mm"];
	
	NSDate *now = [[[NSDate alloc] init]autorelease];
	
	NSString *timeInfo = [format stringFromDate:now];
	NSString *history = [NSString stringWithFormat:@"origurl=%@    %@",url,timeInfo];
//	NSString *history = url;
	
//	NSString *city = [defaults stringForKey:@"historyCity"];
//	city = city!=nil?city:@"";
//    
//    if([[self getFormattedZip] compare:@"--"] != NSOrderedSame){
//        city=@"";
//    }
//    
//	
//	NSString *state = [defaults stringForKey:@"state"];
//	state = state!=nil?state:@"";
	
//	if(isMSLSearch)
//	{
//		isMSLSearch = NO;
//		history = [NSString stringWithFormat:@"ListingId-%@\n%@",[defaults objectForKey:@"MLSHistory"],timeInfo];
//		
//		[defaults setBool:YES forKey:@"isMLSLast"];
//		
//	}
//	else
//	{
//		[defaults setBool:NO forKey:@"isMLSLast"];
//		history = [NSString stringWithFormat:@"City-%@State-%@SqFt-%@,Price-%@,Bed-%@,Bath-%@,Zip-%@sort-%@,ExteriorFeatures-%@,Status-%@,only_openhouse-%@,street_name-%@,sort_direction-%@,\n%@",city,state,[self getHistorySqFt],[self getHistoryPrice],[self getHistoryBed],[self getHistoryBath],[self getFormattedZip],[self getHistorySortingBy],[self getPropertyType],[self getListingStatus],[self getOnlyOpenhouseParam],[self getStreetString],[self getHistorySortingDirection],timeInfo];
//		
//	}
	
	
	
	if(arrHistory.count == 10)
	{
		[arrHistory removeObjectAtIndex:0];
	}
	
	[arrHistory addObject:history];
	
	[defaults setObject:arrHistory forKey:@"History"];
	[defaults synchronize];
	
	//NSLog(@"History: %@",history);
	
//	[defaults synchronize];
	
}

- (NSString *)getRegionSearchURLString:(MKCoordinateRegion)lregion{
    NSString *age = [self getUpdatedIn];
    CLLocationDegrees cLat= lregion.center.latitude;
    CLLocationDegrees cLong = lregion.center.longitude;
    CLLocationDegrees cLatDelta = lregion.span.latitudeDelta;
    CLLocationDegrees cLongDelta= lregion.span.longitudeDelta;
    
    NSString* longitude = [NSString stringWithFormat:@"%1f:%1f",cLong-cLongDelta/2,cLong+cLongDelta/2];
    NSString* latitude  = [NSString stringWithFormat:@"%1f:%1f",cLat-cLatDelta/2,cLat+cLatDelta/2];
    
    return [NSString stringWithFormat:@"%@%@%@%@%@%@&Longitude=%@&Latitude=%@%@&%@",[self getFormattedPrice],[self getFormattedBed],[self getFormattedBath],[self getFormattedSqFt],[self getPropertyType],[self getOpenhouseParam],longitude,latitude,age,[self getStreetString]];
}

- (NSString *)getCompleteSearchURLString
{
	NSString *zipCode = [defaults stringForKey:@"zipCode"];
    NSString *age = [self getUpdatedIn];
	
	NSString *city = [defaults stringForKey:@"city"];
	city = city!=nil?city:@"";
	
    //	NSString *state = [self getFormattedState];
	
	if(zipCode.length > 0)
	{
		return [NSString stringWithFormat:@"%@%@%@%@%@%@&Zip=%@%@&%@",[self getFormattedPrice],[self getFormattedBed],[self getFormattedBath],[self getFormattedSqFt],[self getPropertyType],[self getOpenhouseParam],zipCode,age,[self getStreetString]];
	}
	else
	{
		if(city.length > 0)
		{
			return [NSString stringWithFormat:@"%@%@%@%@%@%@&City=%@%@&%@",[self getFormattedPrice],[self getFormattedBed],[self getFormattedBath],[self getFormattedSqFt],[self getPropertyType],[self getOpenhouseParam],city,age,[self getStreetString]];
		}
		else 
		{
			UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Set City or Zip in Criteria." message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[alert show];
			[alert release];
			
			return nil;
		}
		
	}
}

-(NSString*)getStreetString{
    NSString* stVal = [defaults stringForKey:@"streetname"];
    if( stVal != nil){
        return [NSString stringWithFormat:@"FullAddress=%@",stVal];
    }
    return @"";
}


- (NSString *)getFormattedCity:(NSString *)CityName
{
	NSString *strCity = CityName;
	strCity = [strCity stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
	strCity = [strCity stringByReplacingOccurrencesOfString:@"  " withString:@" " options:NSBackwardsSearch range:NSMakeRange(0, [strCity length])];
	
	NSArray *arrCity = nil;//[[NSArray alloc]autorelease];
	arrCity = [strCity componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@","]];
	
	NSMutableString *cityID = [[[NSMutableString alloc]init]autorelease];
	
	for(int i = 0; i < arrCity.count; i ++)
	{
		
		NSString *strCity = [arrCity objectAtIndex:i];
		
		if([strCity length] > 0)
		{
			NSString *strFormattedCity = [self formattedCity:strCity];
			strFormattedCity = [strFormattedCity stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
			
			if(i == arrCity.count-1)
			{
				[cityID appendFormat:@"%@",strFormattedCity];
			}
			else
			{
				[cityID appendFormat:@"%@,",strFormattedCity];
			}
			
		}
		
	}
	
	return cityID;
	
}

- (NSString *) formattedCity:(NSString *)city
{
	//NSString *city = txtCity.text;
	city = [city stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	city = [city stringByReplacingOccurrencesOfString:@"  " withString:@" " options:NSBackwardsSearch range:NSMakeRange(0, [city length])];
	
	NSMutableString *cityName = [[[NSMutableString alloc]init]autorelease];
	
	if(city.length > 0)
	{
		NSArray *array = [city componentsSeparatedByString:@" "];
		for (int a = 0; a < array.count; a++)
		{
			NSString *firstCapChar = [[[array objectAtIndex:a] substringToIndex:1] capitalizedString];
			NSString *cappedString = [[array objectAtIndex:a] stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:firstCapChar];
			
			[cityName appendFormat:@"%@ ",cappedString];
		}
		return cityName;
	}
	
	return city;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if([alertView.title isEqualToString:@"Set City or Zip in Criteria."])
	{
		self.newSearchNavController.tabBarItem.enabled = YES;
		tabController.selectedViewController = [tabController.viewControllers objectAtIndex:3];
	}
}

-(NSString *)getOpenhouseParam
{
    BOOL isOnlyOH = NO;
    isOnlyOH = [defaults boolForKey:@"onlyopenhouse"];
    if( isOnlyOH ){
        return @"&OpenHouse=1";
    }else{
        return @"";
    }
}

-(NSString *)getOnlyOpenhouseParam
{
    BOOL isOnlyOH = NO;
    isOnlyOH = [defaults boolForKey:@"onlyopenhouse"];
    if( isOnlyOH ){
        return @"OpenHouse=1";
    }else{
        return @"";
    }
}

-(NSString*) getUpdatedIn{
    NSMutableString* res= [[NSMutableString alloc] init];
    NSDate* today = [NSDate date];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    
    if( [currentUpdateInOption isEqualToString:@"Any"])
    {
        today=nil;
    }else if([currentUpdateInOption isEqualToString:@"1 Day"]){
        today = [today dateByAddingTimeInterval:-60*60*24];
        
    }else if([currentUpdateInOption isEqualToString:@"2 Days"]){
        today = [today dateByAddingTimeInterval:-60*60*24*2];
    }else if([currentUpdateInOption isEqualToString:@"3 Days"]){
        today = [today dateByAddingTimeInterval:-60*60*24*3];
    }else if([currentUpdateInOption isEqualToString:@"4 Days"]){
        today = [today dateByAddingTimeInterval:-60*60*24*4];
    }else if([currentUpdateInOption isEqualToString:@"5 Days"]){
        today = [today dateByAddingTimeInterval:-60*60*24*5];
    }else if([currentUpdateInOption isEqualToString:@"6 Days"]){
        today = [today dateByAddingTimeInterval:-60*60*24*6];
    }else if([currentUpdateInOption isEqualToString:@"7 Days"]){
        today = [today dateByAddingTimeInterval:-60*60*24*7];
    }
    
    if(today!=nil){
    NSString *theDate = [dateFormat stringFromDate:today];
    [res appendFormat:@"&Age=%@+",theDate];
    }
    
    [dateFormat release];
    return res;
}

- (NSString *)getFormattedPrice
{
    NSString *minPrice;
    NSString *maxPrice;
    
    if([defaults stringForKey:@"startPrice"]==nil || [defaults stringForKey:@"endPrice"]==nil)
    {
        minPrice = settingsObj.selectedStartPrice;
        maxPrice = settingsObj.selectedEndPrice;
    }
    else
    {
        minPrice = [defaults stringForKey:@"startPrice"];
        maxPrice = [defaults stringForKey:@"endPrice"];
    }
    
    NSString *minSuffix = [minPrice substringFromIndex:([minPrice length]-1)];
    NSString *maxSuffix = [maxPrice substringFromIndex:([maxPrice length]-1)];    
	
	NSString *startPrice=nil;
	NSString *endPrice=nil;
    NSString *noMax=nil;
	
	
    
    if([minSuffix isEqualToString:@"K"] || [minSuffix isEqualToString:@"k"])
    {
        startPrice = [[minPrice substringFromIndex:1] substringToIndex:([minPrice length]-2)];
        startPrice = [NSString stringWithFormat:@"%@000",startPrice];
    }
    else if([minSuffix isEqualToString:@"M"] || [minSuffix isEqualToString:@"m"])
    {
        startPrice = [[minPrice substringFromIndex:1] substringToIndex:([minPrice length]-2)];
        startPrice = [NSString stringWithFormat:@"%@000000",startPrice];
    }
    if([maxSuffix isEqualToString:@"K"] || [maxSuffix isEqualToString:@"k"])
    {
        endPrice = [[maxPrice substringFromIndex:1] substringToIndex:([maxPrice length]-2)];
        endPrice = [NSString stringWithFormat:@"%@000",endPrice];
        noMax = @"NO";
    }
    else if([maxSuffix isEqualToString:@"M"] || [maxSuffix isEqualToString:@"m"])
    {
        endPrice = [[maxPrice substringFromIndex:1] substringToIndex:([maxPrice length]-2)];
        endPrice = [NSString stringWithFormat:@"%@000000",endPrice];
        noMax = @"NO";
    }
    
    else if([maxSuffix isEqualToString:@"+"])
    {
        noMax = @"YES";
		maxPrice = @"No Max";
    }
    
    if([minPrice isEqualToString:@"$1.2M"])
    {
        startPrice = [NSString stringWithFormat:@"1200000"];
    }
    if([maxPrice isEqualToString:@"$1.2M"])
    {
        endPrice = [NSString stringWithFormat:@"1200000"];
        noMax = @"NO";
    }
	
	if([minPrice isEqualToString:@"$1.4M"])
    {
        startPrice = [NSString stringWithFormat:@"1400000"];
    }
    if([maxPrice isEqualToString:@"$1.4M"])
    {
        endPrice = [NSString stringWithFormat:@"1400000"];
        noMax = @"NO";
    }
	
	if([minPrice isEqualToString:@"$1.6M"])
    {
        startPrice = [NSString stringWithFormat:@"1600000"];
    }
    if([maxPrice isEqualToString:@"$1.6M"])
    {
        endPrice = [NSString stringWithFormat:@"1600000"];
        noMax = @"NO";
    }
	
	if([minPrice isEqualToString:@"$1.8M"])
    {
        startPrice = [NSString stringWithFormat:@"1800000"];
    }
    if([maxPrice isEqualToString:@"$1.8M"])
    {
        endPrice = [NSString stringWithFormat:@"1800000"];
        noMax = @"NO";
    }
	
	if([minPrice isEqualToString:@"$2.5M"])
    {
        startPrice = [NSString stringWithFormat:@"2500000"];
    }
    if([maxPrice isEqualToString:@"$2.5M"])
    {
        endPrice = [NSString stringWithFormat:@"2500000"];
        noMax = @"NO";
    }
	
	if([minPrice isEqualToString:@"No Min"] && [maxPrice isEqualToString:@"No Max"])
	{
		//return[NSString stringWithFormat:@"2000:1000000"];
		return @"";
	}
	else if([minPrice isEqualToString:@"No Min"])
	{
		return [NSString stringWithFormat:@"&ListPrice=%@-",endPrice];
	}
	else if([maxPrice isEqualToString:@"No Max"])
	{
		return [NSString stringWithFormat:@"&ListPrice=%@+",startPrice];
	}
    
    if([noMax isEqualToString:@"YES"])
    {
        return [NSString stringWithFormat:@"&ListPrice=%@+",startPrice];
        //noMax = @"NO";
    }
    else
    {
        return [NSString stringWithFormat:@"&ListPrice=%@:%@",startPrice,endPrice];
    }
	
}

- (NSString *)getFormattedBed
{
	
    NSString *minBed;
    NSString *maxBed;
    if([defaults stringForKey:@"minBed"]==nil || [defaults stringForKey:@"maxBed"]==nil)
    {
        minBed = settingsObj.selectedMinBedroom;
        maxBed = settingsObj.selectedMaxBedroom;
    }
    else
    {
        minBed = [defaults stringForKey:@"minBed"];
        maxBed = [defaults stringForKey:@"maxBed"];
    }
	
	if([minBed isEqualToString:@"No Min"] && [maxBed isEqualToString:@"No Max"] || [minBed isEqualToString:@"No Min"] && [maxBed isEqualToString:@"6+"])
	{
		return @"";
		//return[NSString stringWithFormat:@"0.9:5.9"];
	}
	else if([minBed isEqualToString:@"No Min"])
	{
		float maxBe = [maxBed floatValue];
		maxBe = maxBe + 0.1;
		return [NSString stringWithFormat:@"&Bedrooms=%f-",maxBe];
	}
	else if([maxBed isEqualToString:@"No Max"])
	{
		float minBe = [minBed floatValue];
		minBe = minBe - 0.1;
		
		return [NSString stringWithFormat:@"&Bedrooms=%f+",minBe];
	}
	
    if([maxBed isEqualToString:@"6+"])
    {
		float minBe = [minBed floatValue];
		minBe = minBe - 0.1;
		
        return [NSString stringWithFormat:@"&Bedrooms=%f+", minBe];
    }
    else
    {
		float maxBe = [maxBed floatValue];
		maxBe = maxBe + 0.1;
		
		float minBe = [minBed floatValue];
		minBe = minBe - 0.1;
		
        return [NSString stringWithFormat:@"&Bedrooms=%@:%@",[NSString stringWithFormat:@"%f",minBe], [NSString stringWithFormat:@"%f",maxBe]];   
    }
	
}

- (NSString *)getFormattedBath
{
    
    NSString *minBath;
    NSString *maxBath;
    if([defaults stringForKey:@"minBath"]==nil || [defaults stringForKey:@"maxBath"]==nil)
    {
        minBath = settingsObj.selectedMinBathroom;
        maxBath = settingsObj.selectedMaxBathroom;   
    }
    else
    {
        minBath = [defaults stringForKey:@"minBath"];
        maxBath = [defaults stringForKey:@"maxBath"];
    }
	
	if([minBath isEqualToString:@"No Min"] && [maxBath isEqualToString:@"No Max"] || [minBath isEqualToString:@"No Min"] && [maxBath isEqualToString:@"6+"])
	{
		//return[NSString stringWithFormat:@"0.9:5.9"];
		return @"";
	}
	else if([minBath isEqualToString:@"No Min"])
	{
		float maxBa = [maxBath floatValue];
		maxBa = maxBa + 0.1;
		
		return [NSString stringWithFormat:@"&FullBathrooms=%f-",maxBa];
	}
	else if([maxBath isEqualToString:@"No Max"])
	{
		
		float minBa = [minBath floatValue];
		minBa = minBa - 0.1;
		
		return [NSString stringWithFormat:@"&FullBathrooms=%f+",minBa];
	}
	
    if([maxBath isEqualToString:@"6+"])
    {
		float minBa = [minBath floatValue];
		minBa = minBa - 0.1;
		
        return [NSString stringWithFormat:@"&FullBathrooms=%f+", minBa];
    }
    else
    {
		float maxBa = [maxBath floatValue];
		maxBa = maxBa + 0.1;
		
		float minBa = [minBath floatValue];
		minBa = minBa - 0.1;
		
        return [NSString stringWithFormat:@"&FullBathrooms=%@:%@",[NSString stringWithFormat:@"%f",minBa], [NSString stringWithFormat:@"%f",maxBa]];
    }
	
}

- (NSString *)getFormattedSqFt
{
    
    NSString *minSqFt;
    NSString *maxSqFt;
    if([defaults stringForKey:@"minSqFt"]==nil || [defaults stringForKey:@"maxSqFt"]==nil)
    {
        minSqFt = settingsObj.selectedMinSquarefootage;
        maxSqFt = settingsObj.selectedMaxSquarefootage;   
    }
    else
    {
        minSqFt = [defaults stringForKey:@"minSqFt"];
        maxSqFt = [defaults stringForKey:@"maxSqFt"];
    }
	
	if([minSqFt isEqualToString:@"No Min"] && [maxSqFt isEqualToString:@"No Max"] || [minSqFt isEqualToString:@"No Min"] && [maxSqFt isEqualToString:@"7500+"])
	{
		//return[NSString stringWithFormat:@"1:7500"];
		return @"";
	}
	else if([minSqFt isEqualToString:@"No Min"])
	{
		return [NSString stringWithFormat:@"&SqFt=%@-",maxSqFt];
	}
	else if([maxSqFt isEqualToString:@"No Max"])
	{
		return [NSString stringWithFormat:@"&SqFt=%@+",minSqFt];
	}
	
    if([maxSqFt isEqualToString:@"7500+"])
    {
        return [NSString stringWithFormat:@"&SqFt=%@+", minSqFt];
    }
    else
    {
        return [NSString stringWithFormat:@"&SqFt=%@:%@",minSqFt, maxSqFt];
    }
}


//- (NSString *)getFormattedState
//{
//	NSString *strState = [defaults stringForKey:@"state"];
//	
//	if(strState.length > 0)
//	{
//		if (agentFeedName != NULL && [agentFeedName rangeOfString:@"mred"].location != NSNotFound)
//		{
//			return [self stateName:strState];
//		}
//		else 
//		{
//			return strState;
//		}
//		
//		
//	}
//	return @"";
//}

-(void) propertiesCallback:(id)document delegate:(id)delegate{
	
	if(!isTimeOut)
	{
		[self invalidTimer];
		
		if(delegate!=nil){
			[document retain];
			[delegate retain];

			if(![[XMLUtil getXMLStringValue:@"@count" inNode:[document rootElement]] isEqual: @"0"]) //leak
			{
				totalProperties = [[XMLUtil getXMLStringValue:@"@totalcount" inNode:[document rootElement]]retain];
				if([totalProperties intValue] <= 500)
				{
					Properties* properties = [[[Properties alloc] initWithXML:[document rootElement]] autorelease];
					
//					cvCtrl = [[SearchResultController alloc] initWithNibName:@"SearchResultController" bundle:nil];
                    
                    cvCtrl = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
//                    objMapViewController.propertyData = appDelegate.arrFavorite;
//                    [self.navigationController pushViewController:objMapViewController animated:NO];
//                    [objMapViewController release];
                    
					[arrSearchResult removeAllObjects];
					for(int i=0;i<properties.property_var.count;i++){
						id aI = [[properties property_var] objectAtIndex:i];
						[arrSearchResult addObject:aI];
					}
					//cvCtrl.reData = properties;
					offset = 20;
					
					if(isSearchTab)
					{
						
						[self.newSearchNavController pushViewController:cvCtrl animated:NO];
					}else if(isHistory){
                        [self.moreNavController pushViewController:cvCtrl animated:NO];
                    }
					else
					{
						[self.navigationController pushViewController:cvCtrl animated:NO];
					}
					
					
					[cvCtrl release];
					
				}
				else
				{
					UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"More than 500 properties returned. Please modify search criteria." message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
					[alertView show];
					[alertView release];
				}
			}
			else
			{
				if(isAgtListing){
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"I am working hard to find the perfect home for my buyers." message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alert show];
                    [alert release];
                    isAgtListing = NO;
                }else{
                    if( self.region.center.latitude != 0 ){
                        cvCtrl = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
                        if(isSearchTab)
                        					{

                        						[self.newSearchNavController pushViewController:cvCtrl animated:NO];
                        					}else{
                        [self.navigationController pushViewController:cvCtrl animated:NO];
                        }
                        [cvCtrl release];

                    }else{
				UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"No results found, \nTry changing criteria..." message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
				[alert show];
				[alert release];
                    }
                }
			}
		}else{
			
			//[self performDismiss2:0];
			UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"No response from server. Please try again later." message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[alertView show];
			[alertView release];
			
			//NSLog(@"PropCallback alert");
			
			//[Utils showErrorAlert:@"Error, server call failed!"];
		}
		
		//if([actionSheet isFirstResponder])
		//{
		[self performDismiss2:0];
		//}
	}
	
}


-(void)userDataFromServer
{
	
	[self showActivityViewer];
	
	//NSString* urlStr=[NSString stringWithFormat:@"http://getyouridx.agentstorm.com/users/%@.xml?apikey=%@",txtUserID.text,appDelegate.API_KEY];
	
	NSString* urlStr=[NSString stringWithFormat:@"http://www.spreadyourbrand.com/webservice/webservice.php?mtag=%@",[defaults objectForKey:@"UserID"]];
	
	[self startTimeOut];
	
	NSURL *serviceURL = [NSURL URLWithString:urlStr];
	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:serviceURL];
	
	[urlRequest setHTTPMethod:@"GET"];
	[urlRequest addValue: @"iPhone" forHTTPHeaderField:@"User-Agent"];
	[urlRequest addValue: @"keep-alive" forHTTPHeaderField:@"Connection"];
	[urlRequest addValue: @"GET" forHTTPHeaderField:@"Method"];
	[urlRequest addValue:@"gzip,deflate" forHTTPHeaderField:@"Accepts-Encoding"];
	[urlRequest addValue: @"*/*" forHTTPHeaderField:@"Accept"];
	
	[AppUtils requestServer:urlRequest resultTarget:self targetFunction:@selector(userDateCallback:delegate:)];
}

-(void) userDateCallback:(id)document delegate:(id)delegate{
	
	if(!isTimeOut)
	{
		[self invalidTimer];
		if(delegate!=nil){
			[document retain];
			[delegate retain];
			
			//if(![[XMLUtil getXMLStringValue:@"@count" inNode:[document rootElement]] isEqual: @"0"])
			if([[XMLUtil getXMLStringValue:@"Status" inNode:[document rootElement]] isEqualToString:@"Yes"])
			{
				//NSURLResponse *aRes = [delegate mResponse];
				//		
				//		NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
				//		[dic setObject:@"http://www.agentstorm.com/schemas/1.0.xsd" forKey:@"ns0"]; 
				//		[result retain];
				//		
				//		id res = [XMLUtil getXMLValue:@"//ns0:ItemSearchResponse/ns0:Items" dictionary:dic inNode:[result rootElement]];
				
				T_brandingData *objTBranding = [[[T_brandingData alloc] initWithXML:[document rootElement]] retain];
				
				//T_Users* objTUsers = [[[T_Users alloc] initWithXML:[document rootElement]] retain];
				id data = objTBranding;
				self.API_KEY = objTBranding.apiKey_var;
				mTgr8HomeView *objHome = [[mTgr8HomeView alloc] initWithNibName:@"mTgr8HomeView" bundle:nil];
				objHome.userData = data;
				[self.navigationController pushViewController:objHome animated:NO];
				[objHome release];
				
				
				//[document release];
				//[delegate release];
			}
			else
			{
				if([[XMLUtil getXMLStringValue:@"Status" inNode:[document rootElement]] isEqualToString:@"No"])
				{
					//UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"No records found! \nPossible causes: \nSearch Range too narrow.. \nServer does not support location.. \nServer session timed out..." message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
					UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Cannot login!\nAgent is Inactive" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
					[alert show];
					[alert release];
				}
				else
				{
					UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Cannot login!\nInvalid Access ID" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
					[alert show];
					[alert release];
				}
				
			}
		}else{
			//[Utils showErrorAlert:@"Error, server call failed!"];
		}
		
		[self performDismiss:0];
	}
}

- (void)MLSCall:(NSString *)MLS
{
	NSArray *arr = nil; //[[NSArray alloc]autorelease];
	arr = [MLS componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@","@" "]];
	callBack = 0;
	totalID = arr.count;
	[arrListingData removeAllObjects];
	[self showActivityViewer];
	for(int i = 0; i < arr.count; i ++)
	{
		NSString *strId = [arr objectAtIndex:i];
		NSNumber *idNum = [XMLUtil getNumberFromString:strId];
		if([idNum intValue] > 0)
		{
			[self MLSFromServer:[idNum stringValue]];
		}
		else
		{
			totalID--;
		}
		
	}
}


-(void)MLSFromServer:(NSString *)ListingId
{
	[self showActivityViewer];
	NSString* urlStr=[NSString stringWithFormat:@"%@?apikey=%@&ListingId=%@&%@",self.searchURL,self.API_KEY,ListingId,[self getListingStatus]];
	urlStr = [urlStr stringByReplacingOccurrencesOfString:@"+" withString:@"%2B" options:NSBackwardsSearch range:NSMakeRange(0, [urlStr length])];
	urlStr = [urlStr stringByReplacingOccurrencesOfString:@" " withString:@"%20" options:NSBackwardsSearch range:NSMakeRange(0, [urlStr length])];
	//NSLog(@"url: %@",urlStr);
	
	[self startTimeOut];
	
	NSURL *serviceURL = [NSURL URLWithString:urlStr];
	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:serviceURL];
	
	[urlRequest setHTTPMethod:@"GET"];
	[urlRequest addValue: @"iPhone" forHTTPHeaderField:@"User-Agent"];
	[urlRequest addValue: @"keep-alive" forHTTPHeaderField:@"Connection"];
	[urlRequest addValue:@"gzip,deflate" forHTTPHeaderField:@"Accepts-Encoding"];
	[urlRequest addValue: @"GET" forHTTPHeaderField:@"Method"];
	[urlRequest addValue: @"*/*" forHTTPHeaderField:@"Accept"];
	
	[AppUtils requestServer:urlRequest resultTarget:self targetFunction:@selector(MLSCallback:delegate:)];
}

-(void) MLSCallback:(id)document delegate:(id)delegate{
	if(!isTimeOut)
	{
		[self invalidTimer];
		if(delegate!=nil){
			callBack ++ ;
			[document retain];
			[delegate retain];
			if(![[XMLUtil getXMLStringValue:@"@count" inNode:[document rootElement]] isEqual: @"0"]) //leak
			{
				
				Properties* properties = [[[Properties alloc] initWithXML:[document rootElement]] autorelease]; //leak 11/12
				
				cvCtrl = [[SearchResultController alloc] initWithNibName:@"SearchResultController" bundle:nil];
				
				//cvCtrl.reData = properties;
				[arrListingData removeAllObjects];
				[arrSearchResult removeAllObjects];
				for(int i = 0; i < properties.property_var.count; i++){
					id aI = [[properties property_var] objectAtIndex:i];
					
					//NSLog(@"Callback: %@",[[[properties property_var] objectAtIndex:i]listingId_var]);
					for(int d = 0; d < arrListingId.count; d++)
					{
						if([[[[properties property_var] objectAtIndex:i]listingId_var] isEqualToString:[arrListingId objectAtIndex:d]])
						{
							[arrListingId removeObjectAtIndex:d];
						}
					}
					[self.arrListingData addObject:aI];
				}
                [arrSearchResult addObjectsFromArray:[[self.arrListingData copy] autorelease]];
//				arrSearchResult = self.arrListingData;
				
				//cvCtrl.reData = self.arrListingData;
				
				//			if(callBack >= totalID)
				//			{
				[defaults setBool:YES forKey:@"isListItems"];
				self.totalProperties = [NSString stringWithFormat:@"%i", self.arrListingData.count];
				
				NSMutableString *invalidID = [[[NSMutableString alloc]init]autorelease];
				if(arrListingId.count > 0)
				{
					for(int e = 0; e < arrListingId.count; e++)
					{
						[invalidID appendFormat:@"%@\n",[arrListingId objectAtIndex:e]];
					}
					
					UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"No results found for MLS #" message:invalidID delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
					[alert show];
					[alert release];
				}
				
				if(isSearchTab)
				{
					isSearchTab = YES;
					[self.newSearchNavController pushViewController:cvCtrl animated:NO];
				}
				else
				{
					isSearchTab = NO;
					
					[self.navigationController pushViewController:cvCtrl animated:NO];
				}
				//[properties release];
				[self performDismiss:0];
				//			}
				
			}
			else
			{
				if(callBack >= totalID)
				{
					[self performDismiss:0];
					NSMutableString *invalidID = [[[NSMutableString alloc]init]autorelease];
					if(arrListingId.count > 0)
					{
						for(int e = 0; e < arrListingId.count; e++)
						{
							[invalidID appendFormat:@"%@\n",[arrListingId objectAtIndex:e]];
						}
						
						UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"No results found for MLS #" message:invalidID delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
						[alert show];
						[alert release];
					}
				}
			}
			[defaults synchronize];
		}else{
			[self performDismiss:0];
			UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"No results found, \nTry changing criteria..." message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[alert show];
			[alert release];
		}
	}
	
}


-(void)favPropertiesFromServer:(NSString *)ListingId
{
	[self showActivityViewer];
	//NSString* urlStr=[NSString stringWithFormat:@"http://getyouridx.agentstorm.com/properties.xml?apikey=%@&limit=20&sort=ListPrice&sort_direction=DESC&Bedrooms=2+&FullBaths=2+",self.API_KEY];
	
	NSString* urlStr=[NSString stringWithFormat:@"%@?apikey=%@&limit=%i&ListingId=%@",searchURL,API_KEY,arrFavStore.count,ListingId];
	urlStr = [urlStr stringByReplacingOccurrencesOfString:@"+" withString:@"%2B" options:NSBackwardsSearch range:NSMakeRange(0, [urlStr length])];
	urlStr = [urlStr stringByReplacingOccurrencesOfString:@" " withString:@"%20" options:NSBackwardsSearch range:NSMakeRange(0, [urlStr length])];
	//NSLog(@"url: %@",urlStr);
	
	//[self startTimeOut];
	
	NSURL *serviceURL = [NSURL URLWithString:urlStr];
	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:serviceURL];
	
	[urlRequest setHTTPMethod:@"GET"];
	[urlRequest addValue: @"iPhone" forHTTPHeaderField:@"User-Agent"];
	[urlRequest addValue: @"keep-alive" forHTTPHeaderField:@"Connection"];
	[urlRequest addValue:@"gzip,deflate" forHTTPHeaderField:@"Accepts-Encoding"];
	[urlRequest addValue: @"GET" forHTTPHeaderField:@"Method"];
	[urlRequest addValue: @"*/*" forHTTPHeaderField:@"Accept"];
	
	[AppUtils requestServer:urlRequest resultTarget:self targetFunction:@selector(favPropertiesCallback:delegate:)];
}

-(void) favPropertiesCallback:(id)document delegate:(id)delegate{
	
	if(!isTimeOut)
	{
		//[self invalidTimer];
        //		if(delegate!=nil)
        {
			[document retain];
			[delegate retain];
			if(![[XMLUtil getXMLStringValue:@"@count" inNode:[document rootElement]] isEqual: @"0"]) //leak
			{
				//totalProperties = [[XMLUtil getXMLStringValue:@"@totalcount" inNode:[document rootElement]]retain];
				Properties* properties = [[[Properties alloc] initWithXML:[document rootElement]] autorelease]; //leak
                //				[arrFavStore removeAllObjects];
				for(int i=0;i<properties.property_var.count;i++){
					id aI = [[properties property_var] objectAtIndex:i];
					[arrFavorite addObject:aI];
				}
				cvCtrl = [[mTgr8Favorites alloc] initWithNibName:@"mTgr8Favorites" bundle:nil];
				[self.favoritesNavController pushViewController:cvCtrl animated:NO];
				[cvCtrl release];
				//[properties release]; //10/05
			}
		}
		if(arrFavStore.count != arrFavorite.count)
		{
			[arrFavStore removeAllObjects];
			for (int j = 0; j < arrFavorite.count; j++)
			{
				Property *objPro = [arrFavorite objectAtIndex:j];
				[arrFavStore addObject:objPro.listingId_var];
			}
		}
		
	}
	
	[self performDismiss:0];
}

-(void) MortUserDataFromServer
{
	[self showActivityViewer2];
	
	
    //[self showActivityViewer];
    //NSString* urlStr=[NSString stringWithFormat:@"http://getyouridx.agentstorm.com/users/%@.xml?apikey=%@",txtUserID.text,appDelegate.API_KEY];
    
    NSString* urlStr=[NSString stringWithFormat:@"http://www.spreadyourbrand.com/webservice/webservice.php?mtag=%@",[defaults objectForKey:@"AgentId"]];
    
    NSURL *serviceURL = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:serviceURL];
    
    NSData *XmlData = [NSData dataWithContentsOfURL:serviceURL];
    NSString *strXmlContent = [[NSString alloc] initWithData:XmlData encoding:NSUTF8StringEncoding];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *dataFilePath = [documentsDirectory stringByAppendingPathComponent:@"MortBrandingData.xml"];
    
    [strXmlContent writeToFile:dataFilePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    [strXmlContent release];
    
    [self startTimeOut];
    
    NSDate *today = [NSDate date];
    [defaults setObject:today forKey:@"mortBrandingDate"];
    [defaults synchronize];
    
    [urlRequest setHTTPMethod:@"GET"];
    [urlRequest addValue: @"iPhone" forHTTPHeaderField:@"User-Agent"];
    [urlRequest addValue: @"keep-alive" forHTTPHeaderField:@"Connection"];
    [urlRequest addValue:@"gzip,deflate" forHTTPHeaderField:@"Accepts-Encoding"];
    [urlRequest addValue: @"GET" forHTTPHeaderField:@"Method"];
    [urlRequest addValue: @"*/*" forHTTPHeaderField:@"Accept"];
    
    [AppUtils requestServer:urlRequest resultTarget:self targetFunction:@selector(MortUserDataCallback:delegate:)];
    
	
	
}

- (void) MortUserDataFromLocal
{
	//[self showActivityViewer];
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *dataFilePath = [documentsDirectory stringByAppendingPathComponent:@"MortBrandingData.xml"];
	
	[self startTimeOut];
	
	NSData *XmlData = [NSData dataWithContentsOfFile:dataFilePath];
	if(XmlData > 0)
	{
		NSString *strXmlContent = [[[NSString alloc] initWithData:XmlData encoding:NSUTF8StringEncoding] autorelease];
		
		CXMLDocument *resDoc = [[[CXMLDocument alloc] initWithXMLString:strXmlContent options:0 error:nil] autorelease];
		
		[self MortUserDataCallback:resDoc delegate:self];
	}
	
}

-(void) MortUserDataCallback:(id)document delegate:(id)delegate{
	if(!isTimeOut)
	{
		[self invalidTimer];
		if(delegate!=nil){
			[document retain];
			[delegate retain];
			
			//if(![[XMLUtil getXMLStringValue:@"@count" inNode:[document rootElement]] isEqual: @"0"])
			if([[XMLUtil getXMLStringValue:@"Status" inNode:[document rootElement]] isEqualToString:@"Yes"])
			{
				
				T_brandingData *objTBranding = [[[T_brandingData alloc] initWithXML:[document rootElement]] retain];
				
				//T_Users* objTUsers = [[[T_Users alloc] initWithXML:[document rootElement]] retain];
				id data = objTBranding;
				//agentData = data;
				MortgageViewController *objMortgageViewController = [[MortgageViewController alloc] initWithNibName:@"MortgageViewController" bundle:nil];
				objMortgageViewController.agentData = data;
				
				if([[defaults objectForKey:@"NavigateFrom"] isEqualToString:@"Home"])
				{
					[self.navigationController pushViewController:objMortgageViewController animated:NO];
				}
				else if([[defaults objectForKey:@"NavigateFrom"] isEqualToString:@"Search"])
				{
					[self.newSearchNavController pushViewController:objMortgageViewController animated:NO];
				}
				else if([[defaults objectForKey:@"NavigateFrom"] isEqualToString:@"Favorite"])
				{
					[self.favoritesNavController pushViewController:objMortgageViewController animated:NO];
				}
				else if([[defaults objectForKey:@"NavigateFrom"] isEqualToString:@"More"])
				{
					[self.moreNavController pushViewController:objMortgageViewController animated:NO];
				}
				
				[objMortgageViewController release];
				//[self SetData];
				
			}
			else
			{
				if([[XMLUtil getXMLStringValue:@"Status" inNode:[document rootElement]] isEqualToString:@"No"])
				{
					//UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"No records found! \nPossible causes: \nSearch Range too narrow.. \nServer does not support location.. \nServer session timed out..." message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
					UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Agent is Inactive" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
					[alert show];
					[alert release];
				}
				else
				{
					UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Invalid Access ID" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
					[alert show];
					[alert release];
				}
				
			}
		}else{
			//[Utils showErrorAlert:@"Error, server call failed!"];
		}
		
	}
    [self performDismiss2:nil];
}



//- (NSString *) cityName:(NSString *)cityID
//{
//	for(int c = 0; c < cityIDArray.count; c++)
//	{
//		if([cityID isEqualToString:[cityIDArray objectAtIndex:c]])
//		{
//			return [cityNameArray objectAtIndex:c];
//		}
//	}
//	
//	return cityID;
//	
//}
//
//- (NSString *) cityID:(NSString *)cityName
//{
//	strPartialMatch = [[NSMutableString alloc]init];
//	
//	if (agentFeedName != NULL && [agentFeedName rangeOfString:@"mlslistings"].location != NSNotFound)
//	{
//		for(int c = 0; c < cityNameArray.count; c++)
//		{
//			if([cityName isEqualToString:[cityNameArray objectAtIndex:c]])
//			{
//				return [cityIDArray objectAtIndex:c];
//			}
//			
//		}
//		
//		if(cityName.length > 3)
//		{
//			for(int c = 0; c < cityNameArray.count; c++)
//			{
//				if ([[cityNameArray objectAtIndex:c] rangeOfString:cityName].location != NSNotFound)
//				{
//					[strPartialMatch appendFormat:@"%@,",[cityIDArray objectAtIndex:c]];
//					//return [cityIDArray objectAtIndex:c];
//				}
//			}
//			
//			if(strPartialMatch.length > 0)
//			{
//				return strPartialMatch;
//			}
//			
//		}
//		
//	}
//	else {
//		return cityName;
//	}
//	
//	
//	
//	return cityName;
//	
//}

- (NSString *) countyName:(NSString *)countyCode
{
	
	for(int c = 0; c < countyCodeArray.count; c++)
	{
		if([countyCode isEqualToString:[countyCodeArray objectAtIndex:c]])
		{
			return [countyNameArray objectAtIndex:c];
		}
	}
	
	return countyCode;
}

- (NSString *) stateName:(NSString *)stateCode
{
	
	for(int c = 0; c < stateCodeArray.count; c++)
	{
		//if ([[stateCodeArray objectAtIndex:c] rangeOfString:stateCode].location != NSNotFound)
		if([stateCode caseInsensitiveCompare:[stateCodeArray objectAtIndex:c]] == NSOrderedSame)
			//if([stateCode isEqualToString:[stateCodeArray objectAtIndex:c]])
		{
			return [stateNameArray objectAtIndex:c];
		}
	}
	
	return stateCode;
}

- (CLLocationCoordinate2D) getPropCoordinate:(Property* )propData
{
	CLLocationCoordinate2D coordinate;
	
	Property* annotPropertyData = propData;
	NSString *addressStr = annotPropertyData.fullAddress_var;
	addressStr = addressStr!=nil?addressStr:@"--";
	
	NSString* city  = annotPropertyData.city_var;
    //	city = [self cityName:city];
	city = city!=nil?city:@"";
	NSString *stateOrProvince=annotPropertyData.state_var;
	stateOrProvince = stateOrProvince!=nil?stateOrProvince:@"";
	
	LocationWrapper* lCor=nil;
	if (annotPropertyData.id_var != nil) {
		lCor = [self.gotGeoCodings objectForKey:annotPropertyData.id_var];
		if( lCor != nil){
			coordinate = lCor.coordinate;
		}
	}
	
	if (lCor == nil) {
		
		NSString *geoURL = [NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/xml?address=%@,+%@,+%@&sensor=false",addressStr,city,stateOrProvince];
		geoURL = [geoURL stringByReplacingOccurrencesOfString:@" " withString:@"+" options:NSBackwardsSearch range:NSMakeRange(0, [geoURL length])];
		geoURL = [geoURL stringByReplacingOccurrencesOfString:@"#" withString:@"%23" options:NSBackwardsSearch range:NSMakeRange(0, [geoURL length])];
		geoURL = [geoURL stringByReplacingOccurrencesOfString:@"-" withString:@"%2D" options:NSBackwardsSearch range:NSMakeRange(0, [geoURL length])];
		
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
				
				coordinate.latitude = [[TBXML textForElement:latElement] doubleValue];
				coordinate.longitude= [[TBXML textForElement:lngElement] doubleValue];
				[self.gotGeoCodings setObject:[[[LocationWrapper alloc] initWithCoordiate:coordinate] autorelease] forKey:annotPropertyData.id_var];
			}
		}
		
		// release resources
		[tbxml release];
	}
	return coordinate;
}

- (void) fetchCityState
{
	
	//[self showActivityViewer];
	
	NSString *urlStr = [NSString stringWithFormat:@"%@?apikey=%@",searchURL,API_KEY];
	
	urlStr = [urlStr stringByReplacingOccurrencesOfString:@".xml" withString:@"/cities.xml" options:NSBackwardsSearch range:NSMakeRange(0, [urlStr length])];
	
	TBXML * tbxml = [[TBXML tbxmlWithURL:[NSURL URLWithString:urlStr]] retain];
	
	// Obtain root element
	TBXMLElement * root = tbxml.rootXMLElement;
	
	// if root element is valid
	if (root) {
		// search for the first author element within the root element's children
		//TBXMLElement *citiesElement = [TBXML childElementNamed:@"Cities" parentElement:root];
		TBXMLElement *CityElement = [TBXML childElementNamed:@"City" parentElement:root];
		while (CityElement != nil) {
			
			CityStateData *objCityStateData = [[[CityStateData alloc]init]autorelease];
			
			TBXMLElement *countryElement = [TBXML childElementNamed:@"Country" parentElement:CityElement];
			TBXMLElement *stateElement = [TBXML childElementNamed:@"State" parentElement:CityElement];
			TBXMLElement *cityElement = [TBXML childElementNamed:@"City" parentElement:CityElement];
			
			objCityStateData.country = [TBXML textForElement:countryElement];
			objCityStateData.state = [TBXML textForElement:stateElement];
			objCityStateData.city = [TBXML textForElement:cityElement];
			
			[arrCityStateData addObject:objCityStateData];
			
			CityElement = [TBXML nextSiblingNamed:@"City" searchFromElement:CityElement];
		}
		
		
	}
	
	// release resources
	[tbxml release];
}

- (void) fetchPropertyType
{
	
	
	NSString *urlStr = [NSString stringWithFormat:@"%@?apikey=%@",searchURL,API_KEY];
	
	urlStr = [urlStr stringByReplacingOccurrencesOfString:@".xml" withString:@"/exteriorfeatures.xml" options:NSBackwardsSearch range:NSMakeRange(0, [urlStr length])];
	
	TBXML * tbxml = [[TBXML tbxmlWithURL:[NSURL URLWithString:urlStr]] retain];
	
	// Obtain root element
	TBXMLElement * root = tbxml.rootXMLElement;
	arrPropertyType = [[NSMutableArray alloc]init];
	[arrPropertyType addObject:@"ALL"];
	// if root element is valid
	if (root) {
		// search for the first author element within the root element's children
		//TBXMLElement *citiesElement = [TBXML childElementNamed:@"Cities" parentElement:root];
		
		TBXMLElement *ExteriorFeatureElement = [TBXML childElementNamed:@"ExteriorFeature" parentElement:root];
		while (ExteriorFeatureElement != nil) {
			
			NSString *strType = [TBXML textForElement:ExteriorFeatureElement];
			
			NSString *str = strType;
//			NSCharacterSet *alphaSet = [NSCharacterSet alphanumericCharacterSet];
			str = [str stringByReplacingOccurrencesOfString:@" " withString:@"" options:NSBackwardsSearch range:NSMakeRange(0, [str length])];
//			BOOL valid = [[str stringByTrimmingCharactersInSet:alphaSet] isEqualToString:@""];
//			BOOL valid1 = [[str stringByTrimmingCharactersInSet:alphaSet] isEqualToString:@" "];
			
//			if(valid || valid1)
			{
				if(strType.length > 0)
				{
					[arrPropertyType addObject:strType];
				}
				
			}
			ExteriorFeatureElement = [TBXML nextSiblingNamed:@"ExteriorFeature" searchFromElement:ExteriorFeatureElement];
		}
		
		
	}
	
	// release resources
	[tbxml release];
	
	[self performDismiss:0];
}

-(NSString*)getStandardEmailFooter{
    NSString* facebookUrl = @"";
    if(self.agentData.facebookUrl_var != nil){
        facebookUrl = [NSString stringWithFormat:@"Find me on <a href='%@'>%@</a>",self.agentData.facebookUrl_var,@"FaceBook"];
    }
    NSString* agentName = @"";
    if(self.agentData.agentFName_var != nil ){
        agentName = [agentName stringByAppendingFormat:@"%@",self.agentData.agentFName_var];
    }
    if(self.agentData.agentLName_var != nil){
        agentName = [agentName stringByAppendingFormat:@" %@",self.agentData.agentLName_var];
    }
    NSString* agentNameStr=@"";
    if( [agentName length]>0){
        agentNameStr = [NSString stringWithFormat:@"<br/>%@ ",agentName];
    }
    
    NSString* accessId=self.agentData.mTag_var;
    

//    NSString* ares = [NSString stringWithFormat:@"<br/>------------------<br/>Powered by <a href='http://m.syb.me'>pocketListings</a>%@ %@<br/>%@<br/>------------------",agentNameStr,accessId,facebookUrl];
    NSString* ares = [NSString stringWithFormat:@"<br/>------------------<br/>%@<br/><a href='http://spreadyourbrand.com/profile.php?code=%@'>Download my FREE mobile search app</a><br/>%@<br/>------------------",agentNameStr,accessId,facebookUrl];
    
    return ares;
}

-(void) schoolsFromServer:(NSString*)latitudeStr longitudeStr:(NSString*)longitudeStr target:(id)target targetFunction:(SEL)targetFunction{
    if( latitudeStr != nil && longitudeStr != nil){
        NSString* apiKey = @"6f368ed12f5b0c7eeb193facbdf07546";
        NSString* urlStr =[NSString stringWithFormat:@"http://api.education.com/service/service.php?f=schoolSearch&key=%@&sn=sf&v=3&longitude=%@&latitude=%@&distance=1.5&minResult=4&resf=json",apiKey,longitudeStr,latitudeStr];
        
        NSURL *serviceURL = [NSURL URLWithString:urlStr];
        //        NSLog(@"History URL=%@",serviceURL);
		NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:serviceURL];
        
		[urlRequest setHTTPMethod:@"GET"];
        
		[AppUtils requestJSonFromServer:urlRequest resultTarget:target targetFunction:targetFunction];
    }
}


-(void) schoolsCallBack:(id)resObject delegate:(id)delegate{
    if ( [resObject isKindOfClass: [NSArray class]] ){
        NSArray* gotArray = (NSArray*)resObject;
        for(int i=0;i< [gotArray count];i++){
            NSLog([NSString stringWithFormat:@"%@",[gotArray objectAtIndex:i]]);
        }
        
    }else if([resObject isKindOfClass: [NSDictionary class]] ){
        NSLog(resObject);
    }else{
        // should never be here 
    }
}

-(void) getCurrentLocationAndCallback:(id)dest callback:(SEL)callback{
    self.regCallbackTarget = dest;
    self.regCallback = callback;
    
    if(locationManager.locationServicesEnabled)
	{
		[locationManager startUpdatingLocation];
	}else{
        if(self.regCallbackTarget != nil){
            if( [self.regCallbackTarget respondsToSelector:self.regCallback] ){
                [self.regCallbackTarget performSelector:self.regCallback withObject:nil];
            }
        }
    }
}

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation
{
	
	// Horizontal coordinates
	
	NSLog(@"TRYING UPDATE LOCATION...");
	if (signbit(newLocation.horizontalAccuracy)) {
		// Negative accuracy means an invalid or unavailable measurement
		//statusText.text=@"Could not get location info...";
		//NSLog(@"GPS Accuracy fetched is negative");
		
	} else {
		NSDate* newLocationeventDate = newLocation.timestamp;
		NSTimeInterval howRecentNewLocation = [newLocationeventDate timeIntervalSinceNow];
		if ((!currentLocation || currentLocation.horizontalAccuracy > newLocation.horizontalAccuracy) && (howRecentNewLocation < -0.0 && howRecentNewLocation > -10.0)) {
			if (currentLocation)
				[currentLocation release];
			
			isCurrentLocation = YES;
			currentLocation = [newLocation retain];
            mLastCoordinate = currentLocation.coordinate;
			[locationManager stopUpdatingLocation];
            if(self.regCallbackTarget != nil){
                if( [self.regCallbackTarget respondsToSelector:self.regCallback] ){
                    [self.regCallbackTarget performSelector:self.regCallback withObject:currentLocation];
                }
            }
            NSLog(@"Got new location !!!");
		}else{
            if (currentLocation != nil){
                [locationManager stopUpdatingLocation];
                if(self.regCallbackTarget != nil){
                    if( [self.regCallbackTarget respondsToSelector:self.regCallback] ){
                        [self.regCallbackTarget performSelector:self.regCallback withObject:currentLocation];
                    }
                }
                NSLog(@"Got old location !!!");
            }
        }
	}

}

- (void)locationManager:(CLLocationManager *)manager
	   didFailWithError:(NSError *)error
{
	NSLog(@"FAILED TO UPDATE LOCATION...");
    NSMutableString *errorString = [[[NSMutableString alloc] init] autorelease];
	if ([error domain] == kCLErrorDomain) {
		
		// We handle CoreLocation-related errors here
		
		switch ([error code]) {
				// This error code is usually returned whenever user taps "Don't Allow" in response to
				// being told your app wants to access the current location. Once this happens, you cannot
				// attempt to get the location again until the app has quit and relaunched.
				//
				// "Don't Allow" on two successive app launches is the same as saying "never allow". The user
				// can reset this for all apps by going to Settings > General > Reset > Reset Location Warnings.
				//
			case kCLErrorDenied:
				[errorString appendFormat:@"%@\n", NSLocalizedString(@"LocationDenied", nil)];
				break;
				
				// This error code is usually returned whenever the device has no data or WiFi connectivity,
				// or when the location cannot be determined for some other reason.
				//
				// CoreLocation will keep trying, so you can keep waiting, or prompt the user.
				//
			case kCLErrorLocationUnknown:
				[errorString appendFormat:@"%@\n", NSLocalizedString(@"LocationUnknown", nil)];
				break;
				
				// We shouldn't ever get an unknown error code, but just in case...
				//
			default:
				[errorString appendFormat:@"%@ %d\n", NSLocalizedString(@"GenericLocationError", nil), [error code]];
				break;
		}
	} else {
		// We handle all non-CoreLocation errors here
		// (we depend on localizedDescription for localization)
		[errorString appendFormat:@"Error domain: \"%@\"  Error code: %d\n", [error domain], [error code]];
		[errorString appendFormat:@"Description: \"%@\"\n", [error localizedDescription]];
	}
	
	//NSLog(@"GPS ERROR - %@",errorString);
    //[Utils showErrorAlert:errorString];
	//self.searchOnCurrentLocation = NO;
	
	//	UIAlertView *errorAlert = [[UIAlertView alloc]initWithTitle:errorString message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
	//	[errorAlert show];
	//	[errorAlert release];
	if(self.regCallbackTarget != nil){
        if( [self.regCallbackTarget respondsToSelector:self.regCallback] ){
            [self.regCallbackTarget performSelector:self.regCallback withObject:nil];
        }
    }
	[locationManager stopUpdatingLocation];
	
}



- (void)dealloc {
    [locationManager release];
	[arrCityStateData release];
	[gotGeoCodings release];
	[cityIDArray release];
	[cityNameArray release];
	[countyCodeArray release];
	[countyNameArray release];
	[arrFavStore release];
	[arrFavorite release];
	[arrHistory release];
	[arrPropertyImg release];
	[settingsObj release];
	[agentData release];
    [window release];
    [super dealloc];
}


@end
