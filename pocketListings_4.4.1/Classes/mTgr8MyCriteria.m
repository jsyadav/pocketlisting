//
//  mTgr8MyCriteria.m
//  idx
//
//  Created by Kaustubh Chavan on 27/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "mTgr8MyCriteria.h"
#import "mTgr8SearchSettingObject.h"
#import "mTgr8RangeSelectorVC.h"
#import "pocketListingsAppDelegate.h"
#import "XMLUtil.h"
#import "AppUtils.h"
#import "Properties.h"
#import "SearchResultController.h"
#import "Property.h"
#import "MapViewController.h"
#import "SettingsViewController.h"
#import "SelectCityStateView.h"
#import "PropertyTypeVC.h"
#import "PropertyAgeVC.h"


@implementation mTgr8MyCriteria
@synthesize zipTableViewCell,searchTableViewCell,segmentCell,MLSCell;
CGFloat animatedDistance;
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 150;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;
int callBack = 0;
int totalID = 0;
BOOL isAdded;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	appDelegate = (pocketListingsAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Apply" style:UIBarButtonItemStyleBordered target:self action:@selector(saveAction)];
    self.navigationItem.rightBarButtonItem = saveButton;
    [saveButton release];
	
	objSearchSetting = [[mTgr8SearchSettingObject alloc]init];
	defaults = [NSUserDefaults standardUserDefaults];
    
    [segmentedControl setEnabled:NO forSegmentAtIndex:2];
    NSLog(@"Criteria Map is disabled....");
    [super viewDidLoad];
}

- (void)segmentAction:(id)sender
{
    segmentedControl = sender;
	//NSLog(@"segment clicked %d", [segmentedControl selectedSegmentIndex]);
	
	selectedSegment = [segmentedControl selectedSegmentIndex];
	[tblCriteria reloadData];
}

-(IBAction)listingStatusChanged:(id)sender
{
    if(listingStatusControl.selectedSegmentIndex == 0){
        [defaults setInteger:0 forKey:@"listingstatus"];
    }else if(listingStatusControl.selectedSegmentIndex == 1){
        [defaults setInteger:1 forKey:@"listingstatus"];
    }else if(listingStatusControl.selectedSegmentIndex == 2){
        [defaults setInteger:2 forKey:@"listingstatus"];
    }
    [defaults synchronize];
}

-(IBAction)streetValueChanged:(id)sender{
    NSString* stVal = [txtStreet text];
    stVal = [stVal stringByTrimmingCharactersInSet:
             [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if( [stVal length] > 0){
        [defaults setValue:stVal forKey:@"streetname"];
    }else{
        [defaults removeObjectForKey:@"streetname"];
    }
    [defaults synchronize];
}

- (void)saveAction
{
	[defaults setObject:@"Search" forKey:@"NavigateFrom"];
	[defaults setBool:YES forKey:@"isNotFirst"];
	
	historyStr = [NSMutableString stringWithString:@""];
	historyCity = [NSMutableString stringWithString:@""];
	cityID = [NSMutableString stringWithString:@""];
	historyZip = [NSMutableString stringWithString:@""];
	
    
	if(selectedSegment == 0 || selectedSegment ==2)
	{
        //		appDelegate.tabController.selectedViewController = [appDelegate.tabController.viewControllers objectAtIndex:1];
        //		appDelegate.newSearchNavController.tabBarItem.enabled = NO;
        //		[appDelegate.navigationController popToRootViewControllerAnimated:NO];
		
		appDelegate.isSearchMap = YES;
		
		NSString *strZip = txtZip.text;
		strZip = [strZip stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
		
		NSArray *arr = nil;//[[NSArray alloc]autorelease];
		arr = [strZip componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@","@" "]];
		
		for(int i = 0; i < arr.count; i ++)
		{
            //			NSString *strId = [arr objectAtIndex:i];
            //			NSNumber *idNum = [XMLUtil getNumberFromString:strId];
            //			if([idNum intValue] > 0)
            //			{
            
            if(i == arr.count-1)
            {
                [historyZip appendFormat:@"%@",[arr objectAtIndex:i]];
            }
            else
            {
                [historyZip appendFormat:@"%@,",[arr objectAtIndex:i]];
            }
            
            //			}
			
		}
		
		if(historyZip.length < 2)
		{
			//NSString *strCity = txtCity.text;
			NSString *strCity = appDelegate.selectedCities;
			strCity = [strCity stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
			strCity = [strCity stringByReplacingOccurrencesOfString:@"  " withString:@" " options:NSBackwardsSearch range:NSMakeRange(0, [strCity length])];
			
			NSArray *arrCity = nil;//[[NSArray alloc]autorelease];
			arrCity = [strCity componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@","]];
			
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
						[historyCity appendFormat:@"%@",strFormattedCity];
					}
					else
					{
						[cityID appendFormat:@"%@,",strFormattedCity];
						[historyCity appendFormat:@"%@,",strFormattedCity];
					}
					
					
				}
				
			}
//            self.historyCity = historyCity;	
		}
		else {
			historyCity = txtCity.text;
		}
        
		
		
		appDelegate.isSearchTab = YES;
//		appDelegate.historyZip = historyZip;
		
        //		NSArray *arrState = nil;//[[NSArray alloc]autorelease];
        //		arrState = [appDelegate.selectedStates componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@","]];
        //
        //		arrState = [[NSSet setWithArray:arrState] allObjects];
        //		appDelegate.selectedStates = [[[NSMutableString alloc]init]autorelease];
        //		for(int i = 0; i < arrState.count; i ++)
        //		{
        //			if(i == arrState.count-1)
        //			{
        //				[appDelegate.selectedStates appendFormat:@"%@",[arrState objectAtIndex:i]];
        //			}
        //			else {
        //				[appDelegate.selectedStates appendFormat:@"%@,",[arrState objectAtIndex:i]];
        //			}
        //
        //		}
		
		//appDelegate.historyState = txtState.text;
        //		appDelegate.historyState = appDelegate.selectedStates;
		
		[defaults setObject:historyZip forKey:@"zipCode"];
		[defaults setObject:cityID forKey:@"city"];
//		[defaults setObject:appDelegate.historyCity forKey:@"historyCity"];
        //		[defaults setObject:appDelegate.selectedStates forKey:@"state"];
		[defaults setObject:appDelegate.selectedPropType forKey:@"SelectedPropertyTypeStr"];
		[defaults setObject:appDelegate.arrSelectedPropType forKey:@"SelectedPropertyTypeData"];
		
		[defaults setObject:[defaults objectForKey:@"tempMinBath"] forKey:@"minBath"];
		[defaults setObject:[defaults objectForKey:@"tempMaxBath"] forKey:@"maxBath"];
		[defaults setObject:[defaults objectForKey:@"tempMinBed"] forKey:@"minBed"];
		[defaults setObject:[defaults objectForKey:@"tempMaxBed"] forKey:@"maxBed"];
		[defaults setObject:[defaults objectForKey:@"tempMinPrice"] forKey:@"startPrice"];
		[defaults setObject:[defaults objectForKey:@"tempMaxPrice"] forKey:@"endPrice"];
		[defaults setObject:[defaults objectForKey:@"tempMinSqFt"] forKey:@"minSqFt"];
		[defaults setObject:[defaults objectForKey:@"tempMaxSqFt"] forKey:@"maxSqFt"];
		
		[defaults setObject:appDelegate.selectedCities forKey:@"historyCity"];
		[defaults setObject:appDelegate.arrSelectedCtSt forKey:@"SelectedCityState"];
		
		[defaults setObject:[defaults objectForKey:@"tempSortBy"] forKey:@"SortBy"];
		[defaults setObject:[defaults objectForKey:@"tempSortByShow"] forKey:@"SortByShow"];
		[defaults setInteger:[[defaults objectForKey:@"tempSortByIndex"] intValue] forKey:@"SortByIndex"];
		
		[defaults setObject:[defaults objectForKey:@"tempSortDirection"]  forKey:@"SortDirection"];
		[defaults setObject:[defaults objectForKey:@"tempSortDirectionShow"]  forKey:@"SortDirectionShow"];
		[defaults setInteger:[[defaults objectForKey:@"tempSortDirectionIndex"] intValue] forKey:@"SortDirectionIndex"];
		
		
		[defaults synchronize];
		appDelegate.isApply = YES;
        if (selectedSegment == 0){
            appDelegate.isRegionSearch = NO;
        }else if(selectedSegment == 2){
            appDelegate.isRegionSearch = YES;
        }
		
		if(historyZip.length > 2)
		{
			appDelegate.tabController.selectedViewController = [appDelegate.tabController.viewControllers objectAtIndex:1];
			appDelegate.newSearchNavController.tabBarItem.enabled = NO;
			[appDelegate.navigationController popToRootViewControllerAnimated:NO];			
			
            [appDelegate propertiesFromServer];
		}
		else 
		{
			if(historyCity.length > 0)
			{
				appDelegate.tabController.selectedViewController = [appDelegate.tabController.viewControllers objectAtIndex:1];
				appDelegate.newSearchNavController.tabBarItem.enabled = NO;
				[appDelegate.navigationController popToRootViewControllerAnimated:NO];				

                [appDelegate propertiesFromServer];
			}
			else {
				UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Set City or Zip in Criteria." message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
				[alert show];
				[alert release];
			}
            
		}
        
	}
	else
	{
		appDelegate.isSearchMap = NO;
        appDelegate.isRegionSearch= NO;

        [txtMLS resignFirstResponder];
		NSString *str = txtMLS.text;
		
		if(str.length > 2)
		{
			appDelegate.tabController.selectedViewController = [appDelegate.tabController.viewControllers objectAtIndex:1];
			appDelegate.newSearchNavController.tabBarItem.enabled = NO;
			[appDelegate.navigationController popToRootViewControllerAnimated:NO];
			
			appDelegate.isSearchTab = YES;
			
			NSArray *arr = nil;//[[NSArray alloc]autorelease];
			arr = [str componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@","@" "]];
			
			totalID = arr.count;
			
			for(int i = 0; i < arr.count; i ++)
			{
				
				NSString *strMLS = [arr objectAtIndex:i];
				//strMLS = [self formattedCity:strMLS];
				
				if([strMLS length] > 0)
				{
					//strMLS = [strMLS stringByTrimmingCharactersInSet: [NSCharacterSet punctuationCharacterSet]];
					
					if(i == arr.count-1)
					{
						[historyStr appendFormat:@"%@",strMLS];					
					}
					else
					{
						[historyStr appendFormat:@"%@,",strMLS];					
					}
                    
					for(int d = 0; d < arrListingId.count; d++)
					{
						for (int e = 0; e < arrListingId.count; e++) {
							if([[arrListingId objectAtIndex:d] isEqualToString:[arrListingId objectAtIndex:e]])
							{
								[arrListingId removeObjectAtIndex:e];
							}
						}
					}
					
					[arrListingId addObject:strMLS];
					
					
				}
				else
				{
					totalID--;
				}
			}
            
            
			if(totalID == 0)
			{
				[appDelegate performDismiss:0];
				UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"No results found, \nTry changing criteria..." message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
				[alert show];
				[alert release];
			}
			else 
			{
				[defaults setObject:historyStr forKey:@"MLSHistory"];
				[defaults synchronize];
                NSString* listIdStr = [NSString stringWithFormat:@"ListingId=%@",historyStr];
                [appDelegate storeHistory:listIdStr];
                [appDelegate propertiesFromServer:listIdStr];
//				[self propertiesFromServer:historyStr];
			}
            
		}
		else
		{
			UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"MLS# cannot be empty." message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[alert show];
			[alert release];
		}
        
		
	}
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

- (void)viewWillAppear:(BOOL)animated{
	
	self.navigationItem.title = @"Search Criteria";

    if(appDelegate.isRegionSearch && appDelegate.region.center.latitude != 0){
            NSLog(@"Criteria Map Enabled .....");
            [segmentedControl setEnabled:YES forSegmentAtIndex:2];
            [segmentedControl setSelectedSegmentIndex:2];
        }


	
	callBack = 0;
	
	//segmentedControl.selectedSegmentIndex = selectedSegment;
	
	arrListingId = [[NSMutableArray alloc]init];
	arrValidCity = [[NSMutableArray alloc]init];
	
	historyStr = [[NSMutableString alloc]init];
	historyCity = [[NSMutableString alloc]init];
	cityID = [[NSMutableString alloc]init];
	historyZip = [[NSMutableString alloc]init];
    
    lblUpdatedInOption.text = appDelegate.currentUpdateInOption;
	
	[appDelegate.arrListingData removeAllObjects];
	if(appDelegate.isRangeSelector)
	{
		appDelegate.isRangeSelector = NO;
		lblBath.text = [NSString stringWithFormat:@"%@",[self getTempBath]];
		lblBed.text = [NSString stringWithFormat:@"%@",[self getTempBed]];
		lblPrice.text = [NSString stringWithFormat:@"%@",[self getTempPrice]];
		lblSqFt.text = [NSString stringWithFormat:@"%@",[self getTempSqFt]];
		
		txtZip.text = [defaults objectForKey:@"tempZipCode"];
		//txtCity.text = [defaults objectForKey:@"tempCity"];
		//txtState.text = [defaults objectForKey:@"tempState"];
		txtCity.text = appDelegate.selectedCities;
		lblPropType.text = appDelegate.selectedPropType;
		
		lblSortDirec.text = [defaults objectForKey:@"tempSortDirectionShow"];
		lblSortDirec.text = lblSortDirec.text!=nil?lblSortDirec.text:@"Ascending";
		lblSortBy.text = [defaults objectForKey:@"tempSortByShow"];
		lblSortBy.text = lblSortBy.text!=nil?lblSortBy.text:@"ListPrice";
	}
	else
	{
		lblBath.text = [objSearchSetting  getBathrooms]; 
		lblBed.text = [objSearchSetting getBedrooms];
		lblPrice.text = [objSearchSetting getPriceRange];
		lblSqFt.text = [objSearchSetting getSquareFootage];
		
		appDelegate.arrSelectedCtSt = [defaults objectForKey:@"SelectedCityState"];
		appDelegate.selectedCities = [defaults objectForKey:@"historyCity"];
		//	selectedStates = [defaults objectForKey:@"state"];
		appDelegate.selectedPropType = [defaults objectForKey:@"SelectedPropertyTypeStr"];
		appDelegate.arrSelectedPropType = [defaults objectForKey:@"SelectedPropertyTypeData"];
		
		if(appDelegate.arrSelectedPropType.count < 1)
		{
			appDelegate.arrSelectedPropType = [[NSMutableArray alloc]init];
			[appDelegate.arrSelectedPropType addObject:@"ALL"];
		}
		
		if(appDelegate.selectedPropType.length < 1)
		{
			appDelegate.selectedPropType = [[NSMutableString alloc]init];
			[appDelegate.selectedPropType appendString:@"ALL"];
		}
		
		//	if(selectedStates.length < 1)
		//	{
		//		selectedStates = [[NSMutableString alloc]init];
		//	}
		
		if(appDelegate.selectedCities.length < 1)
		{
			appDelegate.selectedCities = [[NSMutableString alloc]init];
			//[selectedCities appendString:@"Select City"];
		}
		
		if(appDelegate.arrSelectedCtSt.count < 1)
		{
			appDelegate.arrSelectedCtSt = [[NSMutableArray alloc]init];
		}
		
		
		
		txtZip.text = [defaults objectForKey:@"zipCode"];
		txtCity.text = [defaults objectForKey:@"historyCity"];
		appDelegate.selectedCities =  [defaults objectForKey:@"historyCity"];//appDelegate.selectedCities;
		lblPropType.text = [defaults objectForKey:@"SelectedPropertyTypeStr"]; //appDelegate.selectedPropType;
		lblPropType.text = lblPropType.text!=nil?lblPropType.text:@"ALL";
		
		lblSortDirec.text = [appDelegate getSortingDirectionShow];
		lblSortBy.text = [appDelegate getSortingByShow];
		
		[defaults setObject:[defaults objectForKey:@"SortBy"] forKey:@"tempSortBy"];
		[defaults setObject:[appDelegate getSortingByShow] forKey:@"tempSortByShow"];
		[defaults setInteger:[[defaults objectForKey:@"SortByIndex"] intValue] forKey:@"tempSortByIndex"];
		
		[defaults setObject:[defaults objectForKey:@"SortDirection"]  forKey:@"tempSortDirection"];
		[defaults setObject:[appDelegate getSortingDirectionShow]  forKey:@"tempSortDirectionShow"];
		[defaults setInteger:[[defaults objectForKey:@"SortDirectionIndex"] intValue] forKey:@"tempSortDirectionIndex"];
		
		[defaults setObject:[defaults objectForKey:@"minBath"] forKey:@"tempMinBath"];
		[defaults setObject:[defaults objectForKey:@"maxBath"] forKey:@"tempMaxBath"];
		[defaults setObject:[defaults objectForKey:@"minBed"] forKey:@"tempMinBed"];
		[defaults setObject:[defaults objectForKey:@"maxBed"] forKey:@"tempMaxBed"];
		[defaults setObject:[defaults objectForKey:@"startPrice"] forKey:@"tempMinPrice"];
		[defaults setObject:[defaults objectForKey:@"endPrice"] forKey:@"tempMaxPrice"];
		[defaults setObject:[defaults objectForKey:@"minSqFt"] forKey:@"tempMinSqFt"];
		[defaults setObject:[defaults objectForKey:@"maxSqFt"] forKey:@"tempMaxSqFt"];
		
        if([defaults boolForKey:@"onlyopenhouse"]){
            [onlyOHSwitch setOn:YES];
        }
        
        int lstst = [defaults integerForKey:@"listingstatus"];
        listingStatusControl.selectedSegmentIndex=lstst;
		
	}
	//NSLog(@"%@",[defaults objectForKey:@"MLSHistory"]);
	txtMLS.text = [defaults objectForKey:@"MLSHistory"];
	
	//lblListingStatus.text = [appDelegate getListingStatusShow];
	
	
    
    //	if(appDelegate.selectedCities.length < 1)
    //	{
    //		//[appDelegate.selectedCities appendFormat:@"Select City"];
    //		txtCity.text = appDelegate.selectedCities;
    //	}
    
    if([defaults stringForKey:@"streetname"] != nil){
        txtStreet.text = [defaults stringForKey:@"streetname"];
    }
	
	if(![defaults boolForKey:@"isNotFirst"])
	{
		txtZip.text = appDelegate.agentZip;
	}
	
	if(appDelegate.isCityDone)
	{
		appDelegate.isCityDone = NO;
		
		//if(![lblCityState.text isEqualToString:@"Select City"])
		//{
		[defaults setBool:YES forKey:@"isNotFirst"];
		txtZip.text = @"";
		//}
	}
	
	//NSLog(@"ViewWillApear Criteria");
}

- (NSString *) getTempPrice
{
	NSString *minPri = [defaults objectForKey:@"tempMinPrice"];
	minPri = minPri!=nil?minPri:@"No Min";
	
	NSString *maxPri = [defaults objectForKey:@"tempMaxPrice"];
	maxPri = maxPri!=nil?maxPri:@"No Max";
	
	return [NSString stringWithFormat:@"%@ - %@",minPri,maxPri];
}

- (NSString *) getTempBath
{
	NSString *minba = [defaults objectForKey:@"tempMinBath"];
	minba = minba!=nil?minba:@"No Min";
	
	NSString *maxba = [defaults objectForKey:@"tempMaxBath"];
	maxba = maxba!=nil?maxba:@"No Max";
	
	return [NSString stringWithFormat:@"%@ - %@",minba,maxba];
}

- (NSString *) getTempBed
{
	NSString *minbe = [defaults objectForKey:@"tempMinBed"];
	minbe = minbe!=nil?minbe:@"No Min";
	
	NSString *maxbe = [defaults objectForKey:@"tempMaxBed"];
	maxbe = maxbe!=nil?maxbe:@"No Max";
    
	return [NSString stringWithFormat:@"%@ - %@",minbe,maxbe];
}

- (NSString *) getTempSqFt
{
	NSString *minSq = [defaults objectForKey:@"tempMinSqFt"];
	minSq = minSq!=nil?minSq:@"No Min";
	
	NSString *maxSq = [defaults objectForKey:@"tempMaxSqFt"];
	maxSq = maxSq!=nil?maxSq:@"No Max";
	
	return [NSString stringWithFormat:@"%@ - %@",minSq,maxSq];
}


- (void)viewWillDisappear:(BOOL)animated
{
	[self.navigationItem setTitle:@"Cancel"];
	
	if(selectedSegment == 0)
	{
		[txtCity resignFirstResponder];
		[txtState resignFirstResponder];
		[txtZip resignFirstResponder];
	}
	else {
		[txtMLS resignFirstResponder];
	}
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
	[theTextField resignFirstResponder];
	return YES;
}


#pragma mark -
#pragma mark Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	if([[self nameForSection:indexPath.section] isEqual:@"Location"]){
		return 170;
	}
	if([[self nameForSection:indexPath.section] isEqual:@"All Filters"]){
		return 270;
	}
	if([[self nameForSection:indexPath.section] isEqual:@"Search On"]){
		return 44;
	}
	if([[self nameForSection:indexPath.section] isEqual:@"MLS"]){
		return 120;
	}
	if([[self nameForSection:indexPath.section] isEqual:@"Sort"]){
		return 80;
	}
	
	return 0;
	
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    if(selectedSegment == 0 )
	{
		return 4;
	} else if (selectedSegment == 2){
        return 3;
    }
	else
	{
		return 2;
	}
}

-(IBAction)onlyOpenHouseAction:(id)sender{
    if(onlyOHSwitch.on){
        [defaults setBool:YES forKey:@"onlyopenhouse"];
    }else{
        [defaults setBool:NO forKey:@"onlyopenhouse"];
    }
    [defaults synchronize];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	if(section == 0){
		return @"Search On";
	}
	if(selectedSegment == 0)
	{
		if(section == 1){
			return @"";
		}
		
		if(section == 2){
			return @"All Filters";
		}
		
		if(section == 3){
			return @"Sorting";
		}
		
		
	}else if (selectedSegment == 2){
        if(section == 1){
            return @"All Filters";
        }

        if(section == 2){
            return @"Sorting";
        }
	}
	else
	{
		if(section == 1){
			return @"";
		}
		
	}



	return @"";
}	

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //static NSString *CellIdentifier = @"Cell";
	//    
	//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	//    if (cell == nil) {
	//        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	//    }
	//    
	//    // Configure the cell...
	//	
	//	cell.textLabel.text = [appDelegate.arrService objectAtIndex:indexPath.row];
	//    
	//    return cell;
	
	
	if([[self nameForSection:indexPath.section] isEqual:@"Search On"]){
		segmentCell.selectionStyle = UITableViewCellSelectionStyleNone;
		return segmentCell;
	}
	
	if([[self nameForSection:indexPath.section] isEqual:@"Location"]){
		zipTableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
		return zipTableViewCell;
	}
	
	if([[self nameForSection:indexPath.section] isEqual:@"All Filters"]){
		searchTableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
		return searchTableViewCell;
	}
	
	if([[self nameForSection:indexPath.section] isEqual:@"MLS"])
	{
		MLSCell.selectionStyle = UITableViewCellSelectionStyleNone;
		return MLSCell;
	}
	
	if([[self nameForSection:indexPath.section] isEqual:@"Sort"])
	{
		sortCell.selectionStyle = UITableViewCellSelectionStyleNone;
		return sortCell;
	}
	
	
	return nil;
}

- (NSString *)nameForSection:(NSInteger)section
{
	if(section == 0){
		return @"Search On";
	}
	
	if(selectedSegment == 0 )
	{
		if(section == 1){
			return @"Location";
		}
		if(section == 2){
			return @"All Filters";
		}
		if(section == 3){
			return @"Sort";
		}
	} else if (selectedSegment == 2){
        if(section == 1){
            return @"All Filters";
        }
        if(section == 2){
            return @"Sort";
        }
    }
	else
	{
		if(section == 1){
			return @"MLS";
		}
	}
	
	
	
	return @"";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	
}



-(IBAction)Price:(id)sender
{
	[defaults setObject:txtZip.text forKey:@"tempZipCode"];
	//[defaults setObject:lblCityState.text forKey:@"tempCity"];
	//[defaults setObject:txtState.text forKey:@"tempState"];
	
	[defaults synchronize];
	
	mTgr8RangeSelectorVC *rangeSelector = [[mTgr8RangeSelectorVC alloc] initWithNibName:@"mTgr8RangeSelectorVC" bundle:nil];
	rangeSelector.minTarget = objSearchSetting;
	SEL selectMinPriceSel = @selector(setSelectedStartPrice:);
	rangeSelector.minCallback = selectMinPriceSel;
	rangeSelector.pickerMinViewArray= [objSearchSetting startPriceOptions];
	rangeSelector.selectedMinObject= [defaults objectForKey:@"tempMinPrice"]; //[objSearchSetting selectedStartPrice];
	rangeSelector.selectedMinObject = rangeSelector.selectedMinObject!=nil?rangeSelector.selectedMinObject:@"No Min";
	
	rangeSelector.maxTarget = objSearchSetting;
	SEL selectMaxPriceSel = @selector(setSelectedEndPrice:);
	rangeSelector.maxCallback = selectMaxPriceSel;
	rangeSelector.pickerMaxViewArray= [objSearchSetting endPriceOptions];
	rangeSelector.selectedMaxObject= [defaults objectForKey:@"tempMaxPrice"];//[objSearchSetting selectedEndPrice];
	rangeSelector.selectedMaxObject = rangeSelector.selectedMaxObject!=nil?rangeSelector.selectedMaxObject:@"No Max";
	
	rangeSelector.rangeTitleLabelString = @"Selected Price Range";
	
	[self.navigationController pushViewController:rangeSelector animated:YES];
	[rangeSelector release];
}

-(IBAction)Bed:(id)sender
{
	[defaults setObject:txtZip.text forKey:@"tempZipCode"];
	//[defaults setObject:lblCityState.text forKey:@"tempCity"];
	//[defaults setObject:txtState.text forKey:@"tempState"];	
	
	[defaults synchronize];
	
	mTgr8RangeSelectorVC *rangeSelector = [[mTgr8RangeSelectorVC alloc] initWithNibName:@"mTgr8RangeSelectorVC" bundle:nil];
	rangeSelector.minTarget = objSearchSetting;
	SEL selectMinPriceSel = @selector(setSelectedMinBedroom:);
	rangeSelector.minCallback = selectMinPriceSel;
	rangeSelector.pickerMinViewArray= [objSearchSetting minBedroomOptions];
	rangeSelector.selectedMinObject= [defaults objectForKey:@"tempMinBed"];//[objSearchSetting selectedMinBedroom];
	rangeSelector.selectedMinObject = rangeSelector.selectedMinObject!=nil?rangeSelector.selectedMinObject:@"No Min";
	
	rangeSelector.maxTarget = objSearchSetting;
	SEL selectMaxPriceSel = @selector(setSelectedMaxBedroom:);
	rangeSelector.maxCallback = selectMaxPriceSel;
	rangeSelector.pickerMaxViewArray= [objSearchSetting maxBedroomOptions];
	rangeSelector.selectedMaxObject= [defaults objectForKey:@"tempMaxBed"];//[objSearchSetting selectedMaxBedroom];
	rangeSelector.selectedMaxObject = rangeSelector.selectedMaxObject!=nil?rangeSelector.selectedMaxObject:@"No Max";
	
	rangeSelector.rangeTitleLabelString = @"Selected Bedroom Range";
	
	[self.navigationController pushViewController:rangeSelector animated:YES];
	[rangeSelector release];
}

-(IBAction)Bath:(id)sender
{
	[defaults setObject:txtZip.text forKey:@"tempZipCode"];
	//[defaults setObject:lblCityState.text forKey:@"tempCity"];
	//[defaults setObject:txtState.text forKey:@"tempState"];	
	
	[defaults synchronize];
	
	mTgr8RangeSelectorVC *rangeSelector = [[mTgr8RangeSelectorVC alloc] initWithNibName:@"mTgr8RangeSelectorVC" bundle:nil];
    rangeSelector.minTarget = objSearchSetting;
    SEL selectMinPriceSel = @selector(setSelectedMinBathroom:);
    rangeSelector.minCallback = selectMinPriceSel;
    rangeSelector.pickerMinViewArray= [objSearchSetting minBathroomOptions];
    rangeSelector.selectedMinObject= [defaults objectForKey:@"tempMinBath"];//[objSearchSetting selectedMinBathroom];
	rangeSelector.selectedMinObject = rangeSelector.selectedMinObject!=nil?rangeSelector.selectedMinObject:@"No Min";
    
    rangeSelector.maxTarget = objSearchSetting;
    SEL selectMaxPriceSel = @selector(setSelectedMaxBathroom:);
    rangeSelector.maxCallback = selectMaxPriceSel;
    rangeSelector.pickerMaxViewArray= [objSearchSetting maxBathroomOptions];
    rangeSelector.selectedMaxObject= [defaults objectForKey:@"tempMaxBath"];//[objSearchSetting selectedMaxBathroom];
	rangeSelector.selectedMaxObject = rangeSelector.selectedMaxObject!=nil?rangeSelector.selectedMaxObject:@"No Max";
    
    rangeSelector.rangeTitleLabelString = @"Selected Bathroom Range";
    
    [self.navigationController pushViewController:rangeSelector animated:YES];
    [rangeSelector release];
}

-(IBAction)SqFt:(id)sender
{
	[defaults setObject:txtZip.text forKey:@"tempZipCode"];
	//[defaults setObject:lblCityState.text forKey:@"tempCity"];
	//[defaults setObject:txtState.text forKey:@"tempState"];	
	
	[defaults synchronize];
	
	mTgr8RangeSelectorVC *rangeSelector = [[mTgr8RangeSelectorVC alloc] initWithNibName:@"mTgr8RangeSelectorVC" bundle:nil];
	rangeSelector.minTarget = objSearchSetting;
	SEL selectMinPriceSel = @selector(setSelectedMinSquarefootage:);
	rangeSelector.minCallback = selectMinPriceSel;
	rangeSelector.pickerMinViewArray= [objSearchSetting minSquarefootageOptions];
	rangeSelector.selectedMinObject= [defaults objectForKey:@"tempMinSqFt"];//[objSearchSetting selectedMinSquarefootage];
	rangeSelector.selectedMinObject = rangeSelector.selectedMinObject!=nil?rangeSelector.selectedMinObject:@"No Min";
	
	rangeSelector.maxTarget = objSearchSetting;
	SEL selectMaxPriceSel = @selector(setSelectedMaxSquarefootage:);
	rangeSelector.maxCallback = selectMaxPriceSel;
	rangeSelector.pickerMaxViewArray= [objSearchSetting maxSquarefootageOptions];
	rangeSelector.selectedMaxObject= [defaults objectForKey:@"tempMacSqFt"];//[objSearchSetting selectedMaxSquarefootage];
	rangeSelector.selectedMaxObject = rangeSelector.selectedMaxObject!=nil?rangeSelector.selectedMaxObject:@"No Max";
	
	rangeSelector.rangeTitleLabelString = @"Selected Squarefootage Range";
	
	[self.navigationController pushViewController:rangeSelector animated:YES];
	[rangeSelector release];
}

-(IBAction)SortDirection:(id)sender
{
	[defaults setObject:txtZip.text forKey:@"tempZipCode"];
	//[defaults setObject:lblCityState.text forKey:@"tempCity"];
	
	[defaults setObject:@"Sort Direction" forKey:@"SelectedCriteria"];
	
	SettingsViewController *objSettingsViewController = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
	[self.navigationController pushViewController:objSettingsViewController animated:YES];
	[objSettingsViewController release];
	
	[defaults synchronize];
}

-(IBAction)SortBy:(id)sender
{
	[defaults setObject:txtZip.text forKey:@"tempZipCode"];
	//[defaults setObject:lblCityState.text forKey:@"tempCity"];
	
	[defaults setObject:@"Sort By" forKey:@"SelectedCriteria"];
	
	SettingsViewController *objSettingsViewController = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
	[self.navigationController pushViewController:objSettingsViewController animated:YES];
	[objSettingsViewController release];
	
	[defaults synchronize];
	
}

-(IBAction)ListingStatus:(id)sender
{
	[defaults setObject:@"Listing Status" forKey:@"SelectedCriteria"];
	
	SettingsViewController *objSettingsViewController = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
	[self.navigationController pushViewController:objSettingsViewController animated:YES];
	[objSettingsViewController release];
	
}

-(IBAction)SelectCityState:(id)sender
{
	[appDelegate showActivityViewer];
    
	[self performSelector:@selector(selectCityClicked) withObject:nil afterDelay:0.1];
	//[self.navigationItem setTitle:@"Cancel"];
}

-(void) selectCityClicked
{
    if (appDelegate.arrCityStateData.count < 1) {
        [appDelegate fetchCityState];
    }	
    
    if(appDelegate.arrCityStateData.count > 0)
    {
        [defaults setObject:txtZip.text forKey:@"tempZipCode"];
        //[defaults setObject:lblCityState.text forKey:@"tempCity"];
        
        
        SelectCityStateView *objSelectCityStateView = [[SelectCityStateView alloc] initWithNibName:@"SelectCityStateView" bundle:nil];
        [self.navigationController pushViewController:objSelectCityStateView animated:YES];
        [objSelectCityStateView release];
        
        [defaults synchronize];
        
    }
    else {
        [appDelegate performDismiss:0];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"No city found please use Zip or try again later." message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
	
}

-(IBAction)updateInOption:(id)sender{
    PropertyAgeVC *objPropertyTypeVC = [[PropertyAgeVC alloc] initWithNibName:@"PropertyAgeVC" bundle:nil];
	[self.navigationController pushViewController:objPropertyTypeVC animated:YES];
	[objPropertyTypeVC release];
}

-(IBAction)PropType:(id)sender
{
	[appDelegate showActivityViewer];
	
	[self performSelector:@selector(propTypeClicked) withObject:nil afterDelay:0.1];
}

-(void) propTypeClicked
{
	if (appDelegate.arrPropertyType.count < 2) {
		
		[appDelegate fetchPropertyType];
	}
	
	//[defaults setObject:@"Property Type" forKey:@"SelectedCriteria"];
	[defaults setObject:txtZip.text forKey:@"tempZipCode"];
	//[defaults setObject:lblCityState.text forKey:@"tempCity"];
	
	
	PropertyTypeVC *objPropertyTypeVC = [[PropertyTypeVC alloc] initWithNibName:@"PropertyTypeVC" bundle:nil];
	[self.navigationController pushViewController:objPropertyTypeVC animated:YES];
	[objPropertyTypeVC release];
	
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
	if([textField isEqual:txtState])
    {
        NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        return !([newString length] > 2);
	}
	if([textField isEqual:txtZip])
	{
		NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
		return !([newString length] > 256);
	}
	if([textField isEqual:txtCity])
	{
		NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
		return !([newString length] > 256);
	}
	if([textField isEqual:txtMLS])
	{
		NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
		return !([newString length] > 256);
	}
	return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
	[segmentedControl setUserInteractionEnabled:NO];
	
    CGRect textFieldRect =
	[self.view.window convertRect:textField.bounds fromView:textField];
    CGRect viewRect =
	[self.view.window convertRect:self.view.bounds fromView:self.view];
	CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
    CGFloat numerator =
	midline - viewRect.origin.y
	- MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    CGFloat denominator =
	(MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION)
	* viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
	
	if (heightFraction < 0.0)
    {
        heightFraction = 0.0;
    }
    else if (heightFraction > 1.0)
    {
        heightFraction = 1.0;
    }
	
	UIInterfaceOrientation orientation =
	[[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationPortrait ||
        orientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
    }
    else
    {
        animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
    }
	
	CGRect viewFrame = self.view.frame;
    viewFrame.origin.y -= animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
	[segmentedControl setUserInteractionEnabled:YES];
	
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
}

-(void)propertiesFromServer:(NSString *)ListingId
{
	//NSString* urlStr=[NSString stringWithFormat:@"http://getyouridx.agentstorm.com/properties.xml?apikey=%@&limit=20&sort=ListPrice&sort_direction=DESC&Bedrooms=2+&FullBaths=2+",self.API_KEY];
    //	appDelegate.historyMLS = ListingId;
    //	appDelegate.isMSLSearch = YES;
    //	[appDelegate storeHistory];
	
	[appDelegate showActivityViewer];
	NSString* urlStr=[NSString stringWithFormat:@"%@?apikey=%@&ListingId=%@&%@",appDelegate.searchURL,appDelegate.API_KEY,ListingId,[appDelegate getListingStatus]];
	urlStr = [urlStr stringByReplacingOccurrencesOfString:@"+" withString:@"%2B" options:NSBackwardsSearch range:NSMakeRange(0, [urlStr length])];
	urlStr = [urlStr stringByReplacingOccurrencesOfString:@" " withString:@"%20" options:NSBackwardsSearch range:NSMakeRange(0, [urlStr length])];
	//NSLog(@"url: %@",urlStr);
	
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
			callBack ++ ;
			[document retain];
			[delegate retain];
			if(![[XMLUtil getXMLStringValue:@"@count" inNode:[document rootElement]] isEqual: @"0"]) //leak
			{
				
				//totalProperties = [[XMLUtil getXMLStringValue:@"@totalcount" inNode:[document rootElement]]retain];
				Properties* properties = [[[Properties alloc] initWithXML:[document rootElement]] autorelease]; //leak
				if(appDelegate.arrListingData.count <  1)
				{
					cvCtrl = [[SearchResultController alloc] initWithNibName:@"SearchResultController" bundle:nil];
				}
				//cvCtrl.reData = properties;
				[appDelegate.arrSearchResult removeAllObjects];
				for(int i = 0; i < properties.property_var.count; i++){
					id aI = [[properties property_var] objectAtIndex:i];
					
					//NSLog(@"Callback: %@",[[[properties property_var] objectAtIndex:i]listingId_var]);
					for(int d = 0; d < arrListingId.count; d++)
					{
						if([[[[properties property_var] objectAtIndex:i]listingId_var] caseInsensitiveCompare:[arrListingId objectAtIndex:d]] == NSOrderedSame)
						{
							[arrListingId removeObjectAtIndex:d];
							d = 0;
						}
					}
					[appDelegate.arrListingData addObject:aI];
				}
//				appDelegate.arrSearchResult = appDelegate.arrListingData;
                [appDelegate.arrSearchResult addObjectsFromArray:[[appDelegate.arrListingData copy] autorelease]];
                //cvCtrl.propertyData = appDelegate.arrSearchResult;
				
				//			if(callBack >= totalID)
				//			{
				appDelegate.isSearchTab = YES;
				[defaults setBool:YES forKey:@"isListItems"];
				appDelegate.totalProperties = [NSString stringWithFormat:@"%i", appDelegate.arrListingData.count];
				
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
				
//				[self SaveHistory];
				if([appDelegate.actionSheet isFirstResponder])
				{
					[appDelegate performDismiss:0];
				}
				[appDelegate.newSearchNavController pushViewController:cvCtrl animated:NO];
				//[properties release];
				
                //			}
				
			}
			else
			{
				//			if(callBack >= totalID)
				//			{
				[appDelegate performDismiss:0];
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
				//			}
			}
			[defaults synchronize];
		}else{
			[appDelegate performDismiss:0];
			UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"No results found, \nTry changing criteria..." message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[alert show];
			[alert release];
		}
		
	}	
}

- (void) SaveHistory
{
	//appDelegate.historyMLS = [NSString stringWithFormat:@"%@", historyStr];
	appDelegate.isMSLSearch = YES;
	[appDelegate storeHistory];
}

//#pragma mark -
//#pragma mark Settings
//
//- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
//{
//	if([settingSegmentedControl selectedSegmentIndex] == 0){
//		[defaults setObject:[arrSortDirection objectAtIndex:row] forKey:@"SortDirection"];
//		[defaults setInteger:row forKey:@"SortDirectionIndex"];
//	}
//	else if([settingSegmentedControl selectedSegmentIndex] == 1){
//		[defaults setObject:[arrSortBy objectAtIndex:row] forKey:@"SortBy"];
//		[defaults setInteger:row forKey:@"SortByIndex"];
//	}
//	else if([settingSegmentedControl selectedSegmentIndex] == 2){
//		[defaults setObject:[arrListingStatus objectAtIndex:row] forKey:@"SortListingStatus"];
//		[defaults setInteger:row forKey:@"SortListingStatusIndex"];
//		
//	}
//	
//	[defaults synchronize];
//}
//
//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//	NSString *returnStr = nil;
//	if([settingSegmentedControl selectedSegmentIndex] == 0){
//		returnStr=[NSString stringWithFormat:@"%@",[arrSortDirectionShow objectAtIndex:row]];
//	}
//	else if([settingSegmentedControl selectedSegmentIndex] == 1){
//		returnStr=[NSString stringWithFormat:@"%@",[arrSortByShow objectAtIndex:row]];
//	}
//	else if([settingSegmentedControl selectedSegmentIndex] == 2){
//		returnStr=[NSString stringWithFormat:@"%@",[arrListingStatusShow objectAtIndex:row]];
//	}
//	return returnStr;
//}
//
//- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
//{
//	if([settingSegmentedControl selectedSegmentIndex] == 0){
//		return [arrSortDirectionShow count];
//	}
//	else if([settingSegmentedControl selectedSegmentIndex] == 1){
//		return [arrSortByShow count];
//	}
//	else if([settingSegmentedControl selectedSegmentIndex] == 2){
//		return [arrListingStatusShow count];
//	}
//}
//
//- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
//{
//	return 1;
//}
//

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
