//
//  AgentBrowViewController.m
//  pocketListings
//
//  Created by Developer mTgr8 on 12/17/11.
//  Copyright (c) 2011 mTgr8 Inc. All rights reserved.
//

#import "AgentBrowViewController.h"
#import "AppUtils.h"
#import "XMLUtil.h"
#import "T_brandingData.h"
#import "MGlobalNavigatorMetrics.h"
#import "mTgr8HomeView.h"

///////////////////////////////////////////////////////////////////////////////////////////////////

@implementation AgentBrowViewController
@synthesize  _pages,_itemsURLValCache,city;
///////////////////////////////////////////////////////////////////////////////////////////////////
// NSObject

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"Launcher";
        totalcount = 0;
        count = 0;
        pageSize = 9;
    }
    return self;
}

- (void)dealloc {
    [_itemsURLValCache release];
    [_pages release];
    [city release];
    [super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// UIViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    totalcount=0;
    count=0;
    if(_pages != nil)[_pages release];
    _pages = [[NSMutableArray alloc] init];
    if(_itemsURLValCache != nil) [_itemsURLValCache release];
    _itemsURLValCache = [[NSMutableDictionary alloc] init];
    self.title = [NSString stringWithFormat:@"%@ Agents",city];
    [self userDataFromServer];
}


- (void)loadView {
    [super loadView];
    CGRect frame = MNavigationFrame();
    self.view = [[[UIView alloc] initWithFrame:frame] autorelease];
    self.view.autoresizesSubviews = YES;
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    _launcherView = [[MLauncherView alloc] initWithFrame:self.view.bounds];
    _launcherView.backgroundColor = [UIColor blackColor];
    _launcherView.delegate = self;
    _launcherView.columnCount = 3;
    [self.view addSubview:_launcherView];
//    [self viewWillAppear:NO];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// TTLauncherViewDelegate

- (void)launcherView:(MLauncherView*)launcher didSelectItem:(MLauncherItem*)item {
    if([[item title] isEqualToString:@"Load More"]){
        [self userDataFromServer];
    }else{
        NSString* url = [item URL];        
        T_brandingData* aData = [_itemsURLValCache objectForKey:url];
        [self detailActionsheetShow:aData];            
    }
}

- (void)launcherViewDidBeginEditing:(MLauncherView*)launcher {
    [self.navigationItem setRightBarButtonItem:[[[UIBarButtonItem alloc]
                                                 initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                 target:_launcherView action:@selector(endEditing)] autorelease] animated:YES];
}

- (void)launcherViewDidEndEditing:(MLauncherView*)launcher {
    [self.navigationItem setRightBarButtonItem:nil animated:YES];
}

- (void)launcherView:(MLauncherView*)launcher pageChanged:(MPageControl*)page{
    if(_pages.count == [page currentPage]+1){
        NSArray* arr = [_pages objectAtIndex:[page currentPage]];
        if( arr != nil && arr.count == 0){
            [self userDataFromServer];
        }
    }
}

-(void)userDataFromServer
{
	
    [[AppUtils getAppDelegate] showActivityViewer2];
    NSString* urlStr=[NSString stringWithFormat:@"http://spreadyourbrand.com/webservice/webservice.php?city=%@&limit=%d&offset=%d", [city stringByReplacingOccurrencesOfString:@" " withString:@"%20" options:NSBackwardsSearch range:NSMakeRange(0, [city length])],pageSize,count];
    
	NSURL *serviceURL = [NSURL URLWithString:urlStr];
	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:serviceURL];
	
	[urlRequest setHTTPMethod:@"GET"];
	[urlRequest addValue: @"iPhone" forHTTPHeaderField:@"User-Agent"];
	[urlRequest addValue: @"keep-alive" forHTTPHeaderField:@"Connection"];
	[urlRequest addValue: @"GET" forHTTPHeaderField:@"Method"];
	[urlRequest addValue:@"gzip,deflate" forHTTPHeaderField:@"Accepts-Encoding"];
	[urlRequest addValue: @"*/*" forHTTPHeaderField:@"Accept"];
	
	[AppUtils requestBinaryDataFromServer:urlRequest resultTarget:self targetFunction:@selector(userDataCallback:delegate:)];
}

-(void) userDataCallback:(id)data delegate:(id)delegate{
	
	NSMutableArray* agents = [[NSMutableArray alloc] init];	
    if(delegate!=nil){
        NSString *resStr= [[[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSUTF8StringEncoding]autorelease];
		resStr = [[resStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] retain];
        CXMLDocument *document = [[[CXMLDocument alloc] initWithXMLString:resStr options:0 error:nil] autorelease];
        NSNumber* ltotalcount = [XMLUtil getNumberFromString:[XMLUtil getXMLStringValue:@"totalcount" inNode:[document rootElement]]];
        if( ltotalcount != nil){
            totalcount = [ltotalcount intValue];
        }
        NSNumber* lCount = [XMLUtil getNumberFromString:[XMLUtil getXMLStringValue:@"count" inNode:[document rootElement]]];
        if( lCount != nil){
            count = count+[lCount intValue];
        }
        
        [document retain];
        [delegate retain];
        
        //if(![[XMLUtil getXMLStringValue:@"@count" inNode:[document rootElement]] isEqual: @"0"])
        NSArray* agentDatas = [XMLUtil getXMLValue:@"//agentDetails" inNode:[document rootElement]];
        
        if( agentDatas != nil && [agentDatas isKindOfClass:[NSArray class]]){
            for(int i=0; i<agentDatas.count;i++){
                T_brandingData *objTBranding = [[T_brandingData alloc] initWithXML:[agentDatas objectAtIndex:i]];
                [agents addObject:objTBranding];
            }
        }else if(agentDatas != nil && ![agentDatas isKindOfClass:[NSArray class]]){
            T_brandingData *objTBranding = [[T_brandingData alloc] initWithXML:agentDatas];
            [agents addObject:objTBranding]; 
        }
    }
    NSMutableArray* firstPage = [[NSMutableArray alloc]init];
    for(int i=0;i<agents.count;i++){
        T_brandingData* lData = [agents objectAtIndex:i];
        NSString* urlKey = [NSString stringWithFormat:@"fb://item%d",i+(count-agents.count)];
        MLauncherItem* aItem =[[[MLauncherItem alloc] initWithTitle:[lData agentFName_var]
                                                              image:[lData agentImage_var]
                                                                URL:urlKey canDelete:NO] autorelease];
        [firstPage addObject:aItem];
        [_itemsURLValCache setObject:lData forKey:urlKey];
    }
    MLauncherItem* loadMore=[[[MLauncherItem alloc] initWithTitle:@"Load More"
                                                            image:@"bundle://show_more.png"
                                                              URL:[NSString stringWithFormat:@"fb://item%d",count] canDelete:NO] autorelease];
    if( [_pages count] > 0){
        [_pages removeLastObject]; 
    }
    [_pages addObject:firstPage];
    if(totalcount > count){
        [_pages addObject:[NSArray array]];
    }
    _launcherView.pages = _pages;
    [self.view setNeedsLayout];
    [self.view setNeedsDisplay];
    
    [[AppUtils getAppDelegate] performDismiss2:0];
}

- (void) detailActionSheetCancel{
	[actionSheet dismissWithClickedButtonIndex:0 animated:YES];	
    [actionSheet release];
    currentAgent = nil;
}

- (void) chooseCurrentAgent{
	[actionSheet dismissWithClickedButtonIndex:0 animated:YES];	
    [actionSheet release];
    
    [[NSUserDefaults standardUserDefaults] setObject:currentAgent.agentId_var forKey:@"UserID"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    id data = currentAgent;
    [AppUtils getAppDelegate].API_KEY = currentAgent.apiKey_var;
    mTgr8HomeView *objHome = [[mTgr8HomeView alloc] initWithNibName:@"mTgr8HomeView" bundle:nil];
    objHome.userData = data;
    [self.navigationController pushViewController:objHome animated:NO];
    [objHome release];
    
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"isUserActive"])
    {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isUserActive"];        
    }
    currentAgent = nil;
}

- (void) detailActionsheetShow:(T_brandingData*)agentData
{
	currentAgent = agentData;
	UIImageView *agentImg = [[UIImageView alloc]initWithFrame:CGRectMake(10, 45+20, 100, 100)];
    if( agentData.agentImage_var !=nil){
        agentImg.image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:agentData.agentImage_var]]];
    }else{
		agentImg.image = [UIImage imageNamed:@"agent_image_notavailable.png"];
	}
	[agentImg setContentMode:UIViewContentModeScaleAspectFit];
	
	UILabel *lblAgentName = [[UILabel alloc]initWithFrame:CGRectMake(120, 45+20, 195, 21)];
    NSString *strLastName = agentData.agentLName_var;
	strLastName = strLastName!=nil?strLastName:@"";
    NSString *strFirstName = agentData.agentFName_var;
	strFirstName = strFirstName!=nil?strFirstName:@"";
    
	lblAgentName.text = [NSString stringWithFormat:@"%@ %@", strFirstName,strLastName];
	[lblAgentName setBackgroundColor:[UIColor clearColor]];
	[lblAgentName setTextColor:[UIColor whiteColor]];
    [lblAgentName setFont:[UIFont boldSystemFontOfSize:14]];
	[lblAgentName sizeToFit];
	
	NSString *strUsrLic = agentData.agentLic_var;
	strUsrLic = strUsrLic!=nil?strUsrLic:@"";
    UILabel *lblAgentLic = [[UILabel alloc]initWithFrame:CGRectMake(120, 67+20, 195, 21)];
	lblAgentLic.text = [NSString stringWithFormat:@"Lic: %@", strUsrLic];
    [lblAgentLic setBackgroundColor:[UIColor clearColor]];
	[lblAgentLic setTextColor:[UIColor whiteColor]];
    [lblAgentLic setFont:[UIFont boldSystemFontOfSize:12]];
	[lblAgentLic sizeToFit];
	
	NSString *strVanityText = agentData.vanityText_var;
	strVanityText = strVanityText!=nil?strVanityText:@"";
    UILabel *lblAgentVanity = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 300, 21)];
	lblAgentVanity.text = [NSString stringWithFormat:@"%@", strVanityText];
    [lblAgentVanity setTextAlignment:UITextAlignmentCenter];
    [lblAgentVanity setNumberOfLines:0];
    [lblAgentVanity setBackgroundColor:[UIColor clearColor]];
	[lblAgentVanity setTextColor:[UIColor whiteColor]];
    [lblAgentVanity setFont:[UIFont boldSystemFontOfSize:14]];
	[lblAgentVanity sizeToFit];
    
	UILabel *lblAgentOff = [[UILabel alloc]initWithFrame:CGRectMake(120, 110+20, 195, 21)];
	lblAgentOff.text = agentData.officeName_var;
	[lblAgentOff setBackgroundColor:[UIColor clearColor]];
	[lblAgentOff setTextColor:[UIColor whiteColor]];
	[lblAgentOff setNumberOfLines:0];
    [lblAgentOff setFont:[UIFont boldSystemFontOfSize:13]];
	[lblAgentOff sizeToFit];
	
	CGRect frame = CGRectMake(0, 0, 320, 320);
	UIImageView *imgBng = [[UIImageView alloc] initWithFrame:frame];
	[imgBng setImage:[UIImage imageNamed:@"background.png"]];
	[imgBng setAlpha:0.8];
	
	actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
	
    //	UIButton *btnEmail = [[UIButton alloc]initWithFrame:CGRectMake(20, 120, 82, 75)];
    //	[btnEmail setImage:[UIImage imageNamed:@"icon_email.png"] forState:UIControlStateNormal];
    //	[btnEmail addTarget:self action:@selector(SendEmail) forControlEvents:UIControlEventTouchUpInside];
    //	if(appDelegate.agentEmail.length > 0)
    //	{
    //		[btnEmail setEnabled:YES];
    //	}
    //	else
    //	{
    //		[btnEmail setEnabled:NO];
    //	}
    //	
    //	UIButton *btnText = [[UIButton alloc] initWithFrame:CGRectMake(120, 120, 82, 75)];
    //	[btnText setImage:[UIImage imageNamed:@"icon_text.png"] forState:UIControlStateNormal];
    //	[btnText addTarget:self action:@selector(SendText) forControlEvents:UIControlEventTouchUpInside];
    //	if(appDelegate.agentContact.length > 0)
    //	{
    //		[btnText setEnabled:YES];
    //	}
    //	else
    //	{
    //		[btnText setEnabled:NO];
    //	}
    //	
    //	UIButton *btnCall = [[UIButton alloc] initWithFrame:CGRectMake(220, 120, 82, 75)];
    //	[btnCall setImage:[UIImage imageNamed:@"icon_call.png"] forState:UIControlStateNormal];
    //	[btnCall addTarget:self action:@selector(Call) forControlEvents:UIControlEventTouchUpInside];
    //	if(appDelegate.agentContact.length > 0)
    //	{
    //		[btnCall setEnabled:YES];
    //	}
    //	else
    //	{
    //		[btnCall setEnabled:NO];
    //	}
    
    UIButton *btnAgentAct = [[UIButton alloc] initWithFrame:CGRectMake(15, 185, 291, 29)];
	[btnAgentAct setImage:[UIImage imageNamed:@"btn_make_my_agent.png"] forState:UIControlStateNormal];
	[btnAgentAct addTarget:self action:@selector(chooseCurrentAgent) forControlEvents:UIControlEventTouchUpInside];
	
	UIButton *btnCancelAct = [[UIButton alloc] initWithFrame:CGRectMake(15, 220, 291, 29)];
	[btnCancelAct setImage:[UIImage imageNamed:@"btn_Cancel.png"] forState:UIControlStateNormal];
	[btnCancelAct addTarget:self action:@selector(detailActionSheetCancel) forControlEvents:UIControlEventTouchUpInside];
	
	
	[actionSheet addSubview:imgBng];
	[actionSheet addSubview:agentImg];
	[actionSheet addSubview:lblAgentName];
    [actionSheet addSubview:lblAgentLic];
	[actionSheet addSubview:lblAgentOff];
    [actionSheet addSubview:lblAgentVanity];
    //	[actionSheet addSubview:btnEmail];
    //	[actionSheet addSubview:btnText];
	[actionSheet addSubview:btnAgentAct];
	[actionSheet addSubview:btnCancelAct];
	[actionSheet showFromTabBar:[AppUtils getAppDelegate].tabController.tabBar];
	[actionSheet setBounds:CGRectMake(0,0,320, 520)];
	
	[imgBng release];
	[agentImg release];
	[lblAgentName release];
    [lblAgentLic release];
	[lblAgentOff release];
    //	[btnEmail release];
    //	[btnText release];
	[btnAgentAct release];
	[btnCancelAct release];
    [lblAgentVanity release];
}

@end