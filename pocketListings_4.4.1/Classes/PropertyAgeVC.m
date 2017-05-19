//
//  PropertyAgeVC.m
//  pocketListings
//
//  Created by Developer mTgr8 on 2/6/12.
//  Copyright 2012 mTgr8 Inc. All rights reserved.
//

#import "PropertyAgeVC.h"
#import "pocketListingsAppDelegate.h"
#import "CustomSelectionCell.h"

@implementation PropertyAgeVC

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        appDelegate = (pocketListingsAppDelegate *)[[UIApplication sharedApplication] delegate];
        defaults = [NSUserDefaults standardUserDefaults];
        arrTempList = appDelegate.arrUpdateInOptions;
        tempCurSelection = appDelegate.currentUpdateInOption;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(Done)];
    
    [super viewDidLoad];
}

- (void) Done
{
    appDelegate.currentUpdateInOption = tempCurSelection;
    [defaults setValue:tempCurSelection forKey:@"currentUpdateInOption"];
    [self.navigationController popViewControllerAnimated:YES];
	
}	

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return appDelegate.arrUpdateInOptions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	NSString *CellIdentifier = @"Cell";
	
	CustomSelectionCell *cell = (CustomSelectionCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) 
	{
		NSArray *listings = [[NSBundle mainBundle] loadNibNamed:@"CustomSelectionCell" owner:self options:nil];
		cell =[listings objectAtIndex:0];		
	}	
	
	cell.lblName.text = [arrTempList objectAtIndex:indexPath.row];
	
	[cell setSelectionStyle:UITableViewCellSelectionStyleGray];
	
	if ([arrTempList count]!=0) {
		for (NSString *temp in arrTempList) {
			if ([tempCurSelection isEqualToString:cell.lblName.text]) {
				
				UIImageView *accView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tickMark.png"]]autorelease];
				cell.accessoryView = accView;
			}
            
		}
	}
	
	return cell;
	
	
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	
	CustomSelectionCell *cell = (CustomSelectionCell *)[tableView cellForRowAtIndexPath:indexPath];
	BOOL found = NO;
    //	int tempIndex = -1;
	if (![cell.accessoryView isKindOfClass:[UIImageView class]])
	{
		UIImageView *accView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tickMark.png"]]autorelease];
		cell.accessoryView = accView;
		for (int i = 0; i< [arrTempList count]; i++) {
			NSString *tempName = tempCurSelection;
			if ([tempName isEqualToString:cell.lblName.text]) {
				found = YES;
				break;
			}
		}
		if (!found) {
            tempCurSelection = cell.lblName.text;
		}
	}
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	[tableView reloadData];
	
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)dealloc {
    [super dealloc];
}

@end
