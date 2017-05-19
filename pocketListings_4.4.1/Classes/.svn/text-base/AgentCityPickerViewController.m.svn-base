//
//  AgentCityPickerViewController.m
//  pocketListings
//
//  Created by Developer mTgr8 on 10/22/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "AgentCityPickerViewController.h"
#import "CityStateData.h"
#import "CustomSelectionCell.h"
#import "OverlayViewController.h"
#import "AgentBrowViewController.h"

@implementation AgentCityPickerViewController
@synthesize arrCityStateData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
        arrCityStateData = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
	
//	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(Done)];
	
	self.title = @"City";
	arrCity = [[NSMutableArray alloc]init];
	copyListOfItems = [[NSMutableArray alloc]init];
	//arrState = [[NSMutableArray alloc]init];
	tempList = [[NSMutableArray alloc]init];
	
	arrListingData = [[NSMutableArray alloc]init];
	
    for(int i =0; i < arrCityStateData.count; i ++)
    {
        CityStateData *objCityStateData = [arrCityStateData objectAtIndex:i];
        
        NSMutableString *rowData = [[[NSMutableString alloc]init]autorelease];
        
        NSString *cityName = objCityStateData.city;
        
        if(cityName != nil)
        {
            [rowData appendFormat:@"%@,",cityName];
            [rowData appendFormat:@"%@",objCityStateData.state];
            
            [arrListingData addObject:rowData];
            
        }
        
        
    }
    
	stateIndex = [[NSMutableArray alloc] init];
    
    for (int i=0; i<[arrListingData count]-1; i++){
        //---get the first char of each state---
        char alphabet = [[arrListingData objectAtIndex:i] characterAtIndex:0];
        NSString *uniChar = [NSString stringWithFormat:@"%C", alphabet];
        
        //---add each letter to the index array---
        if (![stateIndex containsObject:uniChar])
        {            
            [stateIndex addObject:uniChar];
        }        
    }
	
	[stateIndex sortUsingDescriptors:[NSArray arrayWithObject:[[[NSSortDescriptor alloc] initWithKey:nil ascending:YES] autorelease]]];
    
	[super viewDidLoad];
}

- (void) Done
{
	
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    //return noOfState.count;
	if (searching)
		return 1;
	else
        return stateIndex.count;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
	
	if (searching)
		return nil;
	else		
        return stateIndex;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    
	if (searching)
		return 1;
	else
        return index;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (searching)
		return [copyListOfItems count];
	else {
		//---get the letter in each section; e.g., A, B, C, etc.---
		NSString *alphabet = [stateIndex objectAtIndex:section];
		
		//---get all states beginning with the letter---
		NSPredicate *predicate = 
		[NSPredicate predicateWithFormat:@"SELF beginswith[c] %@", alphabet];
		NSArray *states = [arrListingData filteredArrayUsingPredicate:predicate];
		
		//---return the number of states beginning with the letter---
		return [states count];    
		
	}
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	NSString *CellIdentifier = @"Cell";
	
	CustomSelectionCell *cell = (CustomSelectionCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) 
	{
		NSArray *listings = [[NSBundle mainBundle] loadNibNamed:@"CustomSelectionCell" owner:self options:nil];
		cell =[listings objectAtIndex:0];
		
		//cell.backgroundView = [[UIImageView alloc] init ] ;
		//cell.selectedBackgroundView = (UIImageView *) [ [ [UIImageView alloc] initWithImage:[UIImage imageNamed:@"select2.png"]] autorelease] ;		
		
	}	
	
	if(isSeachButton)
	{
		if(searchBar.text.length > 0)
		{
			cell.lblName.text = [copyListOfItems objectAtIndex:indexPath.row];
		}
		else {
			//isSeachButton = NO;
			NSString *alphabet = [stateIndex objectAtIndex:indexPath.section];
			
			//---get all states beginning with the letter---
			NSPredicate *predicate = 
			[NSPredicate predicateWithFormat:@"SELF beginswith[c] %@", alphabet];
			NSArray *states = [arrListingData filteredArrayUsingPredicate:predicate];
			
			if ([states count]>0) {
				//---extract the relevant state from the states object---
				NSString *cellValue = [states objectAtIndex:indexPath.row];
				//cell.textLabel.text = cellValue;
				cell.lblName.text = cellValue;
			}
		}	
	}
	else
	{
		if (searching)
		{
			cell.lblName.text = [copyListOfItems objectAtIndex:indexPath.row];
		}
		else 
		{
			NSString *alphabet = [stateIndex objectAtIndex:indexPath.section];
			
			//---get all states beginning with the letter---
			NSPredicate *predicate = 
			[NSPredicate predicateWithFormat:@"SELF beginswith[c] %@", alphabet];
			NSArray *states = [arrListingData filteredArrayUsingPredicate:predicate];
			
			if ([states count]>0) {
				//---extract the relevant state from the states object---
				NSString *cellValue = [states objectAtIndex:indexPath.row];
				//cell.textLabel.text = cellValue;
				cell.lblName.text = cellValue;
			}
			
		}
		
	}
    
	
	
	
	if ([tempList count]!=0) {
		for (NSString *temp in tempList) {
			if ([temp isEqualToString:cell.lblName.text]) {
				
				UIImageView *accView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tickMark.png"]]autorelease];
				cell.accessoryView = accView;
			}
			
		}
	}
	
	[cell setSelectionStyle:UITableViewCellSelectionStyleGray];
	
	
	return cell;
	
	
}

//- (NSIndexPath *)tableView :(UITableView *)theTableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//	
////	if(letUserSelectRow)
////		return indexPath;
////	else
////		return nil;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomSelectionCell *cell = (CustomSelectionCell *)[tableView cellForRowAtIndexPath:indexPath];
//	
//	BOOL found = NO;
//	int tempIndex = -1;
//    
//	
//	if ([cell.accessoryView isKindOfClass:[UIImageView class]])
//	{
//		cell.accessoryView = nil;
//		for (int i = 0; i< [tempList count]; i++) {
//			NSString *tempName = [tempList objectAtIndex:i];
//			if ([tempName isEqualToString:cell.lblName.text]) {
//				found = YES;
//				tempIndex = i;
//				break;
//			}
//		}
//		if (found) {
//			[tempList removeObjectAtIndex:tempIndex];
//			//[appDelegate.arrSelectedCtSt removeObjectAtIndex:tempIndex];
//		}
//		
//	}
//	else {
//		
//		UIImageView *accView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tickMark.png"]]autorelease];
//		cell.accessoryView = accView;
//		for (int i = 0; i< [tempList count]; i++) {
//			NSString *tempName = [tempList objectAtIndex:i];
//			if ([tempName isEqualToString:cell.lblName.text]) {
//				found = YES;
//				break;
//			}
//		}
//		if (!found) {
//			[tempList addObject:cell.lblName.text];
//			//[appDelegate.arrSelectedCtSt addObject:cell.lblName.text];
//		}
//	}
//	
//	[tbList deselectRowAtIndexPath:indexPath animated:YES];
    AgentBrowViewController *abViewController = [[AgentBrowViewController alloc] initWithNibName:nil bundle:nil];
    NSString* citystatename = cell.lblName.text;
    NSString* cty = [citystatename substringToIndex:[citystatename rangeOfString:@","].location];
    
    abViewController.city=cty;
    [self.navigationController pushViewController:abViewController animated:NO];
	[abViewController release];

	
}


//- (NSString *) cityName:(NSString *)cityID
//{
//	for(int c = 0; c < appDelegate.cityIDArray.count; c++)
//	{
//		if([cityID isEqualToString:[appDelegate.cityIDArray objectAtIndex:c]])
//		{
//			return [appDelegate.cityNameArray objectAtIndex:c];
//		}
//	}
//	
//	return cityID;
//	
//}

#pragma mark -
#pragma mark Search Bar 

- (void) searchBarTextDidBeginEditing:(UISearchBar *)theSearchBar {
	
	//This method is called again when the user clicks back from teh detail view.
	//So the overlay is displayed on the results, which is something we do not want to happen.
	if(searching)
		return;
	
	//Add the overlay view.
	if(ovController == nil)
		ovController = [[OverlayViewController alloc] initWithNibName:@"OverlayView" bundle:[NSBundle mainBundle]];
	
	//CGFloat yaxis = self.navigationController.navigationBar.frame.size.height;
	CGFloat width = self.view.frame.size.width;
	CGFloat height = self.view.frame.size.height;
	
	//Parameters x = origion on x-axis, y = origon on y-axis.
	CGRect frame = CGRectMake(0, 0, width, height);
	ovController.view.frame = frame;	
	ovController.view.backgroundColor = [UIColor grayColor];
	ovController.view.alpha = 0.5;
	
	ovController.rvController = self;
	
	[tbList insertSubview:ovController.view aboveSubview:self.parentViewController.view];
	
	searching = YES;
	letUserSelectRow = NO;
	//tbList.scrollEnabled = NO;
	[tbList reloadData];
	
	//Add the done button.
    //	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] 
    //											   initWithBarButtonSystemItem:UIBarButtonSystemItemDone 
    //											   target:self action:@selector(doneSearching_Clicked:)] autorelease];
}

- (void)searchBar:(UISearchBar *)theSearchBar textDidChange:(NSString *)searchText {
	
	//Remove all objects first.
	[copyListOfItems removeAllObjects];
	
	if([searchText length] > 0) {
		
		[ovController.view removeFromSuperview];
		searching = YES;
		letUserSelectRow = YES;
		tbList.scrollEnabled = YES;
		isSeachButton = NO;
		[self searchTableView];
	}
	else {
		
		[tbList scrollsToTop];
		
		[tbList insertSubview:ovController.view aboveSubview:self.parentViewController.view];
		
		searching = NO;
		letUserSelectRow = NO;
		tbList.scrollEnabled = NO;
	}
	
	[tbList reloadData];
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)theSearchBar {
	
	//[self searchTableView];
	[searchBar resignFirstResponder];
	isSeachButton = YES;
	//[searchBar setText:@""];
}

- (void)searchBarResultsListButtonClicked:(UISearchBar *)theSearchBar
{
	[searchBar resignFirstResponder];
}

- (void) searchTableView {
	
	NSString *searchText = searchBar.text;
	NSMutableArray *searchArray = [[NSMutableArray alloc] init];
    
	for (NSString *sTemp in arrListingData)
	{
		NSRange titleResultsRange = [sTemp rangeOfString:searchText options:NSCaseInsensitiveSearch];
		
		if (titleResultsRange.length > 0)
			[copyListOfItems addObject:sTemp];
	}
	
	[searchArray release];
	searchArray = nil;
}

- (void) doneSearching_Clicked:(id)sender {
	
	searchBar.text = @"";
	[searchBar resignFirstResponder];
	
	letUserSelectRow = YES;
	searching = NO;
	//self.navigationItem.rightBarButtonItem = nil;
	tbList.scrollEnabled = YES;
	
	[ovController.view removeFromSuperview];
	[ovController release];
	ovController = nil;
	
	[tbList reloadData];
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

//@synthesize cities;
//
//- (id)initWithStyle:(UITableViewStyle)style
//{
//    self = [super initWithStyle:style];
//    if (self) {
//        // Custom initialization
//        cities = [[NSMutableArray alloc] init];
//    }
//    return self;
//}
//
//- (void)didReceiveMemoryWarning
//{
//    // Releases the view if it doesn't have a superview.
//    [super didReceiveMemoryWarning];
//    
//    // Release any cached data, images, etc that aren't in use.
//}
//
//#pragma mark - View lifecycle
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//
//    // Uncomment the following line to preserve selection between presentations.
//    self.clearsSelectionOnViewWillAppear = NO;
// 
//    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
//}
//
//- (void)viewDidUnload
//{
//    [super viewDidUnload];
//    // Release any retained subviews of the main view.
//    // e.g. self.myOutlet = nil;
//}
//
//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//}
//
//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//}
//
//- (void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//}
//
//- (void)viewDidDisappear:(BOOL)animated
//{
//    [super viewDidDisappear:animated];
//}
//
//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    // Return YES for supported orientations
//    return (interfaceOrientation == UIInterfaceOrientationPortrait);
//}
//
//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return [cities count];
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"CityCell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
//    }
//    
//    // Configure the cell...
//    [cell setText:[cities objectAtIndex:indexPath.row]];
//    
//    return cell;
//}
//
///*
//// Override to support conditional editing of the table view.
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Return NO if you do not want the specified item to be editable.
//    return YES;
//}
//*/
//
///*
//// Override to support editing the table view.
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        // Delete the row from the data source
//        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    }   
//    else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    }   
//}
//*/
//
///*
//// Override to support rearranging the table view.
//- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
//{
//}
//*/
//
///*
//// Override to support conditional rearranging of the table view.
//- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Return NO if you do not want the item to be re-orderable.
//    return YES;
//}
//*/
//
//#pragma mark - Table view delegate
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Navigation logic may go here. Create and push another view controller.
//    /*
//     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
//     // ...
//     // Pass the selected object to the new view controller.
//     [self.navigationController pushViewController:detailViewController animated:YES];
//     [detailViewController release];
//     */
//}

@end
