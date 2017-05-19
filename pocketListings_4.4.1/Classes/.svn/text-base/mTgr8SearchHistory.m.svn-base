//
//  mTgr8SearchHistory.m
//  idx
//
//  Created by Kaustubh Chavan on 27/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "mTgr8SearchHistory.h"
#import "pocketListingsAppDelegate.h"
#import "AppUtils.h"
#import "XMLUtil.h"
#import "Properties.h"
#import "SearchResultController.h"
#import "mTgr8MyCriteria.h"
#import "MapViewController.h"
#import "mTgr8SearchSettingObject.h"
#import "Utils.h"


@implementation mTgr8SearchHistory
@synthesize arrData;

int callBackH = 0;
int totalIDH = 0;

static NSString* currentSelectedURL;

+ (NSString*)currentSelectedURL {
    return currentSelectedURL;
}

+ (void)setCurrentSelectedURL:(NSString *)url{
    if (currentSelectedURL != url) {
        [currentSelectedURL release];
        currentSelectedURL = [url copy];
    }
}
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
	
	self.navigationItem.title = @"Search History";
	
	defaults = [NSUserDefaults standardUserDefaults];
		
    [super viewDidLoad];
}


#pragma mark -
#pragma mark Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	return 80;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (void)viewWillAppear:(BOOL)animated
{
	arrData = [[NSMutableArray alloc]init];
	arrListingId = [[NSMutableArray alloc]init];
	callBackH = 0;
    NSArray* arrHistory = [defaults arrayForKey:@"History"];
	if(arrHistory != nil && arrHistory.count > 0)
	{
		for(int a = arrHistory.count-1; a >= 0;a--)
		{
			//NSLog(@"Index: %i",a);
			[arrData addObject:[arrHistory objectAtIndex:a]];
		}
	}

	
	//[tblView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return arrData.count;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
	}
	
	NSString *str = [arrData objectAtIndex:indexPath.row];
	
	[cell setSelectionStyle:UITableViewCellSelectionStyleGray];
	// Configure the cell...
	UILabel *lblText = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 310, 60)];
    NSString* valStr =  [AppUtils getObjectURL:str forKey:@"city=" finalDelim:@"&"];
    NSString* aCityStr = [NSString stringWithFormat:@"City=%@",valStr.length==0?@"-":valStr];
    
    valStr = [AppUtils getObjectURL:str forKey:@"Zip=" finalDelim:@"&"];
    NSString* aZipStr = [NSString stringWithFormat:@"Zip=%@", valStr.length==0?@"-":valStr];
    
    valStr = [AppUtils getObjectURL:str forKey:@"ListPrice=" finalDelim:@"&"];
    if( valStr.length > 0){
        valStr = [Utils formatMinMaxPrice:valStr];
    }
    NSString* aPriceStr = [NSString stringWithFormat:@"Price=%@", valStr.length==0?@"No Min-No Max":valStr];
    
    valStr = [AppUtils getObjectURL:str forKey:@"Bedrooms=" finalDelim:@"&"];
    if( valStr.length > 0){
        valStr = [Utils formatMinMaxStr:valStr];
    }
    NSString* aBedStr = [NSString stringWithFormat:@"Bed=%@", valStr.length==0?@"No Min-No Max":valStr];
    
    valStr = [AppUtils getObjectURL:str forKey:@"FullBathrooms=" finalDelim:@"&"];
    if( valStr.length > 0){
        valStr = [Utils formatMinMaxStr:valStr];
    }
    NSString* aBathStr = [NSString stringWithFormat:@"Bath=%@", valStr.length==0?@"No Min-No Max":valStr];
    
	[lblText setText:[NSString stringWithFormat:@"%@ , %@ \r\n%@\r\n%@ , %@",aCityStr,aZipStr,aPriceStr,aBedStr,aBathStr]];
		
	[lblText setNumberOfLines:0];
	[lblText setFont:[UIFont boldSystemFontOfSize:12]];
	//[lblText setFont:[UIFont fontWithName:@"Helvetica" size:12]];
	//[lblText setFont:[UIFont systemFontOfSize:12]];
	[cell addSubview:lblText];
	[lblText release];
	
	UILabel *lblText2 = [[UILabel alloc]initWithFrame:CGRectMake(10, 55, 310, 20)];
	NSString *strDate = [NSString stringWithFormat:@"%@", [AppUtils getObjectURL:str forKey:@"    " finalDelim:@""]];
	[lblText2 setFont:[UIFont systemFontOfSize:11]];
	//[lblText2 sizeToFit];
	lblText2.text = strDate;
	[cell addSubview:lblText2];
 	[lblText2 release];
	
	
	UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(270, 20, 38, 32)];
	imgView.image = [UIImage imageNamed:@"Picture1_right.png"];
	[cell addSubview:imgView];
	[imgView release];
	
	return cell;
	
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSString *str = [arrData objectAtIndex:indexPath.row];
    NSString *astr = [NSString stringWithFormat:@"%@", [AppUtils getObjectURL:str forKey:@"origurl=" finalDelim:@"    "]];
	//NSString *str = @"City-HollisterState-CASqFt-250:5000,Price-100000:4000000,Bed-0.900000:5.100000,Bath-0.900000:5.100000,Zip---sort-ListPrice,sort_direction-ASC,Status-Status=A\nFri/Jan 21, 2011 13:41";
	appDelegate.isSearchTab = NO;
	
	//appDelegate.isSearchMap = YES;
    [mTgr8SearchHistory setCurrentSelectedURL:astr];
    
	[appDelegate propertiesFromServer:astr];
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)propertiesFromServer:(NSString*)options
{
	[appDelegate showActivityViewer];
	//NSString* urlStr=[NSString stringWithFormat:@"http://getyouridx.agentstorm.com/properties.xml?apikey=%@&limit=20&sort=ListPrice&sort_direction=DESC&Bedrooms=2+&FullBaths=2+",self.API_KEY];
	NSString* urlStr;

}



-(void) propertiesCallback:(id)document delegate:(id)delegate{
	
		
	[appDelegate performDismiss:0];

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
