//
//  PropertyTypeVC.m
//  pocketListings
//
//  Created by Kaustubh Chavan on 1/14/11.
//  Copyright 2011 Xoriant Corporation. All rights reserved.
//

#import "PropertyTypeVC.h"
#import "pocketListingsAppDelegate.h"
#import "CustomSelectionCell.h"


@implementation PropertyTypeVC

NSIndexPath *lastIndexPath;

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
	
	appDelegate = (pocketListingsAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	defaults = [NSUserDefaults standardUserDefaults];
	
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(Done)];
	
	appDelegate.isRangeSelector = YES;
	
	arrTempList = [[NSMutableArray alloc]init];
	
	for (int i = 0; i < appDelegate.arrSelectedPropType.count; i++) {
		[arrTempList addObject:[appDelegate.arrSelectedPropType objectAtIndex:i]];
	}
	
	[appDelegate performDismiss:0];
	
    [super viewDidLoad];
}

- (void) Done
{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	appDelegate.arrSelectedPropType = [[[NSMutableArray alloc]init]autorelease];
	for (int i = 0; i < arrTempList.count; i++) {
		[appDelegate.arrSelectedPropType addObject:[arrTempList objectAtIndex:i]];
	}
	
	appDelegate.selectedPropType = [[NSMutableString alloc]init];
	
	for (int i =0; i < appDelegate.arrSelectedPropType.count; i++) {
		
		NSString *data = [appDelegate.arrSelectedPropType objectAtIndex:i];
		
		if(i == appDelegate.arrSelectedPropType.count-1)
		{
			[appDelegate.selectedPropType appendFormat:@"%@",data];
			
		}
		else {
			[appDelegate.selectedPropType appendFormat:@"%@%,",data];
			
		}
		
		
	}
	
//	[defaults setObject:appDelegate.selectedPropType forKey:@"SelectedPropertyTypeStr"];
//	[defaults setObject:appDelegate.arrSelectedPropType forKey:@"SelectedPropertyTypeData"];
	[defaults synchronize];

	[self.navigationController popViewControllerAnimated:YES];
	
	[pool drain];
}


#pragma mark -
#pragma mark Table view data source



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return appDelegate.arrPropertyType.count;
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
	
	// Configure the cell...
	//cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
	
	cell.lblName.text = [appDelegate.arrPropertyType objectAtIndex:indexPath.row];
	
	[cell setSelectionStyle:UITableViewCellSelectionStyleGray];
	
	if ([arrTempList count]!=0) {
		for (NSString *temp in arrTempList) {
			if ([temp isEqualToString:cell.lblName.text]) {
				
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
	if ([cell.accessoryView isKindOfClass:[UIImageView class]])
	{
//		cell.accessoryView = nil;
//		for (int i = 0; i< [arrTempList count]; i++) {
//			NSString *tempName = [arrTempList objectAtIndex:i];
//			if ([tempName isEqualToString:cell.lblName.text]) {
//				found = YES;
//				tempIndex = i;
//				break;
//			}
//		}
//		if (found) {
//			[arrTempList removeObjectAtIndex:tempIndex];
//		}
		
	}
	else {
		
		UIImageView *accView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tickMark.png"]]autorelease];
		cell.accessoryView = accView;
		for (int i = 0; i< [arrTempList count]; i++) {
			NSString *tempName = [arrTempList objectAtIndex:i];
			if ([tempName isEqualToString:cell.lblName.text]) {
				found = YES;
				break;
			}
		}
		if (!found) {
			[arrTempList removeAllObjects];
			[arrTempList addObject:cell.lblName.text];
		}
	}
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	[tableView reloadData];
	
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


@end
