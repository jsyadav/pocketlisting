//
//  SchoolDetail.m
//  pocketListings
//
//  Created by Developer mTgr8 on 9/14/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "SchoolDetail.h"
#import "webViewController.h"
#import "AppUtils.h"


@implementation SchoolDetail
@synthesize schoolData;
@synthesize schoolName,schoolPartsCell,schoolType,schoolDistrictName,studentTeacherRatio,addressCell,apyScore,apiResult,url,gradeLevel,gradeServed,enrollment,phone,address,cityStateZip,webAddress,scoresCell,otherInfoCell,fullAddress;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
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
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    
    NSString* schoolName = [NSString stringWithFormat:@"%@",[schoolData objectForKey:@"schoolname"]];
    NSString* schooldistName = [NSString stringWithFormat:@"%@",[schoolData objectForKey:@"schooldistrictname"]];
    NSString* gradeLevel = [NSString stringWithFormat:@"Grade Level:%@",[schoolData objectForKey:@"gradelevel"]];
    NSString* type = [NSString stringWithFormat:@"School Type:%@",[schoolData objectForKey:@"schooltype"]];
    NSString* gradeServed = [NSString stringWithFormat:@"Grade:%@ | %@",[schoolData objectForKey:@"gradesserved"],[schoolData objectForKey:@"schooltype"]];
    
//    NSString* apiScore = [NSString stringWithFormat:@"API Growth:%@",[[schoolData objectForKey:@"APIGrowth"] objectForKey:@"total"]];
    NSString* enrollment = [NSString stringWithFormat:@"Total Enrolled:%@",[[schoolData objectForKey:@"enrollment"] objectForKey:@"total"]];
    NSString* stuTchRatio = [NSString stringWithFormat:@"Student Teacher Ratio:%@",[[schoolData objectForKey:@"studentteacherratio"] objectForKey:@"total"]];
    NSString* phone = [NSString stringWithFormat:@"Phone:%@",[schoolData objectForKey:@"phonenumber"]];
    NSString* url = [NSString stringWithFormat:@"%@",[schoolData objectForKey:@"url"]];
    NSString* apires = [NSString stringWithFormat:@"APY Result:%@",[schoolData objectForKey:@"AYPResult"]];
    
    NSString* address = [NSString stringWithFormat:@"%@",[schoolData objectForKey:@"address"]];
    NSString* cityStateZip = [NSString stringWithFormat:@"%@ %@ %@",[schoolData objectForKey:@"city"],[schoolData objectForKey:@"state"],[schoolData objectForKey:@"zip"]];
    id str = [schoolData objectForKey:@"website"];
    NSString* webaddress = [NSString stringWithFormat:@"%@",str == NSNull.null?@"":[schoolData objectForKey:@"website"]];
    
//    NSString* apiScore = [NSString stringWithFormat:@"%@",[[schoolData objectForKey:@"APIGrowth"] objectForKey:@"total"]];
//    NSString* apiYear = [NSString stringWithFormat:@"%@",[schoolData objectForKey:@"APIGrowthYear"]];
//    
//    NSString* ayp = [NSString stringWithFormat:@"%@",[schoolData objectForKey:@"AYPResult"]];
//    NSString* aypYear = [NSString stringWithFormat:@"%@",[schoolData objectForKey:@"AYPResultYear"]];
    
    NSString* apiScore =[self getInnerValue:@"APIGrowth" key:@"total" formatString:@"%@"]; 
    NSString* apiYear = [self getValue:@"APIGrowthYear" formatString:@" %@ \n"]; 
    
    NSString* ayp = [self getValue:@"AYPResult" formatString:@"%@"];
    NSString* aypYear = [self getValue:@"AYPResultYear" formatString:@" %@ \n"];
    
    
    self.fullAddress.text = [NSString stringWithFormat:@"%@ \r\n%@ \r\n%@ \r\n%@",address,cityStateZip,phone,webaddress];
    self.schoolName.text = schoolName;
    self.gradeLevel.text = gradeLevel;
    self.gradeServed.text = gradeServed;
    
    
    self.apyScore.text = [NSString stringWithFormat:@"AYP:%@/%@",ayp,aypYear];
    self.schoolDistrictName.text = schooldistName;
    self.enrollment.text = enrollment;
    self.studentTeacherRatio.text = stuTchRatio;
//    self.phone.text = phone;
    self.apiResult.text = [NSString stringWithFormat:@"API:%@/%@",apiScore,apiYear];
    self.schoolType.text = type;
    NSString* urlStr = [NSString stringWithFormat:@"See more information on %@ from Education.com",schoolName];
    [self.url loadHTMLString:[NSString stringWithFormat:@"<a href=%@>See more information on %@ from Education.com</a>",url,schoolName] baseURL:nil]; 
//    self.address.text=address;
//    self.cityStateZip.text = cityStateZip;
    self.webAddress.text = urlStr;
    
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


-(NSString*) getValue:(NSString*)key formatString:(NSString*)formatString{
    id ret = [schoolData objectForKey:key];
    if( ret == [NSNull null]){        
        return @"";
    }else if([ret isKindOfClass:[NSString class]]){
        if([ret length] == 0){
            return @"";
        }
    }
    return [NSString stringWithFormat:formatString,ret];
}

-(NSString*) getInnerValue:(NSString*)outkey key:(NSString*)key formatString:(NSString*)formatString{
    id ret = [[schoolData objectForKey:outkey] objectForKey:key];
    if( ret == [NSNull null]){        
        return @"";
    }else if([ret isKindOfClass:[NSString class]]){
        if([ret length] == 0){
            return @"";
        }
    }
    return [NSString stringWithFormat:formatString,ret];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([[self nameForSection:indexPath.section] isEqual:@"School Details"]){
        return schoolPartsCell;
    }else if([[self nameForSection:indexPath.section] isEqual:@"Address"]){
        return addressCell;
    }else if([[self nameForSection:indexPath.section] isEqual:@"Test Scores"]){
        return scoresCell;
    }else if([[self nameForSection:indexPath.section] isEqual:@"Other Information"]){
        return otherInfoCell;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
		if(section == 0)
		{
			return @"School Details";
		}
        else if(section == 1)
		{
			return @"Address";
		}else if(section == 2)
		{
			return @"Test Scores";
		}else if(section == 3)
		{
			return @"Other Information";
		}
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if([[self nameForSection:indexPath.section] isEqual:@"School Details"]){
		return 100;
	}
	
	if([[self nameForSection:indexPath.section] isEqual:@"Address"]){
		return 100;
	}
    
    if([[self nameForSection:indexPath.section] isEqual:@"Test Scores"]){
		return 60;
	}
    if([[self nameForSection:indexPath.section] isEqual:@"Other Information"]){
		return 270;
	}
}

- (NSString *)nameForSection:(NSInteger)section
{
	
	if(section == 0){
        return @"School Details";
    }else if( section == 1){
        return @"Address";
    }else if( section == 2){
        return @"Test Scores";
    }else if( section == 3){
        return @"Other Information";
    }
    return @"";
}

- (IBAction)goToEducationSite:(id)sender
{
    NSString* strUrl = [NSString stringWithFormat:@"%@",[schoolData objectForKey:@"url"]];
    NSURL *url=[NSURL URLWithString:strUrl];
    //NSLog(@"Direction URL -%@",urltext);
    
    if (![[UIApplication sharedApplication]openURL:url])
    {
        NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
        UIAlertView *progressAlert = [[[UIAlertView alloc] initWithTitle:@""
                                                                 message:@"Please try again later"
                                                                delegate: self
                                                       cancelButtonTitle: nil
                                                       otherButtonTitles: @"Ok",nil] autorelease];
        [progressAlert show];
        [pool drain];
        
    }
    
//    webViewController *objWebViewController = [[webViewController alloc] initWithNibName:@"webViewController" bundle:nil];
//    
//	[self.navigationController pushViewController:objWebViewController animated:YES];
//    [[objWebViewController webView] loadRequest:[NSURLRequest requestWithURL:url]];
//    [[AppUtils getAppDelegate] showActivityViewer];
//	[objWebViewController release];
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
