//
//  SearchResultController.h
//  retsClient
//
//  Created by Indroniel Deb Roy on 8/10/09.
//  Copyright 2009 mtgr8 Systems Inc.. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Property.h"
#import "Properties.h"

@class PropertiesData,SearchCell,pocketListingsAppDelegate;
@interface SearchResultController : UIViewController {
    //	NSMutableDictionary* searchItems;
	Properties* reData;
	pocketListingsAppDelegate *appDelegate;
	
	IBOutlet UITableView* tblView;
    
    //UVT - 20Feb - <8.2>
    UILabel *resultsTitle;
    UILabel *resultsCount;
    IBOutlet UITableViewCell* termsCell;
	IBOutlet UITableViewCell* showMoreCell;
    IBOutlet UIButton* showMoreHomesButton; 
    
    //UVT - 25feb - <8.1>
    NSMutableArray *listItems;
	NSInteger pageNumber;
	NSString* pageNumberStr;
	NSMutableArray *tempList;
	Property *objPropertiesData;
	NSInteger offset;
	//NSMutableArray *arrIMGData;
	UISegmentedControl *segmentedControl;
}

@property (nonatomic,retain) Properties* reData;
@property (nonatomic,retain) IBOutlet UITableView *tblView;

//UVT - 20Feb - <8.2>
@property (nonatomic, retain) UILabel *resultsTitle;
@property (nonatomic, retain) UILabel *resultsCount;
@property(nonatomic,retain) NSMutableArray *listItems;
@property(nonatomic,retain) IBOutlet UITableViewCell* termsCell;
@property(nonatomic,retain) IBOutlet UITableViewCell* showMoreCell;
@property(nonatomic,retain) NSString* pageNumberStr;
@property(nonatomic,retain) IBOutlet UIButton* showMoreHomesButton; 
@property(nonatomic,retain) NSMutableArray *tempList;
@property(nonatomic, readwrite) NSInteger offset;
//@property(nonatomic,retain) NSMutableArray *arrIMGData;

- (NSString *)nameForSection:(NSInteger)section;
- (id)itemForIndexPath:(NSIndexPath *)indexPath;
-(IBAction) viewMorePressed:(id)sender;
-(IBAction) termsButtonPressed:(id)sender;
//-(IBAction) selectCriteria:(id)sender;
//-(IBAction) fireContact:(id)sender;
-(IBAction) home:(id)sender;
//-(void)loadMapView;
//-(void)imageURLCallback:(id)document delegate:(id)delegate;
- (void) setData;
-(void)propertiesFromServer;
-(void) propertiesCallback:(id)document delegate:(id)delegate;
-(void)geoCodeProperties;
-(void)navigateToMapView;
@end
