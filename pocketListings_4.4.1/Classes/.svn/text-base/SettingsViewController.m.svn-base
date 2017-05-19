//
//  SettingsViewController.m
//  pocketListings
//
//  Created by Kaustubh Chavan on 12/6/10.
//  Copyright 2010 Xoriant Corporation. All rights reserved.
//

#import "SettingsViewController.h"
#import "pocketListingsAppDelegate.h"


@implementation SettingsViewController

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
	
	//[self.navigationItem setHidesBackButton:YES];
	
	defaults = [NSUserDefaults standardUserDefaults];
	
	self.navigationItem.title = [defaults objectForKey:@"SelectedCriteria"];
	
	appDelegate = (pocketListingsAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	appDelegate.isRangeSelector = YES;
	
	arrSortDirection = [[NSMutableArray alloc]initWithObjects:@"ASC",@"DESC",nil];
	arrSortBy = [[NSMutableArray alloc]initWithObjects:@"ListPrice",@"SqFt",@"LotSqFt",@"ExteriorFeatures",@"YearBuilt",@"Bedrooms",@"FullBathrooms",@"City",nil];
	
	arrSortDirectionShow = [[NSMutableArray alloc]initWithObjects:@"Ascending",@"Descending",nil];
	arrSortByShow = [[NSMutableArray alloc]initWithObjects:@"List Price",@"Square Footage",@"Lot Size",@"Type",@"Year Built",@"Bed",@"Bath",@"City",nil];
	
	arrListingStatusShow = [[NSMutableArray alloc]initWithObjects:@"Active only",@"Active + Pending",@"Pending Only",nil];
	arrListingStatus = [[NSMutableArray alloc]initWithObjects:@"A",@"A,P",@"P",nil];
	
//	if([segmentedControl selectedSegmentIndex] == 0){
//		[sortPicker selectRow:[defaults integerForKey:@"SortDirectionIndex"] inComponent:0 animated:NO];
//	}
//	else if([segmentedControl selectedSegmentIndex] == 1)
//	{
//		[sortPicker selectRow:[defaults integerForKey:@"SortByIndex"] inComponent:0 animated:NO]; 
//	}
//	else if([segmentedControl selectedSegmentIndex] == 2)
//	{
//		[sortPicker selectRow:[defaults integerForKey:@"SortListingStatusIndex"] inComponent:0 animated:NO]; 
//	}
	
	lblName.text = [NSString stringWithFormat:@"Selected %@", [defaults objectForKey:@"SelectedCriteria"]];
	
	if([[defaults objectForKey:@"SelectedCriteria"] isEqualToString:@"Sort Direction"])
	{
		lblSelected.text = [defaults objectForKey:@"tempSortDirectionShow"];//[appDelegate getSortingDirectionShow];
		lblSelected.text = lblSelected.text!=nil?lblSelected.text:@"Ascending";
		[sortPicker selectRow:[defaults integerForKey:@"tempSortDirectionIndex"] inComponent:0 animated:NO];
	}
	else if([[defaults objectForKey:@"SelectedCriteria"] isEqualToString:@"Sort By"])
	{
		lblSelected.text = [defaults objectForKey:@"tempSortByShow"];//[appDelegate getSortingByShow];
		lblSelected.text = lblSelected.text!=nil?lblSelected.text:@"ListPrice";
		[sortPicker selectRow:[defaults integerForKey:@"tempSortByIndex"] inComponent:0 animated:NO]; 
	}
//	else if([[defaults objectForKey:@"SelectedCriteria"] isEqualToString:@"Listing Status"])
//	{
//		lblSelected.text = [appDelegate getListingStatusShow];
//		[sortPicker selectRow:[defaults integerForKey:@"SortListingStatusIndex"] inComponent:0 animated:NO]; 
//	}
//	else if([[defaults objectForKey:@"SelectedCriteria"] isEqualToString:@"Property Type"])
//	{
//		lblSelected.text = [appDelegate getPropertyType];
//		[sortPicker selectRow:[defaults integerForKey:@"PropertyTypeIndex"] inComponent:0 animated:NO]; 
//	}
	
	UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(SaveSetting)]; 
    self.navigationItem.rightBarButtonItem = saveButton;
    [saveButton release];
	
    [super viewDidLoad];
}

- (void)SaveSetting
{
	if([[defaults objectForKey:@"SelectedCriteria"] isEqualToString:@"Sort Direction"]){
		
		//lblSelected.text = [arrSortDirectionShow objectAtIndex:row];
		[defaults setObject:[arrSortDirection objectAtIndex:[sortPicker selectedRowInComponent:0]] forKey:@"tempSortDirection"];
		[defaults setObject:[arrSortDirectionShow objectAtIndex:[sortPicker selectedRowInComponent:0]] forKey:@"tempSortDirectionShow"];
		[defaults setInteger:[sortPicker selectedRowInComponent:0] forKey:@"tempSortDirectionIndex"];
	}
	else if([[defaults objectForKey:@"SelectedCriteria"] isEqualToString:@"Sort By"]){
		
		//lblSelected.text = [arrSortByShow objectAtIndex:row];
		[defaults setObject:[arrSortBy objectAtIndex:[sortPicker selectedRowInComponent:0]] forKey:@"tempSortBy"];
		[defaults setObject:[arrSortByShow objectAtIndex:[sortPicker selectedRowInComponent:0]] forKey:@"tempSortByShow"];
		[defaults setInteger:[sortPicker selectedRowInComponent:0] forKey:@"tempSortByIndex"];
	}
//	else if([[defaults objectForKey:@"SelectedCriteria"] isEqualToString:@"Property Type"]){
//		
//		//lblSelected.text = [arrListingStatusShow objectAtIndex:row];
//		[defaults setObject:[appDelegate.arrPropertyType objectAtIndex:[sortPicker selectedRowInComponent:0]] forKey:@"Property Type"];
//		//[defaults setObject:[arrListingStatusShow objectAtIndex:[sortPicker selectedRowInComponent:0]] forKey:@"SortListingStatusShow"];
//		[defaults setInteger:[sortPicker selectedRowInComponent:0] forKey:@"PropertyTypeIndex"];
//		
//	}
//	else if([[defaults objectForKey:@"SelectedCriteria"] isEqualToString:@"Listing Status"]){
//		
//		//lblSelected.text = [arrListingStatusShow objectAtIndex:row];
//		[defaults setObject:[arrListingStatus objectAtIndex:[sortPicker selectedRowInComponent:0]] forKey:@"SortListingStatus"];
//		[defaults setObject:[arrListingStatusShow objectAtIndex:[sortPicker selectedRowInComponent:0]] forKey:@"SortListingStatusShow"];
//		[defaults setInteger:[sortPicker selectedRowInComponent:0] forKey:@"SortListingStatusIndex"];
//		
//	}
	
	[defaults synchronize];
	
	
	[self.navigationController popViewControllerAnimated:YES];
}
								   

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 2;
}

- (NSString *)nameForSection:(NSInteger)section
{
	if( section == 0){
		return @"Label";
	}
	if( section == 1){
		return @"Control";
	}
	
	return @"";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	if([[self nameForSection:indexPath.section] isEqual:@"Label"]){
		return cellLabel;
	}
	if([[self nameForSection:indexPath.section] isEqual:@"Control"]){
		return cellController;
	}
	
	return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	if([[self nameForSection:indexPath.section] isEqual:@"Label"]){
		return 60;
	}
	if([[self nameForSection:indexPath.section] isEqual:@"Control"]){
		return 210;
	}
	return 30;
}								   

- (void)segmentAction:(id)sender
{	
	[sortPicker reloadAllComponents];
	if([segmentedControl selectedSegmentIndex] == 0){
		[sortPicker selectRow:[defaults integerForKey:@"SortDirectionIndex"] inComponent:0 animated:NO];
	}
	else if([segmentedControl selectedSegmentIndex] == 1)
	{
		[sortPicker selectRow:[defaults integerForKey:@"SortByIndex"] inComponent:0 animated:NO]; 
	}
//	else if([segmentedControl selectedSegmentIndex] == 2)
//	{
//		[sortPicker selectRow:[defaults integerForKey:@"SortListingStatusIndex"] inComponent:0 animated:NO]; 
//	}
	
	
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	if([[defaults objectForKey:@"SelectedCriteria"] isEqualToString:@"Sort Direction"]){
		
		lblSelected.text = [arrSortDirectionShow objectAtIndex:row];
//		[defaults setObject:[arrSortDirection objectAtIndex:row] forKey:@"SortDirection"];
//		[defaults setObject:[arrSortDirectionShow objectAtIndex:row] forKey:@"SortDirectionShow"];
//		[defaults setInteger:row forKey:@"SortDirectionIndex"];
	}
	else if([[defaults objectForKey:@"SelectedCriteria"] isEqualToString:@"Sort By"]){
		
		lblSelected.text = [arrSortByShow objectAtIndex:row];
//		[defaults setObject:[arrSortBy objectAtIndex:row] forKey:@"SortBy"];
//		[defaults setObject:[arrSortByShow objectAtIndex:row] forKey:@"SortByShow"];
//		[defaults setInteger:row forKey:@"SortByIndex"];
	}
//	else if([[defaults objectForKey:@"SelectedCriteria"] isEqualToString:@"Listing Status"]){
//		
//		lblSelected.text = [arrListingStatusShow objectAtIndex:row];
////		[defaults setObject:[arrListingStatus objectAtIndex:row] forKey:@"SortListingStatus"];
////		[defaults setObject:[arrListingStatusShow objectAtIndex:row] forKey:@"SortListingStatusShow"];
////		[defaults setInteger:row forKey:@"SortListingStatusIndex"];
//
//	}
//	else if([[defaults objectForKey:@"SelectedCriteria"] isEqualToString:@"Property Type"]){
//		
//		lblSelected.text = [appDelegate.arrPropertyType objectAtIndex:row];
//	}		

	[defaults synchronize];
}

#pragma mark -
#pragma mark UIPickerViewDataSource

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	NSString *returnStr = nil;
	if([[defaults objectForKey:@"SelectedCriteria"] isEqualToString:@"Sort Direction"]){
		returnStr=[NSString stringWithFormat:@"%@",[arrSortDirectionShow objectAtIndex:row]];
	}
	else if([[defaults objectForKey:@"SelectedCriteria"] isEqualToString:@"Sort By"]){
		returnStr=[NSString stringWithFormat:@"%@",[arrSortByShow objectAtIndex:row]];
	}
//	else if([[defaults objectForKey:@"SelectedCriteria"] isEqualToString:@"Listing Status"]){
//		returnStr=[NSString stringWithFormat:@"%@",[arrListingStatusShow objectAtIndex:row]];
//	}
//	else if([[defaults objectForKey:@"SelectedCriteria"] isEqualToString:@"Property Type"]){
//		returnStr=[NSString stringWithFormat:@"%@",[appDelegate.arrPropertyType objectAtIndex:row]];
//	}
	return returnStr;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	if([[defaults objectForKey:@"SelectedCriteria"] isEqualToString:@"Sort Direction"]){
		return [arrSortDirectionShow count];
	}
	else if([[defaults objectForKey:@"SelectedCriteria"] isEqualToString:@"Sort By"]){
		return [arrSortByShow count];
	}
//	else if([[defaults objectForKey:@"SelectedCriteria"] isEqualToString:@"Listing Status"]){
//		return [arrListingStatusShow count];
//	}
//	else if([[defaults objectForKey:@"SelectedCriteria"] isEqualToString:@"Property Type"]){
//		return [appDelegate.arrPropertyType count];
//	}
    return 0;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
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
	[arrSortByShow release];
	[arrSortBy release];
	[arrSortDirection release];
	[arrSortDirectionShow release];
    [super dealloc];
}


@end
