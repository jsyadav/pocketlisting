//
//  SearchResultController.m
//  retsClient
//
//  Created by Indroniel Deb Roy on 8/10/09.
//  Copyright 2009 mtgr8 Systems Inc.. All rights reserved.
//

#import "SearchResultController.h"
#import "XMLUtil.h"
#import "SearchCell.h"

#import "AppUtils.h"
#import "Property.h"
#import "mTgr8-PropertyDetailViewController.h"
#import "pocketListingsAppDelegate.h"
#import "MapViewController.h"
#import "mTgr8SearchHistory.h"


@implementation SearchResultController
@synthesize reData;
@synthesize listItems,tblView, pageNumberStr,tempList,offset;

@synthesize resultsTitle;
@synthesize resultsCount, termsCell, showMoreCell,showMoreHomesButton;


- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if ((self = [super initWithStyle:style])) {
		//self.searchItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (UITableViewStyle)tableViewStyle {
	return UITableViewStyleGrouped;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
		//searchItems = [[NSMutableDictionary alloc] init];
		reData = [[Properties alloc]init];
		listItems = [[[NSMutableArray alloc]init]autorelease]; //leak 11/12
		//appDelegate.offset = 20;
    }
    return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)viewDidLoad 
{
    appDelegate = (pocketListingsAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	
	//UIImage *patternImage = [UIImage imageNamed:@"background.jpg"];
	//[self.view setBackgroundColor:[UIColor colorWithPatternImage:patternImage]];
    pageNumberStr = [NSString stringWithFormat:@"1"];
	
	listItems = [[NSMutableArray alloc]init];
	
    
	[self setData];
    
	[self.tblView setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
	//[self.navigationItem setHidesBackButton:YES];
    tblView.sectionFooterHeight = 1.0; // reduce height between listview & show more homes sections
    tblView.sectionHeaderHeight = 1.0; // reduce height between listview & show more homes sections

	
	//[appDelegate performDismiss:0];
	
    [super viewDidLoad];

	
}

- (void) setData
{
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
	
    [item autorelease];
    
	//NSLog(@"reData count - %d",[[self reData] count]);
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	
	if(![defaults boolForKey:@"isListItems"])
	{
//		for(int i=0;i<self.reData.property_var.count;i++){
//			id aI = [[[self reData] property_var] objectAtIndex:i];
//			[listItems addObject:aI];
//		}
//		self.listItems = listItems;
		
		self.listItems = appDelegate.arrSearchResult;
	}
	else
	{
		[defaults setBool:NO forKey:@"isListItems"];
		self.listItems = appDelegate.arrListingData;
	}
	
	
	NSString* str;
	if([listItems count] > 1)
	{
		str = [NSString stringWithFormat:@"Results (%@)",appDelegate.totalProperties];
		
	}
	else
	{
		str = @"Results";
	}
	
	self.navigationItem.title = str;
	
	
	UIImageView *imgAgent = [[UIImageView alloc]init];
	

	if(appDelegate.imgData > 0)
	{
		imgAgent.image = [UIImage imageWithData:appDelegate.imgData];
	}
	else {
		imgAgent.image = [UIImage imageNamed:@"agent_image_notavailable.png"];
	}

		
	[imgAgent setContentMode:UIViewContentModeScaleAspectFit];
	[imgAgent setFrame:CGRectMake(0, 0, 40, 40)];
	
	UIButton * btnAgent = [UIButton buttonWithType:UIButtonTypeCustom];
	[btnAgent setFrame:CGRectMake(0, 0, 40, 40)];
	[btnAgent addSubview:imgAgent];
	[imgAgent release];
//	[btnAgent addSubview:lbl];
//	[btnAgent addTarget:self action:@selector(showAlert) forControlEvents:UIControlEventTouchUpInside];
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:btnAgent] autorelease];
	
	NSString *showMore;
	if([appDelegate.totalProperties intValue] > 0)
	{
		[segmentedControl setUserInteractionEnabled:YES];
		
		if([appDelegate.totalProperties intValue] > appDelegate.offset)
		{
			showMore = [NSString stringWithFormat:@"(1-%i of %@) Load More...",appDelegate.offset,appDelegate.totalProperties];
		}
		else
		{
			showMore = [NSString stringWithFormat:@"(1-%i of %@)",[appDelegate.totalProperties intValue],appDelegate.totalProperties];
		}
		
	}
	else
	{
		[segmentedControl setUserInteractionEnabled:NO];
		
		showMore = @"Load More...";
	}
	
	[showMoreHomesButton setTitle:showMore forState:UIControlStateNormal];
	
	[defaults synchronize];
	[self.tblView reloadData];
	
//	if([appDelegate.actionSheet isFirstResponder])
//	{
		[appDelegate performDismiss:0];
//	}
}

-(void)geoCodeProperties{
	NSMutableArray* arrMapData =  appDelegate.arrSearchResult;    
	for (int d = 0; d < [arrMapData count]; d++)
	{
		//Property* annotPropertyData = [[Property alloc]init]; 01/07
		Property* annotPropertyData = nil; //[[[Property alloc]init]autorelease];
		//NSLog(@"arrMapData: %i",d);
		annotPropertyData = [arrMapData objectAtIndex:d];
		NSString* latitudeString = [annotPropertyData.latitude_var stringValue];
		latitudeString = latitudeString!=nil?latitudeString:@"--";
		
		NSString* longitudeString = [annotPropertyData.longitude_var stringValue];
		longitudeString = longitudeString!=nil?longitudeString:@"--";
		
		
		
		if([latitudeString isEqualToString:@"--"] || [longitudeString isEqualToString:@"--"] || [latitudeString isEqualToString:@"0"] || [longitudeString isEqualToString:@"0"])
		{
			[appDelegate getPropCoordinate:annotPropertyData];
			
		}
		
	}
	[appDelegate performDismiss:0];
	
	[self performSelectorOnMainThread:@selector(navigateToMapView) 
						   withObject:nil waitUntilDone:YES];


}

-(void)navigateToMapView{
	MapViewController *objMapViewController = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
	objMapViewController.propertyData = appDelegate.arrFavorite;
	[self.navigationController pushViewController:objMapViewController animated:NO];
	[objMapViewController release];
    NSLog(@"Mapview called...");
}

- (void)segmentAction:(id)sender
{
	
	segmentedControl = sender;
	//NSLog(@"segment clicked %d", [segmentedControl selectedSegmentIndex]);
	
//	if([segmentedControl selectedSegmentIndex]==0)
//	{
//		if ([appDelegate.arrSearchResult count]>0)
//		{
//			NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
//
//			[appDelegate showActivityViewer];
//
//			NSOperationQueue* operationQueue = [[NSOperationQueue new] autorelease];
//			NSInvocationOperation *indexOperation = [[[NSInvocationOperation alloc] initWithTarget:self
//																						 selector:@selector(geoCodeProperties) object:nil] autorelease];
//			[operationQueue addOperation:indexOperation];
//
//
//
//			[pool drain];
//
//		}
//		else {
//			segmentedControl.selectedSegmentIndex = 1;
//		}
        [self navigateToMapView];
		
//	}
	
}


-(void)showAlert
{
	[appDelegate actionSheetShow];
}

-(void)viewWillAppear:(BOOL)animated{
	    
	if(appDelegate.isSearchTab)
	{
		[self.navigationItem setHidesBackButton:YES];
	}
	else
	{
		[self.navigationItem setHidesBackButton:NO];
	}
	
	[super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


#pragma mark Table view methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	if([[self nameForSection:indexPath.section] isEqual:@"Terms"]){
        return 50;
	}
	if([[self nameForSection:indexPath.section] isEqual:@"ShowMore"]){
        return 50;
	}
	else{
        
		return 100;
	}
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	
	if([listItems count] > 1)
	{
		return 2;
	}
	else
	{
		return 1;
	}
    
}

//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
//	return [searchItems allKeys];
//}



// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	//pageNumber = (NSInteger)[pageNumberStr integerValue];
	
	//NSLog(@"P #  - %d, %i, %@",pageNumber,[pageNumberStr intValue],pageNumberStr);
	if([[self nameForSection:section] isEqual:@"Terms"]){
		return 1;
	}
	if([[self nameForSection:section] isEqual:@"ShowMore"]){
		return 1;
	}
	else
	{
		NSInteger totalItems  = [listItems count];
		//NSInteger itemsOnCurrentPage = 25*pageNumber;
		if (totalItems <= appDelegate.offset)
		{
			if(totalItems == [appDelegate.totalProperties intValue])
			{
				[showMoreHomesButton setEnabled:NO];
				showMoreHomesButton.alpha = 0.5;
				
			}
			//showMoreHomesButton.userInteractionEnabled = FALSE;
			return totalItems;
		}
		else if (totalItems > appDelegate.offset)
		{
			
			//return (25*pageNumber);
			return [listItems count];
			
		}
		else //if nothing works - list everything
		{
			return [listItems count];
		}
	}
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	if([[self nameForSection:indexPath.section] isEqual:@"ShowMore"]){
      //  if(indexPath.row == 0)
            return (UITableViewCell*)showMoreCell;
      //  else
      //      return (UITableViewCell *)termsCell;
	}
	if([[self nameForSection:indexPath.section] isEqual:@"List"])
	{
		//static NSString *CellIdentifier = @"searchCell";
		SearchCell *cell = (SearchCell*)[tblView dequeueReusableCellWithIdentifier: @"searchCell"];
		if (cell == nil) {
			cell = [[SearchCell alloc] initFromResource];
		}
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator ;
        
		[cell setCellObject:[self itemForIndexPath:indexPath]];
        return cell;
	}
	else
	{
        UITableViewCell *cell = [tblView dequeueReusableCellWithIdentifier: @"searchCell"];
        return cell;
	}
}
-(IBAction) home:(id)sender
{
    
}

- (id)itemForIndexPath:(NSIndexPath *)indexPath
{
    // return [[self objectsForSection:indexPath.section] objectAtIndex:indexPath.row];
	
	objPropertiesData = [listItems objectAtIndex:indexPath.row];
    
	return objPropertiesData;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
	//[self tableView:tblView didSelectRowAtIndexPath:indexPath];
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	
    if([[self nameForSection:indexPath.section] isEqual:@"ShowMore"])
		return;
			
	
		[appDelegate showActivityViewer];
		mTgr8_PropertyDetailViewController *objDetail = [[mTgr8_PropertyDetailViewController alloc] initWithNibName:@"mTgr8-PropertyDetailViewController" bundle:nil];
		objDetail.objProperty = [self itemForIndexPath:indexPath];
		[self.navigationController pushViewController:objDetail animated:NO];
		[objDetail release];
		
		[tblView deselectRowAtIndexPath:indexPath animated:YES];
	

	
	
}

-(NSString *)TestDataPath
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	return [documentsDirectory stringByAppendingPathComponent:@"TestData.plist"];
}




- (NSString *)nameForSection:(NSInteger)section
{
	if( section == 0){
		return @"List";
	}
	if( section == 1){
		return @"ShowMore";
	}
	return @"";
}

-(IBAction)viewMorePressed:(id)sender{
	//pageNumber = pageNumber+1;
	//pageNumberStr = [NSString stringWithFormat:@"%d",pageNumber];
	//[tableView reloadData];
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	[self propertiesFromServer];
	
}


-(void)propertiesFromServer{
	
	[appDelegate showActivityViewer];
	
	NSString* urlStr;
	
	if(appDelegate.isHistory)
	{
        urlStr = [NSString stringWithFormat:@"%@?offset=%i&%@",appDelegate.searchURL,appDelegate.offset,[mTgr8SearchHistory currentSelectedURL]];
	}
	else {
        if(appDelegate.isRegionSearch){
            urlStr=[NSString stringWithFormat:@"%@?apikey=%@&offset=%i&limit=20%@%@&%@%@",appDelegate.searchURL,appDelegate.API_KEY,appDelegate.offset,[appDelegate getSortingBy],[appDelegate getSortingDirection],[appDelegate getListingStatus],[appDelegate getRegionSearchURLString:appDelegate.region]];  
        }else{
		urlStr=[NSString stringWithFormat:@"%@?apikey=%@&offset=%i&limit=20%@%@&%@%@",appDelegate.searchURL,appDelegate.API_KEY,appDelegate.offset,[appDelegate getSortingBy],[appDelegate getSortingDirection],[appDelegate getListingStatus],[appDelegate getCompleteSearchURLString]];
        }
	}
	urlStr = [urlStr stringByReplacingOccurrencesOfString:@"+" withString:@"%2B" options:NSBackwardsSearch range:NSMakeRange(0, [urlStr length])];
	urlStr = [urlStr stringByReplacingOccurrencesOfString:@" " withString:@"%20" options:NSBackwardsSearch range:NSMakeRange(0, [urlStr length])];

	[appDelegate startTimeOut];
	
	NSURL *serviceURL = [NSURL URLWithString:urlStr];
	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:serviceURL];
	
	[urlRequest setHTTPMethod:@"GET"];
	[urlRequest addValue: @"iPhone" forHTTPHeaderField:@"User-Agent"];
	[urlRequest addValue: @"keep-alive" forHTTPHeaderField:@"Connection"];
	[urlRequest addValue: @"GET" forHTTPHeaderField:@"Method"];
	[urlRequest addValue: @"*/*" forHTTPHeaderField:@"Accept"];
	
	[AppUtils requestServer:urlRequest resultTarget:self targetFunction:@selector(propertiesCallback:delegate:)];
}

-(void) propertiesCallback:(id)document delegate:(id)delegate{
	
	if(!appDelegate.isTimeOut)
	{
		[appDelegate invalidTimer];

	if(delegate!=nil){
		[document retain];
		[delegate retain];
		Properties* properties = [[[Properties alloc] initWithXML:[document rootElement]] autorelease];
		//reData = properties;
		for(int i=0;i<properties.property_var.count;i++){
			id aI = [[properties property_var] objectAtIndex:i];
			[listItems addObject:aI];
		}
		self.listItems = listItems;
		[appDelegate.arrSearchResult addObjectsFromArray:[[self.listItems copy] autorelease]];
		
		appDelegate.offset = appDelegate.offset+20;
		[self setData];
	}
	}
	[appDelegate performDismiss:0];	
}


-(IBAction) termsButtonPressed:(id)sender{

}



- (void)dealloc {
	[listItems release];
	[reData release];
    [super dealloc];
}


@end

