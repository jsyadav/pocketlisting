//
//  mTgr8-PropertyDetailViewController.h
//  idx
//
//  Created by Kaustubh Chavan on 24/08/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Property.h"
#import <MessageUI/MessageUI.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKReverseGeocoder.h>
#import <MapKit/MKAnnotation.h>


@interface AddressAnnotation : NSObject<MKAnnotation> {
	CLLocationCoordinate2D coordinate;
	
	NSString *mTitle;
	NSString *mSubTitle;
}

@end

@class pocketListingsAppDelegate,PageViewController,TouchView,SchoolAnnotation,MoreInfoView;
@interface mTgr8_PropertyDetailViewController : UIViewController<MKMapViewDelegate,UIActionSheetDelegate,MFMailComposeViewControllerDelegate> {
	
	pocketListingsAppDelegate *appDelegate;
	
	IBOutlet UITableView* tableView;
	
	IBOutlet UITableViewCell *block1Cell;
	IBOutlet UITableViewCell *remarkCell;
	IBOutlet UITableViewCell *areaCell;
	IBOutlet UITableViewCell *areaMoreCell;
	IBOutlet UITableViewCell *schoolsCell;
	IBOutlet UITableViewCell *schoolsMoreCell;
	IBOutlet UITableViewCell *listingDetailsCell;
	IBOutlet UITableViewCell *listingDetailsMoreCell;
	IBOutlet UITableViewCell *otherCell;
	IBOutlet UITableViewCell *otherMoreCell;
	IBOutlet UITableViewCell *pictureCell;
	IBOutlet UITableViewCell *mapCell;
	IBOutlet UITableViewCell *sendToFriendCell;
	IBOutlet UITableViewCell *notesCell;
	IBOutlet UITableViewCell *notesMoreCell;
	IBOutlet UITableViewCell *detailsCell;
	IBOutlet UITableViewCell *disclaimerCell;
	IBOutlet UITableViewCell *walkScoreCell;
	IBOutlet UITableViewCell *myPhotoCell;
    IBOutlet UITableViewCell *openHouseCell;
    IBOutlet UITableViewCell *openHouseEmptyCell;
    IBOutlet UIWebView *openHouseView;
	
	IBOutlet UIWebView *webViewWalkScore;
	
	IBOutlet UIImageView *imgPrimary;
	IBOutlet UILabel *lblPrice;
	IBOutlet UILabel *lblHomeType;
	IBOutlet UILabel *lblBedBath;
	IBOutlet UILabel *lblSqft;
	
	IBOutlet UILabel *lblAddress;
	IBOutlet UILabel *lblCityState;
	IBOutlet UILabel *lblAgent;
	IBOutlet UILabel *lblMLSNo;
	
	IBOutlet UITextView *txtRemarks;
	
	IBOutlet UILabel *lblSubdivision;
	IBOutlet UILabel *lblCounty;
	IBOutlet UILabel *lblCountry;
	IBOutlet UILabel *lblLotSize;
	
	IBOutlet UITextView *txtSchools;
	IBOutlet UILabel *lblEmentarySchool;
	IBOutlet UILabel *lblMiddleOrJuniorSchool;
	IBOutlet UILabel *lblHighSchool;
	
	IBOutlet UILabel *lblListingID;
	IBOutlet UILabel *lblListingDate;
	IBOutlet UILabel *lblAgentAndOfficeDetail;
	IBOutlet UILabel *lblIsShortSale;
	IBOutlet UILabel *lblIsForeclosure;
	
	IBOutlet UITextView *txtOther;
	IBOutlet UILabel *lblYrBuilt;
	IBOutlet UILabel *lblWaterLoc;
	IBOutlet UILabel *lblGarage;
	IBOutlet UILabel *lblAssociationFee;
	IBOutlet UILabel *lblDisclosures;
	
	IBOutlet UILabel *lblStatus;
	IBOutlet UILabel *lblStyle;
	IBOutlet UILabel *lblZoning;
	IBOutlet UILabel *lblZoningLabel;
	IBOutlet UILabel *lblCountyLabel;
	
	IBOutlet UIButton *btnContact;
	IBOutlet UIButton *btnScheduleVisit;
	IBOutlet UIButton *btnSendToFriend;
    
    IBOutlet UIWebView *txtMoreDetails;
	
	BOOL isAreaExpanded;
	BOOL isSchoolsExpanded;
	BOOL isListingDetailsExpanded;
	BOOL isOtherExpanded;
	BOOL isNotesExpanded;
	
	BOOL isSchoolHide;
	BOOL isDiscription;
	BOOL isNotesHide;
	BOOL isPictureHide;
	
	Property *objProperty;
	
	NSMutableArray *arrImgData;
	
	IBOutlet UIScrollView *scrollView;
	IBOutlet UIPageControl *pageControl;
	
	PageViewController *currentPage;
	PageViewController *nextPage;
	
	IBOutlet UIActivityIndicatorView *activityIndicator;
	IBOutlet UIActivityIndicatorView *activityMain;
	
	IBOutlet UIWebView *webView;
	
	IBOutlet UIButton *btnDriveHere;
	
	NSUserDefaults *defaults;
	
	BOOL isAdded;
	
	UIImageView *btnImg;
	UIButton * btnFav;

	NSString *sendDetails;
	NSMutableString *sendImgURL;
	
	IBOutlet UIView *viewNotes;
	IBOutlet UITextView *txtNotes;
	IBOutlet UIButton *btnSave;
	IBOutlet UIButton *btnCancel;
	
	id propertyData;
	UIActionSheet *actionSheet;
	
	IBOutlet UIWebView *webViewDisclaim;
	
	NSString *strWalkScore;
	NSString *strWalkDesc;
	
	CLLocationCoordinate2D propCoordinate;
	
	IBOutlet UIButton *btnWalkScore;
	
	IBOutlet UIButton *btnCalculateMortgage;
	
	IBOutlet UISegmentedControl *segmentedControl;
	
	IBOutlet TouchView* touchView;
	IBOutlet MKMapView *mapView;
	
	//MKMapView *mapView;
	MKReverseGeocoder *geoCoder;
	MKPlacemark *mPlacemark;
	
	IBOutlet UISegmentedControl *mapTypeSegment;
	
	AddressAnnotation *addAnnotation;
	
	IBOutlet UIImageView *imgNotAv;
    
    SchoolAnnotation* annot;
    IBOutlet MoreInfoView* moreInfoView;
	
}

@property(nonatomic, retain) IBOutlet UITableView* tableView;

@property (nonatomic, retain) IBOutlet UITableViewCell *block1Cell;
@property (nonatomic, retain) IBOutlet UITableViewCell *remarkCell;
@property (nonatomic, retain) IBOutlet UITableViewCell *areaCell;
@property (nonatomic, retain) IBOutlet UITableViewCell *areaMoreCell;
@property (nonatomic, retain) IBOutlet UITableViewCell *schoolsCell;
@property (nonatomic, retain) IBOutlet UITableViewCell *schoolsMoreCell;
@property (nonatomic, retain) IBOutlet UITableViewCell *listingDetailsCell;
@property (nonatomic, retain) IBOutlet UITableViewCell *listingDetailsMoreCell;
@property (nonatomic, retain) IBOutlet UITableViewCell *otherCell;
@property (nonatomic, retain) IBOutlet UITableViewCell *otherMoreCell;
@property (nonatomic, retain) IBOutlet UITableViewCell *pictureCell;
@property (nonatomic, retain) IBOutlet UITableViewCell *sendToFriendCell;
@property (nonatomic, retain) IBOutlet UITableViewCell *detailsCell;
@property (nonatomic, retain) IBOutlet UITableViewCell *disclaimerCell;
@property (nonatomic, retain) IBOutlet UITableViewCell *myPhotoCell;

@property (nonatomic, readwrite) BOOL isAreaExpanded;
@property (nonatomic, readwrite) BOOL isSchoolsExpanded;
@property (nonatomic, readwrite) BOOL isListingDetailsExpanded;
@property (nonatomic, readwrite) BOOL isOtherExpanded;
@property (nonatomic, readwrite) BOOL isNotesHide;

@property (nonatomic,retain) Property *objProperty;
@property (nonatomic, retain) NSString *sendDetails;
@property(nonatomic, retain) id propertyData;
@property(nonatomic, retain) IBOutlet UILabel *lblZoning;

@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) TouchView* touchView;

@property (nonatomic, retain) SchoolAnnotation* annot;
@property (nonatomic, retain ) MoreInfoView* moreInfoView;

- (NSString *)nameForSection:(NSInteger)section;
- (void)applyNewIndex:(NSInteger)newIndex pageController:(PageViewController *)pageController;
- (IBAction)changePage:(id)sender;

- (IBAction)Contact:(id)sender;
- (IBAction)ScheduleVisit:(id)sender;
- (IBAction)DriveHere:(id)sender;
- (IBAction)SendToFriend:(id)sender;
- (IBAction)SaveNote:(id)sender;
- (IBAction)CancelNote:(id)sender;

- (void)CancelAction;
- (void) detailActionsheetShow;
- (void) fillData;

- (void) getWalkScore;
- (IBAction)WalkScore:(id)sender;
- (CLLocationCoordinate2D) getPropCoordinate:(id)propData;

- (IBAction)CalculateMortgage:(id)sender;
- (void)segmentAction:(id)sender;
- (void)mapType:(id)sender;

- (IBAction)toggleDetails:(id)sender;
-(id)getDetailsString:(BOOL)linesOnly;
-(id)getOpenHouseString:(BOOL)linesOnly;
-(void) schoolsCallBack:(id)resObject delegate:(id)delegate;
- (IBAction) schoolDetails:(id)sender;

+(NSString*) formatOpenHouseShowTime:(NSString*)startTime endTime:(NSString*)endTime;


@end
