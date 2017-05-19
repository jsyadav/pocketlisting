//
//  mTgr8RangeSelectorVC.m
//  MLS-R-App
//
//  Created by mDeveloper on 9/24/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "mTgr8RangeSelectorVC.h"
#import "AppUtils.h"
#import "pocketListingsAppDelegate.h"


@implementation mTgr8RangeSelectorVC

@synthesize rangePicker,pickerMinViewArray,labelCell,controlCell,selctedObjectLabel,minTarget,minCallback,selectedMinObject;
@synthesize selectedRangeTitleLabel,pickerMaxViewArray,selectedMaxObject,maxTarget,maxCallback,rangeTitleLabelString,tableView;


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		self.title=@"Choose Range";
		//self.globalSettings = [AppUtils getGlobalSettingsObj];
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    //self.navigationItem.hidesBackButton = TRUE;
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneAction)];
    self.navigationItem.rightBarButtonItem = doneBtn;
    [doneBtn release];
    [super viewDidLoad];
	appDelegate = (pocketListingsAppDelegate *)[[UIApplication sharedApplication] delegate];
	appDelegate.isRangeSelector = YES;
    selctedObjectLabel.text = [NSString stringWithFormat:@"%@ - %@",selectedMinObject,selectedMaxObject];
    selectedRangeTitleLabel.text =  rangeTitleLabelString;
	[rangePicker selectRow:[pickerMinViewArray indexOfObject:selectedMinObject] inComponent:0 animated:NO]; 
	[rangePicker selectRow:[pickerMaxViewArray indexOfObject:selectedMaxObject] inComponent:1 animated:NO];
	
	defaults = [NSUserDefaults standardUserDefaults];
}

-(void)doneAction{
	
	
	//appDelegate.isRangeSelector = YES;
    //NSLog(@"Done");
    UIAlertView *alert;
	if([rangeTitleLabelString isEqualToString:@"Selected Squarefootage Range"])
	{
		int min = [[pickerMinViewArray objectAtIndex:[rangePicker selectedRowInComponent:0]]intValue];
		int max = [[pickerMaxViewArray objectAtIndex:[rangePicker selectedRowInComponent:1]]intValue];
		if(min > max)
		{
			if(maxIndex != 0)
			{
				alert = [[UIAlertView alloc] initWithTitle:@"Error!" 
												   message:@"Incorrect Range..." 
												  delegate:self 
										 cancelButtonTitle:nil 
										 otherButtonTitles:@"OK", nil];
				[alert show];
				[alert release];
			}
			else
			{
				[self saveChanges];
				[self.navigationController popViewControllerAnimated:YES];
			}
		}
		else
		{
			[self saveChanges];
			[self.navigationController popViewControllerAnimated:YES];
		}
	}
	else 
	{
		if(minIndex > maxIndex)
		{
			if(maxIndex != 0)
			{
				alert = [[UIAlertView alloc] initWithTitle:@"Error!" 
												   message:@"Incorrect Range..." 
												  delegate:self 
										 cancelButtonTitle:nil 
										 otherButtonTitles:@"OK", nil];
				[alert show];
				[alert release];
			}
			else
			{
				[self saveChanges];
				[self.navigationController popViewControllerAnimated:YES];
			}
			
		}
		else
		{
			[self saveChanges];
			[self.navigationController popViewControllerAnimated:YES];
		}
		
	}
}

- (void) saveChanges
{
	//if( component == 0){
		// min range
		if( [self.minTarget respondsToSelector:self.minCallback] ){
			[self.minTarget performSelector:self.minCallback withObject:[pickerMinViewArray objectAtIndex:[rangePicker selectedRowInComponent:0]]];
			
			if([rangeTitleLabelString isEqualToString:@"Selected Price Range"])
			{
				[defaults setObject:[pickerMinViewArray objectAtIndex:[rangePicker selectedRowInComponent:0]] forKey:@"tempMinPrice"];
			}
			else if([rangeTitleLabelString isEqualToString:@"Selected Bedroom Range"])
			{
				[defaults setObject:[pickerMinViewArray objectAtIndex:[rangePicker selectedRowInComponent:0]] forKey:@"tempMinBed"];
			}
			else if([rangeTitleLabelString isEqualToString:@"Selected Bathroom Range"])
			{
				[defaults setObject:[pickerMinViewArray objectAtIndex:[rangePicker selectedRowInComponent:0]] forKey:@"tempMinBath"];
			}
			else if([rangeTitleLabelString isEqualToString:@"Selected Squarefootage Range"])
			{
				[defaults setObject:[pickerMinViewArray objectAtIndex:[rangePicker selectedRowInComponent:0]] forKey:@"tempMinSqFt"];
			}
		}
	//}
//	else if( component == 1){
		//max range
		if( [self.maxTarget respondsToSelector:self.maxCallback] ){
			[self.maxTarget performSelector:self.maxCallback withObject:[pickerMaxViewArray objectAtIndex:[rangePicker selectedRowInComponent:1]]];
			
			if([rangeTitleLabelString isEqualToString:@"Selected Price Range"])
			{
				[defaults setObject:[pickerMaxViewArray objectAtIndex:[rangePicker selectedRowInComponent:1]] forKey:@"tempMaxPrice"];
			}
			else if([rangeTitleLabelString isEqualToString:@"Selected Bedroom Range"])
			{
				[defaults setObject:[pickerMaxViewArray objectAtIndex:[rangePicker selectedRowInComponent:1]] forKey:@"tempMaxBed"];
			}
			else if([rangeTitleLabelString isEqualToString:@"Selected Bathroom Range"])
			{
				[defaults setObject:[pickerMaxViewArray objectAtIndex:[rangePicker selectedRowInComponent:1]] forKey:@"tempMaxBath"];
			}
			else if([rangeTitleLabelString isEqualToString:@"Selected Squarefootage Range"])
			{
				[defaults setObject:[pickerMaxViewArray objectAtIndex:[rangePicker selectedRowInComponent:1]] forKey:@"tempMaxSqFt"]; 
			}
		}
		[defaults synchronize];
//	}
	
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
		return labelCell;
	}
	if([[self nameForSection:indexPath.section] isEqual:@"Control"]){
		return controlCell;
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


#pragma mark -
#pragma mark UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	// report the selection to the UI label
	selctedObjectLabel.text = [NSString stringWithFormat:@"%@ - %@",
					  [pickerMinViewArray objectAtIndex:[rangePicker selectedRowInComponent:0]],[pickerMaxViewArray objectAtIndex:[rangePicker selectedRowInComponent:1]]];
    minIndex = [rangePicker selectedRowInComponent:0];
    maxIndex = [rangePicker selectedRowInComponent:1];
	
//	if( component == 0){
//		// min range
//		if( [self.minTarget respondsToSelector:self.minCallback] ){
//			[self.minTarget performSelector:self.minCallback withObject:[pickerMinViewArray objectAtIndex:[rangePicker selectedRowInComponent:0]]];
//			
//			if([rangeTitleLabelString isEqualToString:@"Selected Price Range"])
//			{
//				[defaults setObject:[pickerMinViewArray objectAtIndex:[rangePicker selectedRowInComponent:0]] forKey:@"startPrice"];
//			}
//			else if([rangeTitleLabelString isEqualToString:@"Selected Bedroom Range"])
//			{
//				[defaults setObject:[pickerMinViewArray objectAtIndex:[rangePicker selectedRowInComponent:0]] forKey:@"minBed"];
//			}
//			else if([rangeTitleLabelString isEqualToString:@"Selected Bathroom Range"])
//			{
//				[defaults setObject:[pickerMinViewArray objectAtIndex:[rangePicker selectedRowInComponent:0]] forKey:@"minBath"];
//			}
//			else if([rangeTitleLabelString isEqualToString:@"Selected Squarefootage Range"])
//			{
//				[defaults setObject:[pickerMinViewArray objectAtIndex:[rangePicker selectedRowInComponent:0]] forKey:@"minSqFt"];
//			}
//		}
//		[defaults synchronize];
//	}
//	else if( component == 1){
//		//max range
//		if( [self.maxTarget respondsToSelector:self.maxCallback] ){
//			[self.maxTarget performSelector:self.maxCallback withObject:[pickerMaxViewArray objectAtIndex:[rangePicker selectedRowInComponent:1]]];
//			
//			if([rangeTitleLabelString isEqualToString:@"Selected Price Range"])
//			{
//				[defaults setObject:[pickerMaxViewArray objectAtIndex:[rangePicker selectedRowInComponent:1]] forKey:@"endPrice"];
//			}
//			else if([rangeTitleLabelString isEqualToString:@"Selected Bedroom Range"])
//			{
//				[defaults setObject:[pickerMaxViewArray objectAtIndex:[rangePicker selectedRowInComponent:1]] forKey:@"maxBed"];
//			}
//			else if([rangeTitleLabelString isEqualToString:@"Selected Bathroom Range"])
//			{
//				[defaults setObject:[pickerMaxViewArray objectAtIndex:[rangePicker selectedRowInComponent:1]] forKey:@"maxBath"];
//			}
//			else if([rangeTitleLabelString isEqualToString:@"Selected Squarefootage Range"])
//			{
//				[defaults setObject:[pickerMaxViewArray objectAtIndex:[rangePicker selectedRowInComponent:1]] forKey:@"maxSqFt"]; 
//			}
//		}
//		[defaults synchronize];
//	}
    
}


#pragma mark -
#pragma mark UIPickerViewDataSource

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	NSString *returnStr = nil;
	if( component == 0){
		returnStr=[NSString stringWithFormat:@"%@",[pickerMinViewArray objectAtIndex:row]];
	}
	else{
		returnStr=[NSString stringWithFormat:@"%@",[pickerMaxViewArray objectAtIndex:row]];
	}
	return returnStr;
}
/*
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
	CGFloat componentWidth =200.0;	
	return componentWidth;
}*/

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
	return 35.0;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	if( component == 0){
		return [pickerMinViewArray count];
	}
	else{
		return [pickerMaxViewArray count];
	}
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 2;
}



- (void)dealloc {
	[rangePicker release];
	[labelCell release];
	[selctedObjectLabel release];
	[controlCell release];
    [super dealloc];
}


@end
