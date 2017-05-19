//
//  MapViewController.m
//  retsClient
//
//  Created by Indroniel Deb Roy on 8/15/09.
//  Copyright 2009 mtgr8 Systems Inc.. All rights reserved.
//

#import "MapViewController.h"
#import "CurrentLocationAnnotation.h"
#import "mTgr8-PropertyDetailViewController.h"
#import "SearchResultController.h"
#import "AppUtils.h"
#import "Photo.h"
#import "TouchView.h"
#import "MyAnnotationView.h"
#import "MoreInfoView.h"
#import "NSDataAdditions.h"
#import "mTgr8Favorites.h"
#import "mTgr8SearchHistory.h"


@implementation MapViewController
@synthesize propertyData, operationQueue;
@synthesize mapView;
@synthesize annotations;
@synthesize segmentedControl, activityView, moreInfoView, annot, touchView, busyIndicator, arrMapData,currentRegion;
NSString *const GMAP_ANNOTATION_SELECTED = @"gmapselected";
BOOL isSpan;


// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
        operationQueue = [NSOperationQueue new];
    }
    return self;
}

- (id)initWithNibNameAndProperties:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
                   currentLocation:(CLLocationCoordinate2D)alocation latitudeDelta:(double)latDelta longitudeDelta:(double)longDelta
                      propertyData:(id)aPropertyData {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        location = alocation;
        latitudeDelta = latDelta;
        longitudeDelta = longDelta;
        self.propertyData = aPropertyData;
        self.annotations = [[NSMutableArray alloc] init];
        mapView.delegate = self;
        mapView.showsUserLocation = YES;
    }
    return self;
}

- (void)showCurrentLocation:(CLLocation*)currentLocation {
    if ( currentLocation != nil){
        MKCoordinateRegion reg;
        reg.center = currentLocation.coordinate;

        MKCoordinateSpan span;
        span.latitudeDelta = 0.01; // Change these values to change the zoom
        span.longitudeDelta = 0.01;
        reg.span = span;

        [self.mapView setRegion:reg animated:YES];
    } else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                message:@"Location Services Disabled\n"
                                "To enable, go to your device Settings > Location Services > pocketListings"
                delegate:self
                cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alert show];
    }
}

-(void)copyRegion:(MKCoordinateRegion)fromRegion toRegion:(MKCoordinateRegion)toRegion{
    toRegion.center.latitude = fromRegion.center.latitude;
    toRegion.center.longitude = fromRegion.center.longitude;
    toRegion.span.latitudeDelta = fromRegion.span.latitudeDelta;
    toRegion.span.longitudeDelta = fromRegion.span.longitudeDelta;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

    appDelegate = (pocketListingsAppDelegate *) [[UIApplication sharedApplication] delegate];
//    currentRegion = appDelegate.region;
    [self copyRegion:appDelegate.region toRegion:currentRegion];

    //self.navigationItem.hidesBackButton = YES;

    self.annotations = [[NSMutableArray alloc] init];

    arrCoordinateLat = [[NSMutableArray alloc] init];
    arrCoordinateLon = [[NSMutableArray alloc] init];
    arrMapData = [[NSMutableArray alloc] init];

    touchView = [[TouchView alloc] initWithFrame:CGRectMake(0, 0, 320, 373)];
    touchView.delegate = self;
    touchView.callAtHitTest = @selector(stopFollowLocation);

    self.mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, 320, 373)];
    [self.mapView setDelegate:self];
    [touchView addSubview:mapView];
    [self.view addSubview:touchView];

//	btnLoadMore = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 30.0)];
//	[btnLoadMore setBackgroundColor:[UIColor blackColor]];
//	[btnLoadMore addTarget:self action:@selector(LoadMore:) forControlEvents:UIControlEventTouchUpInside];
//	[btnLoadMore setAlpha:0.5];
//
//	[btnLoadMore setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
//	[self.view addSubview:btnLoadMore];

    btnSearchRegion = [UIButton buttonWithType:UIButtonTypeRoundedRect];//[[UIButton alloc] initWithFrame:CGRectMake(60, 330, 200, 30.0)];
    btnSearchRegion.frame = CGRectMake(100, 330, 130, 30);
    [btnSearchRegion setBackgroundColor:[UIColor clearColor]];
    [btnSearchRegion setBackgroundImage:[UIImage imageNamed:@"search_button_blue_fill.png"] forState:UIControlStateNormal];
//    [btnSearchRegion setTitle:@"Redo Search here" forState:UIControlStateNormal];
    [btnSearchRegion setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnSearchRegion addTarget:self action:@selector(searchInMapRegion) forControlEvents:UIControlEventTouchUpInside];
    [btnSearchRegion setAlpha:0.8];
//    [btnLoadMore setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [btnSearchRegion setHidden:YES];
    [self.view addSubview:btnSearchRegion];

    isLoadFirst = YES;
    mapView.showsUserLocation = YES;

    [self refreshView];
}

- (void)refreshView {
    NSArray *segmentTextContent = [NSArray arrayWithObjects:@"MAP", @"LIST", nil];
    segmentedControl = [[UISegmentedControl alloc] initWithItems:segmentTextContent];
    segmentedControl.selectedSegmentIndex = 0;
    segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    segmentedControl.frame = CGRectMake(0, 0, 100, 31);
    [segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];

    UIBarButtonItem *item = [[[UIBarButtonItem alloc] initWithCustomView:segmentedControl] autorelease];
    self.navigationItem.leftBarButtonItem = item;


    UISegmentedControl *rsegmentedControl = [[UISegmentedControl alloc] initWithItems:nil];
    [rsegmentedControl insertSegmentWithImage:[UIImage imageNamed:@"playback_play_white_16.png"] atIndex:0 animated:YES];
    [rsegmentedControl insertSegmentWithImage:[UIImage imageNamed:@"target_white_16.png"] atIndex:1 animated:YES];
    rsegmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    rsegmentedControl.frame = CGRectMake(0, 0, 90, 30);
    [rsegmentedControl setMomentary:YES];
    [rsegmentedControl addTarget:self action:@selector(rightSegmentAction:) forControlEvents:UIControlEventValueChanged];

    // Check if this is the first and / or the last page in order to enable or disable the back / forward button.
//    if ([recipesArray count] == 1) {
//            [segmentedControl setEnabled:NO forSegmentAtIndex:0];
//            [segmentedControl setEnabled:NO forSegmentAtIndex:1];
//    } else if ([currentIndex intValue] == 0) {
//            [segmentedControl setEnabled:NO forSegmentAtIndex:0];
//    } else if ([currentIndex intValue]+1 == [recipesArray count]) {
//            [segmentedControl setEnabled:NO forSegmentAtIndex:1];
//    }

    // Initialize a bar button item with the segmented control as custom view and assign it to the right bar button item.
    UIBarButtonItem *barButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:rsegmentedControl] autorelease];
    self.navigationItem.rightBarButtonItem = barButtonItem;

    [rsegmentedControl release];

    propertyData = nil;
    if (appDelegate.isFavoriteMap) {
        propertyData = appDelegate.arrFavorite;
        arrMapData = appDelegate.arrFavorite;
        self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(shareOptions)] autorelease];
//		btnLoadMore.hidden = TRUE;
        [self calculateSpan:YES];
    }
    else {
        propertyData = appDelegate.arrSearchResult;
        arrMapData = appDelegate.arrSearchResult;

        [self calculateSpan:NO];

//		UIImageView *imgAgent = [[UIImageView alloc]init];


//		if(appDelegate.imgData > 0)
//		{
//			imgAgent.image = [UIImage imageWithData:appDelegate.imgData];
//		}
//		else {
//			imgAgent.image = [UIImage imageNamed:@"agent_image_notavailable.png"];
//		}
//        imgAgent.image = [UIImage imageNamed:@"compass.jpg"];
//
//
//		[imgAgent setContentMode:UIViewContentModeScaleAspectFit];
//		[imgAgent setFrame:CGRectMake(0, 0, 30, 30)];
//
//		UIButton * btnAgent = [UIButton buttonWithType:UIButtonTypeCustom];
//		[btnAgent setFrame:CGRectMake(0, 0, 30, 30)];
//		[btnAgent addSubview:imgAgent];
//        [btnAgent addTarget:self action:@selector(showCurrentLocation) forControlEvents:UIControlEventTouchUpInside];
//		[imgAgent release];
//		self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btnAgent];
    }



    mailSubject = [[NSMutableString alloc] init];
    mailBody = [[NSMutableString alloc] init];
    sendImgURL = [[NSMutableString alloc] init];

    defaults = [NSUserDefaults standardUserDefaults];

}

- (void)searchInMapRegion {
    CGRect rect = mapView.frame;
    rect.size.width = rect.size.width;
    rect.size.height = rect.size.height;
    appDelegate.region = [mapView convertRect:rect toRegionFromView:mapView];

//    CGRect rect1 = [mapView convertRegion:appDelegate.region toRectToView:mapView];

    appDelegate.isRegionSearch = YES;
    appDelegate.offset = 20;
    [self propertiesForRegion:appDelegate.region];
}


- (void)showActivityViewer {

    actionSheet = [[UIActionSheet alloc] initWithTitle:@"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];

    [actionSheet setAlpha:0.3];
    [actionSheet showInView:appDelegate.window];
    [actionSheet setBounds:CGRectMake(0, 0, 0, 0)];
    [self mapLoadIndicatorON];
}

- (void)performDismiss:(NSTimer *)timer {
    [activityView stopAnimating];
    [actionSheet dismissWithClickedButtonIndex:0 animated:NO];
    [actionSheet removeFromSuperview];
}


- (void)setData {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    NSString *str = @"";
    if (appDelegate.isFavoriteMap) {
        str = [NSString stringWithFormat:@"Results (%d)", appDelegate.arrFavorite.count];
    }
    else {
        if ([appDelegate.totalProperties intValue] == 0){
            str = [NSString stringWithFormat:@"(0-0/0)"];
        }
        else if ([appDelegate.totalProperties intValue] > appDelegate.offset) {
            str = [NSString stringWithFormat:@"(1-%i/%@)", appDelegate.offset, appDelegate.totalProperties];
        }
        else {
            str = [NSString stringWithFormat:@"(1-%i/%@)", [appDelegate.totalProperties intValue], appDelegate.totalProperties];
        }
//		str = [NSString stringWithFormat:@"Results is here (%@)", appDelegate.totalProperties];
    }

    UIFont *font = [UIFont fontWithName:@"Helvetica" size:18.0f];
    CGRect frame = CGRectMake(0, 0, [str sizeWithFont:font].width, 44);
    UILabel *label = [[[UILabel alloc] initWithFrame:frame] autorelease];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = UITextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.text = str;
    self.navigationItem.titleView = label;


    if (self.propertyData) {
        [self makeAnnotationData:propertyData];

    }

    [mapView addAnnotations:self.annotations];

//	NSString *showMore;
//	if([appDelegate.totalProperties intValue] > 0)
//	{
//		if([appDelegate.totalProperties intValue] > appDelegate.offset)
//		{
//			showMore = [NSString stringWithFormat:@"(1-%i of %@) Load More...",appDelegate.offset,appDelegate.totalProperties];
//		}
//		else
//		{
//			showMore = [NSString stringWithFormat:@"(1-%i of %@)",[appDelegate.totalProperties intValue],appDelegate.totalProperties];
//		}
//        [btnLoadMore setHidden:FALSE];
//		[btnLoadMore setTitle:showMore forState:UIControlStateNormal];
//		[btnLoadMore setEnabled:TRUE];
//
//	}
//	if(appDelegate.offset >= [appDelegate.totalProperties intValue])
//	{
////		[btnLoadMore setEnabled:FALSE];
//        [btnLoadMore setHidden:TRUE];
//	}


    self.moreInfoView.frame = CGRectMake(20.0, 30.0 - 500.0, self.moreInfoView.frame.size.width, self.moreInfoView.frame.size.height);
    [self.touchView addSubview:self.moreInfoView];
//	[self performDismiss:0];
    [appDelegate performDismiss:0];

    [pool drain];
}

- (void)calculateSpan:(BOOL)newRegion {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    Property *annotPropertyData;
    CLLocationCoordinate2D coordinate;
    MKCoordinateRegion lregion;
    if (appDelegate.region.center.latitude == 0 || !appDelegate.isRegionSearch || newRegion) {
    CLLocationDegrees minLatitude = -90, maxLatitude = 90, minLongitude = -180, maxLongitude = 180;
    for (int d = 0; d < [arrMapData count]; d++) {
        annotPropertyData = [arrMapData objectAtIndex:d];
        NSString *latitudeString = [annotPropertyData.latitude_var stringValue];
        latitudeString = latitudeString != nil ? latitudeString : @"--";

        NSString *longitudeString = [annotPropertyData.longitude_var stringValue];
        longitudeString = longitudeString != nil ? longitudeString : @"--";


        if ([latitudeString isEqualToString:@"--"] || [longitudeString isEqualToString:@"--"] || [latitudeString isEqualToString:@"0"] || [longitudeString isEqualToString:@"0"]) {
            // do nothin ....
        }
        else {
            coordinate.latitude = [latitudeString floatValue];
            coordinate.longitude = [longitudeString floatValue];

            if (minLatitude == -90 && maxLatitude == 90) {
                minLatitude = coordinate.latitude;
                maxLatitude = coordinate.latitude;
            } else {
                if (coordinate.latitude <= minLatitude) {
                    minLatitude = coordinate.latitude;
                } else {
                    if (coordinate.latitude >= maxLatitude) {
                        maxLatitude = coordinate.latitude;
                    }
                }
            }

            if (minLongitude == -180 && maxLongitude == 180) {
                minLongitude = coordinate.longitude;
                maxLongitude = coordinate.longitude;
            } else {
                if (coordinate.longitude <= minLongitude) {
                    minLongitude = coordinate.longitude;
                } else {
                    if (coordinate.longitude >= maxLongitude) {
                        maxLongitude = coordinate.longitude;
                    }
                }
            }


            [arrCoordinateLat addObject:latitudeString];
            [arrCoordinateLon addObject:longitudeString];
        }

    }
    isSpan = YES;

        CLLocation *nearest = [[[CLLocation alloc] initWithLatitude:minLatitude longitude:minLongitude] autorelease];
        CLLocation *farthest = [[[CLLocation alloc] initWithLatitude:maxLatitude longitude:maxLongitude] autorelease];
        float distance = [nearest distanceFromLocation:farthest];


        lregion.center.latitude = (nearest.coordinate.latitude + farthest.coordinate.latitude) / 2.0;
        lregion.center.longitude = (nearest.coordinate.longitude + farthest.coordinate.longitude) / 2.0;
        lregion.span.latitudeDelta = distance / 111319.5;
        lregion.span.longitudeDelta = 0.0;
    } else {
        lregion = appDelegate.region;
    }

    [self.mapView setRegion:lregion animated:YES];

    [self.mapView regionThatFits:lregion];

    [self setData];

    [pool drain];

}


- (void)mapLoadIndicatorON {
    CGRect frame1 = CGRectMake(150.0f, 140.0f, 30.0f, 30.0f);
    activityView = [[[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge] initWithFrame:frame1] autorelease];//MemLeak3
    activityView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:activityView];
    [activityView startAnimating];
}

- (void)viewDidAppear:(BOOL)animated {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    //[activityView stopAnimating];
    [super viewDidAppear:animated];
}

- (void)rightSegmentAction:(id)sender {
    UISegmentedControl *segCtl = sender;
    //NSLog(@"segment clicked %d", [segCtl selectedSegmentIndex]);

    if ([segCtl selectedSegmentIndex] == 0) {
        if ( !appDelegate.isAgtListing){
            [self LoadMore:sender];
        }
    } else if ([segCtl selectedSegmentIndex] == 1) {
        [appDelegate getCurrentLocationAndCallback:self callback:@selector(showCurrentLocation:)];
    }

}

- (void)segmentAction:(id)sender {
    UISegmentedControl *segCtl = sender;
    //NSLog(@"segment clicked %d", [segCtl selectedSegmentIndex]);

    if ([segCtl selectedSegmentIndex] == 1) {
        if (appDelegate.isFavoriteMap) {
            mTgr8Favorites *objmTgr8Favorites = [[mTgr8Favorites alloc] initWithNibName:@"mTgr8Favorites" bundle:nil];
            [self.navigationController pushViewController:objmTgr8Favorites animated:NO];
            [objmTgr8Favorites release];
        }
        else {
            SearchResultController *objSearchResultController = [[SearchResultController alloc] initWithNibName:@"SearchResultController" bundle:nil];
            objSearchResultController.reData = propertyData;
            [self.navigationController pushViewController:objSearchResultController animated:NO];
            [objSearchResultController release];
        }


    }

}


- (void)viewWillAppear:(BOOL)animated {

    //self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    [segmentedControl canBecomeFirstResponder];
    segmentedControl.selectedSegmentIndex = 0;
    [super viewWillAppear:animated];
}

- (IBAction)listView:(id)sender {
    SearchResultController *wrController = [[SearchResultController alloc] initWithNibName:@"SearchResultController" bundle:nil];
    wrController.reData = self.propertyData;
    [self.navigationController pushViewController:wrController animated:YES];
    [wrController release];

}

- (NSString *)getDescriptionString:(Property *)annotPropertyData {
    NSString *fBath = annotPropertyData.fullBathrooms_var;
    fBath = fBath != nil ? fBath : @"--";
    NSString *hBath = annotPropertyData.halfBathrooms_var;
    hBath = hBath != nil ? hBath : @"--";
    NSString *bed = annotPropertyData.bedrooms_var;
    bed = bed != nil ? bed : @"--";

    NSString *propertySubtype = annotPropertyData.exteriorFeatures_var;
    propertySubtype = propertySubtype != nil ? propertySubtype : @"--";

    NSString *listPrice = annotPropertyData.listPrice_var;
    listPrice = listPrice != nil ? listPrice : @"--";

    NSNumberFormatter *numberFormatter = [[[NSNumberFormatter alloc] init] autorelease];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    //[numberFormatter setAllowsFloats:NO];
    [numberFormatter setMaximumFractionDigits:0];
    NSNumber *price = [NSNumber numberWithInteger:[listPrice intValue]];

    //If you print next thing
    listPrice = [NSString stringWithFormat:@"%@", [numberFormatter stringForObjectValue:price]];

    NSString *strSqFT;
    if (annotPropertyData.sqFt_var != nil)
        strSqFT = [NSString stringWithFormat:@"%@ sq.ft.", annotPropertyData.sqFt_var];
    else {
        strSqFT = @"-- sq.ft.";
    }

    NSString *sendDetails = [NSString stringWithFormat:@"%@\n%@\n%@ %@",
                                                       listPrice, [NSString stringWithFormat:@"%@ Bed/(%@F,%@H) Bath", bed, fBath, hBath], strSqFT, propertySubtype];
    return sendDetails;
}

- (void)makeAnnotationDataForPropery:(Property *)annotPropertyData {
    NSString *addressStr = annotPropertyData.fullAddress_var;
    addressStr = addressStr != nil ? addressStr : @"--";

    NSString *sendDetails = [self getDescriptionString:annotPropertyData];
    NSString *description = sendDetails;

    NSString *latitudeString = [annotPropertyData.latitude_var stringValue];
    latitudeString = latitudeString != nil ? latitudeString : @"--";

    NSString *longitudeString = [annotPropertyData.longitude_var stringValue];
    longitudeString = longitudeString != nil ? longitudeString : @"--";
    CLLocationCoordinate2D coordinate;

    if ([latitudeString isEqualToString:@"--"] || [longitudeString isEqualToString:@"--"] || [latitudeString isEqualToString:@"0"] || [longitudeString isEqualToString:@"0"]) {
//		coordinate = [appDelegate getPropCoordinate:annotPropertyData];
    }
    else {
        NSNumber *latitude = [XMLUtil getNumberFromString:latitudeString];
        NSNumber *longitude = [XMLUtil getNumberFromString:longitudeString];
        coordinate.latitude = [latitude doubleValue];
        coordinate.longitude = [longitude doubleValue];
    }

    MyAnnotation *myAnn = [[[MyAnnotation alloc] initWithCoordiateAndDetails:coordinate address:(NSString *) addressStr details:description propertyData:annotPropertyData mapController:self] autorelease];

    NSMutableArray *arrImage = nil;//[[[NSMutableArray alloc]init]autorelease];
    arrImage = annotPropertyData.photos_var.photo_var;
    Photo *objPhoto = nil;//[Photo alloc];
    //NSLog(@"arrImage: 0");
    if (arrImage.count > 0) {
        objPhoto = [arrImage objectAtIndex:0];
    }
    myAnn.imageURL = objPhoto.url_var;
    //[self.annotations addObject:aPAnn];

    [self.annotations addObject:myAnn];
//    [mapView addAnnotation:myAnn];


}

- (void)makeAnnotationData:(id)aPropertyData {
    if ([[self propertyData] isKindOfClass:[NSArray class]]) {
        for (int i = 0; i < [[self propertyData] count]; i++) {
            //ResidentialPropertyType* aPropertyData = [self.propertyData objectAtIndex:i];
            //NSLog(@"propertyData: %i",i);
            Property *annotPropertyData = [self.propertyData objectAtIndex:i];

            [self makeAnnotationDataForPropery:annotPropertyData];
        }
    }
}


- (void)viewWillDisappear:(BOOL)animated {

    [self hideAnnotation];
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [segmentedControl release];
    [mapView release];
    [propertyData release];
    [annotations release];
    [super dealloc];
}

- (void)stopFollowLocation {
    //NSLog(@"stopFollowLocation called.");

    MyAnnotation *annotation;
    for (annotation in mapView.selectedAnnotations) {
        [mapView deselectAnnotation:annotation animated:NO];
    }

    [self hideAnnotation];

}

- (void)showAnnotation:(MyAnnotation *)annot {

    //self.moreInfoView.text.text = annotation.title;
    self.moreInfoView.alpha = 1.0;
    self.moreInfoView.titleLabel.text = self.annot.title;//KC-16Feb.
    self.moreInfoView.subTitleLabel.text = self.annot.description;//KC-16Feb.


    busyIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(35, 35, 30, 30)];
    busyIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    busyIndicator.hidesWhenStopped = TRUE;
    [busyIndicator startAnimating];
    [self.moreInfoView addSubview:(UIView *) busyIndicator];

    [UIView beginAnimations:@"moveCNGCallout" context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    self.moreInfoView.frame = CGRectMake(20.0, 30.0, self.moreInfoView.frame.size.width, self.moreInfoView.frame.size.height);
    //imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.annot.imageURL]]];
    [NSThread detachNewThreadSelector:@selector(loadImg:) toTarget:self withObject:self.annot.imageURL];
    //[self loadImg:self.annot.imageURL];
    [UIView commitAnimations];

}


- (void)hideAnnotation {
    self.moreInfoView.text.text = nil;
    [UIView beginAnimations:@"moveCNGCalloutOff" context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];//KC- jlt
    self.moreInfoView.frame = CGRectMake(10.0, 30.0 - 500.0, self.moreInfoView.frame.size.width, self.moreInfoView.frame.size.height);

    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(2.0, 2.0, 90.0, 96.0)];
    UIImage *loadingImage = [UIImage imageNamed:@"loadingimage.png"];
    [imageView setImage:(UIImage *) loadingImage];
    [self.moreInfoView addSubview:(UIView *) imageView];

    [UIView commitAnimations];
}


- (void)loadImg:(NSString *)link {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    NSString *urlString = link;//[XMLUtil getXMLStringValue:@"//Location" inNode:[document rootElement]];
    urlString = urlString != nil ? [urlString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] : @"";
    NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
    if (imgData > 0) {
        [imageView setImage:[UIImage imageWithData:imgData]];
    }
    else {
        [imageView setImage:[UIImage imageNamed:@"imagenotavail.png"]];
    }

    //NSLog(@"Image URL ------- : %@ ",urlString);
    [self.busyIndicator stopAnimating];
    [[AppUtils getAppDelegate] performDismiss:0];
    [pool drain];
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        ((MKUserLocation *) annotation).title = @"My Current Location";
        return nil;  //return nil to use default blue dot view
    }

    MKPinAnnotationView *pinView = nil;
    pinView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pinview"] autorelease];

    if (nil == pinView) {
        pinView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pinview"] autorelease];
    }

    [pinView addObserver:self
              forKeyPath:@"selected"
                 options:NSKeyValueObservingOptionNew
                 context:GMAP_ANNOTATION_SELECTED];

    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *customButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setFrame:CGRectMake(240.0, 15.0, 62.0, 62.0)];
    [customButton setFrame:CGRectMake(0, 0, 286, 109)];
    UIImage *indicatorImage = [UIImage imageNamed:@"disclosure.png"];
    [rightButton setImage:(UIImage *) indicatorImage forState:UIControlStateNormal];
    [customButton addTarget:self action:@selector(showDetailView) forControlEvents:UIControlEventTouchUpInside];
    [self.moreInfoView addSubview:rightButton];
    [self.moreInfoView addSubview:customButton];
    //annotationView = pinView;
    pinView.animatesDrop = YES;
    pinView.userInteractionEnabled = TRUE;
    pinView.canShowCallout = NO;

    if ([annotation isKindOfClass:[CurrentLocationAnnotation class]]) {
        [pinView setEnabled:NO];
    }
    Property *propData = ((MyAnnotation *) annotation).propertyData;
    NSString *trimmedString = [propData.status_var stringByTrimmingCharactersInSet:
            [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([trimmedString rangeOfString:@"Active"].location == NSNotFound) {
        [pinView setPinColor:MKPinAnnotationColorRed];
    } else {
        [pinView setPinColor:MKPinAnnotationColorGreen];
    }

    return pinView;

}

- (void)showDetailView {
    mTgr8_PropertyDetailViewController *wrController = [[mTgr8_PropertyDetailViewController alloc] initWithNibName:@"mTgr8-PropertyDetailViewController" bundle:nil];
    wrController.objProperty = propertyData;
    [self.navigationController pushViewController:wrController animated:YES];
    [wrController release];

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    if ([touch view] == moreInfoView) {
        moreInfoView.alpha = 0.5;
        mTgr8_PropertyDetailViewController *wrController = [[mTgr8_PropertyDetailViewController alloc] initWithNibName:@"mTgr8-PropertyDetailViewController" bundle:nil];
        wrController.objProperty = propertyData;
        [self.navigationController pushViewController:wrController animated:YES];
        [wrController release];
    }
}


- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {

    NSString *action = (NSString *) context;


    if ([action isEqualToString:GMAP_ANNOTATION_SELECTED]) {
        BOOL annotationAppeared = [[change valueForKey:@"new"] boolValue];
        if (annotationAppeared) {
            self.annot = ((MyAnnotationView *) object).annotation;
            propertyData = self.annot.propertyData;
            [self showAnnotation:((MyAnnotationView *) object).annotation];
        }
        else {
            [self hideAnnotation];
        }
    }
}

- (void)selectAnnotation:(id <MKAnnotation>)annotation animated:(BOOL)animated {
    //MKAnnotationView* annotationView = [self mapView:self viewForAnnotation:annotation];
    //	annotationView.leftCalloutAccessoryView = [self imageViewforListing:[annotation listingID]];
}


- (void)showPropertyDetails:(id)aPropertyData {
    mTgr8_PropertyDetailViewController *wrController = [[mTgr8_PropertyDetailViewController alloc] initWithNibName:@"mTgr8-PropertyDetailViewController" bundle:nil];
    wrController.objProperty = aPropertyData;
    [self.navigationController pushViewController:wrController animated:YES];
    [wrController release];
}


- (void)shareOptions {
    UIActionSheet *action = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Send To Friend", [NSString stringWithFormat:@"Send To %@", appDelegate.agentFirstName], nil];
    [action showFromTabBar:appDelegate.tabController.tabBar];
    [action release];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        mailTo = @"";
        //mailSubject = [NSString stringWithFormat:@"MLS# %@", objProperty.listingId_var];
        mailBody = [[NSMutableString alloc] init];
        [self prepareBody:buttonIndex];
        mailBody = [NSMutableString stringWithFormat:@"I would like to share following Listings:<br/><br/>%@%@", mailBody, [appDelegate getStandardEmailFooter]];

        [self sendMail];

    }
    else if (buttonIndex == 1) {
        mailTo = appDelegate.agentEmail;
        //mailSubject = [NSString stringWithFormat:@"MLS# %@",listingID];
        //mailBody = [NSString stringWithFormat:@"I am interested in learning more details about this listing: %@",listingAdd];

        mailBody = [[NSMutableString alloc] init];
        [self prepareBody:buttonIndex];
        mailBody = [NSMutableString stringWithFormat:@"I am interested in learning more details about following listings:<br/><br/>%@<br/><br/>%@", mailBody, [appDelegate getStandardEmailFooter]];

        [self sendMail];

    }
}

//- (void) prepareBody:(NSInteger)buttonIndex
//{
//	for(int p = 0; p < appDelegate.arrFavorite.count; p++)
//	{
//		//Property *objProperty = [[Property alloc]init];
//		Property *objProperty = nil;//[Property alloc]; //01/07
//		objProperty = [appDelegate.arrFavorite objectAtIndex:p];
//		
//		NSString *fullAdd = objProperty.fullAddress_var;
//		fullAdd = fullAdd!=nil?fullAdd:@"";
//		
//		NSString* city  = objProperty.city_var;
//        //		city = [appDelegate cityName:city];
//		city = city!=nil?city:@"";
//		NSString *stateOrProvince=objProperty.state_var;
//		stateOrProvince = stateOrProvince!=nil?stateOrProvince:@"";
//		NSString *postalCode=objProperty.zip_var;
//		postalCode = postalCode!=nil?postalCode:@"";
//		
//		
//		NSString *fBath = objProperty.fullBathrooms_var;
//		fBath = fBath!=nil?fBath:@"--";
//		NSString *hBath = objProperty.halfBathrooms_var;
//		hBath = hBath!=nil?hBath:@"--";
//		NSString *bed = objProperty.bedrooms_var;
//		bed = bed!=nil?bed:@"--";
//		
//		NSString* propertySubtype  = objProperty.exteriorFeatures_var;
//		propertySubtype = propertySubtype!=nil?propertySubtype:@"--";
//		
//		NSString *strSqFT;
//		if(objProperty.sqFt_var != nil)
//			strSqFT = [NSString stringWithFormat:@"%@ sq.ft.", objProperty.sqFt_var];
//		else {
//			strSqFT = @"-- sq.ft.";
//		}
//        
//        NSString* fburl=[NSString stringWithFormat:@"http://spreadyourbrand.com/fbsearch/fbprint.php?id=%@&mtag=%@",objProperty.listingId_var,[appDelegate.agentData mTag_var]];
//        NSString* moreDetails=[NSString stringWithFormat:@"<a href='%@'>More Details...</a>",fburl];
//		
//		NSMutableString *sendDetails = [NSString stringWithFormat:@"MLS# %@<br/>%@<br/>%@<br/>$%@<br/>%@ %@<br/>%@<br/>%@",objProperty.listingId_var,fullAdd,
//                                        [NSString stringWithFormat:@"%@ %@ %@",city,stateOrProvince,postalCode],objProperty.listPrice_var
//                                        ,[NSString stringWithFormat:@"%@ Bed/(%@F,%@H) Bath", bed,fBath,hBath],strSqFT,propertySubtype,moreDetails];
//        
//		NSString *strNotes = [defaults objectForKey:objProperty.listingId_var];
//		
//        
//        if(strNotes.length > 2)
//        {
//            [mailBody appendFormat:@"%i) %@<br/><br/>Notes:%@<br/><br/><br/>",p+1,sendDetails,strNotes];
//        }
//        else
//        {
//            [mailBody appendFormat:@"%i) %@<br/><br/><br/>",p+1,sendDetails];
//        }
//		
//	}
//}

- (void)prepareBody:(NSInteger)buttonIndex {
    for (int p = 0; p < arrMapData.count; p++) {
        Property *objPro = nil;//[[[Property alloc]init]autorelease];
        objPro = [arrMapData objectAtIndex:p];

        NSString *fullAdd = objPro.fullAddress_var;
        fullAdd = fullAdd != nil ? fullAdd : @"";

        NSString *city = objPro.city_var;
        //		city = [appDelegate cityName:city];
        city = city != nil ? city : @"";
        NSString *stateOrProvince = objPro.state_var;
        stateOrProvince = stateOrProvince != nil ? stateOrProvince : @"";
        NSString *postalCode = objPro.zip_var;
        postalCode = postalCode != nil ? postalCode : @"";


        NSString *fBath = objPro.fullBathrooms_var;
        fBath = fBath != nil ? fBath : @"--";
        NSString *hBath = objPro.halfBathrooms_var;
        hBath = hBath != nil ? hBath : @"--";
        NSString *bed = objPro.bedrooms_var;
        bed = bed != nil ? bed : @"--";

        NSString *propertySubtype = objPro.style_var;
        propertySubtype = propertySubtype != nil ? propertySubtype : @"--";

        NSString *strSqFT;
        if (objPro.sqFt_var != nil)
            strSqFT = [NSString stringWithFormat:@"%@ sq.ft.", objPro.sqFt_var];
        else {
            strSqFT = @"-- sq.ft.";
        }

        NSString *fburl = [NSString stringWithFormat:@"http://spreadyourbrand.com/fbsearch/fbprint.php?id=%@&mtag=%@", objPro.listingId_var, [appDelegate.agentData mTag_var]];
        NSString *moreDetails = [NSString stringWithFormat:@"<a href='%@'>More Details...</a>", fburl];

        NSMutableString *sendDetails = [NSString stringWithFormat:@"MLS# %@<br/>%@<br/>%@<br/>$%@<br/>%@ %@<br/>%@<br/>%@", objPro.listingId_var, fullAdd,
                                                                  [NSString stringWithFormat:@"%@ %@ %@", city, stateOrProvince, postalCode], objPro.listPrice_var
                , [NSString stringWithFormat:@"%@ Bed/(%@F,%@H) Bath", bed, fBath, hBath], strSqFT, propertySubtype, moreDetails];

        NSString *strNotes = [defaults objectForKey:objPro.listingId_var];


        if (strNotes.length > 2) {
            [mailBody appendFormat:@"%i) %@<br/><br/>Notes:%@<br/><br/><br/>", p + 1, sendDetails, strNotes];
        }
        else {
            [mailBody appendFormat:@"%i) %@<br/><br/><br/>", p + 1, sendDetails];
        }

    }
}

- (void)sendMail {
    //[mailSubject appendFormat:@"My Favorites"];

    mailSubject = [NSMutableString stringWithFormat:@"My Favorites"];

    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *composeVC = [[MFMailComposeViewController alloc] init];
        composeVC.mailComposeDelegate = self;
        [composeVC setSubject:mailSubject];

        if (![mailTo isEqualToString:@""]) {
            NSArray *arrTo = [NSArray arrayWithObject:mailTo];
            [composeVC setToRecipients:arrTo];
        }

        [composeVC setMessageBody:mailBody isHTML:YES];
        [self presentModalViewController:composeVC animated:YES];
        [composeVC release];
        [self dismissModalViewControllerAnimated:YES];
    }
    else {
        UIAlertView *progressAlert = [[UIAlertView alloc] initWithTitle:@""
                                                                message:@"Could not find an application to e-mail. Please configure."
                                                               delegate:self
                                                      cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [progressAlert show];
        [progressAlert release];
    }

}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self dismissModalViewControllerAnimated:YES];

}

- (IBAction)LoadMore:(id)sender {
    isLoadFirst = NO;

    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;

    [self propertiesFromServer];

}

- (void)propertiesForRegion:(MKCoordinateRegion)region {

//    [self showActivityViewer];
    NSString *urlStr = [NSString stringWithFormat:@"%@?apikey=%@&offset=0&limit=20%@%@&%@%@", appDelegate.searchURL, appDelegate.API_KEY, [appDelegate getSortingBy], [appDelegate getSortingDirection], [appDelegate getListingStatus], [appDelegate getRegionSearchURLString:region]];

    urlStr = [urlStr stringByReplacingOccurrencesOfString:@"+" withString:@"%2B" options:NSBackwardsSearch range:NSMakeRange(0, [urlStr length])];
    urlStr = [urlStr stringByReplacingOccurrencesOfString:@" " withString:@"%20" options:NSBackwardsSearch range:NSMakeRange(0, [urlStr length])];

    [appDelegate startTimeOut];
    [appDelegate showActivityViewer2];

    NSLog([NSString stringWithFormat:@"%@", urlStr]);
    //this will remove from local and appDelegate.arrSearchResults
    [arrMapData removeAllObjects];

    NSURL *serviceURL = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:serviceURL];

    [urlRequest setHTTPMethod:@"GET"];
    [urlRequest addValue:@"iPhone" forHTTPHeaderField:@"User-Agent"];
    [urlRequest addValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
    [urlRequest addValue:@"gzip,deflate" forHTTPHeaderField:@"Accepts-Encoding"];
    [urlRequest addValue:@"GET" forHTTPHeaderField:@"Method"];
    [urlRequest addValue:@"*/*" forHTTPHeaderField:@"Accept"];

    [AppUtils requestServer:urlRequest resultTarget:self targetFunction:@selector(propertiesRegionCallback:delegate:)];

}

- (void)mapView:(MKMapView *)lmapView regionWillChangeAnimated:(BOOL)animated {
    if (!appDelegate.isFavoriteMap && !appDelegate.isAgtListing) {
        if (currentRegion.center.latitude != 0) {
            [btnSearchRegion setHidden:NO];
        }
    }
}

- (void)mapView:(MKMapView *)lmapView regionDidChangeAnimated:(BOOL)animated {
    currentRegion = [lmapView convertRect:lmapView.frame toRegionFromView:lmapView];
}

- (void)propertiesFromServer {

//	[self showActivityViewer];
//    [btnLoadMore setEnabled:FALSE];
    NSString *urlStr;
    [appDelegate showActivityViewer2];

    if (appDelegate.isHistory) {
        urlStr = [NSString stringWithFormat:@"%@?offset=%i&%@", appDelegate.searchURL, appDelegate.offset, [mTgr8SearchHistory currentSelectedURL]];
    }
    else {
        if (appDelegate.isRegionSearch) {
            urlStr = [NSString stringWithFormat:@"%@?apikey=%@&offset=%i&limit=20%@%@&%@%@", appDelegate.searchURL, appDelegate.API_KEY, appDelegate.offset, [appDelegate getSortingBy], [appDelegate getSortingDirection], [appDelegate getListingStatus], [appDelegate getRegionSearchURLString:appDelegate.region]];
        } else {
            urlStr = [NSString stringWithFormat:@"%@?apikey=%@&offset=%i&limit=20%@%@&%@%@", appDelegate.searchURL, appDelegate.API_KEY, appDelegate.offset, [appDelegate getSortingBy], [appDelegate getSortingDirection], [appDelegate getListingStatus], [appDelegate getCompleteSearchURLString]];
        }
    }
    urlStr = [urlStr stringByReplacingOccurrencesOfString:@"+" withString:@"%2B" options:NSBackwardsSearch range:NSMakeRange(0, [urlStr length])];
    urlStr = [urlStr stringByReplacingOccurrencesOfString:@" " withString:@"%20" options:NSBackwardsSearch range:NSMakeRange(0, [urlStr length])];

    [appDelegate startTimeOut];

    NSURL *serviceURL = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:serviceURL];

    [urlRequest setHTTPMethod:@"GET"];
    [urlRequest addValue:@"iPhone" forHTTPHeaderField:@"User-Agent"];
    [urlRequest addValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
    [urlRequest addValue:@"gzip,deflate" forHTTPHeaderField:@"Accepts-Encoding"];
    [urlRequest addValue:@"GET" forHTTPHeaderField:@"Method"];
    [urlRequest addValue:@"*/*" forHTTPHeaderField:@"Accept"];

    [AppUtils requestServer:urlRequest resultTarget:self targetFunction:@selector(propertiesCallback:delegate:)];
}

- (void)propertiesCallback:(id)document delegate:(id)delegate {

    if (!appDelegate.isTimeOut) {
        [appDelegate invalidTimer];

//        NSMutableArray *tempArray = [[[NSMutableArray alloc] init] autorelease];

        if (delegate != nil) {
            [document retain];
            [delegate retain];
//            [arrMapData removeAllObjects];
            Properties *properties = [[[Properties alloc] initWithXML:[document rootElement]] autorelease];
            //reData = properties;
            for (int i = 0; i < properties.property_var.count; i++) {
                id aI = [[properties property_var] objectAtIndex:i];
                [arrMapData addObject:aI];
//                [appDelegate.arrSearchResult addObject:aI];
            }

//            arrMapData = tempArray;
            self.propertyData = arrMapData;
            appDelegate.offset = appDelegate.offset + 20;
            [self setData];
        }
    }
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [appDelegate performDismiss2:0];
//    [btnLoadMore setEnabled:TRUE];
}

- (void)propertiesRegionCallback:(id)document delegate:(id)delegate {

    if (!appDelegate.isTimeOut) {
        [appDelegate invalidTimer];
        [btnSearchRegion setHidden:YES];

        appDelegate.totalProperties = [[XMLUtil getXMLStringValue:@"@totalcount" inNode:[document rootElement]] retain];

        //reset so that everything is freash
//        [appDelegate.arrSearchResult removeAllObjects];

        [mapView removeAnnotations:self.annotations];
        [self.annotations removeAllObjects];

//        NSMutableArray *tempArray = [[[NSMutableArray alloc] init] autorelease];

        if (delegate != nil) {
            [document retain];
            [delegate retain];
//            [arrMapData removeAllObjects];
            Properties *properties = [[[Properties alloc] initWithXML:[document rootElement]] autorelease];
            //reData = properties;
            for (int i = 0; i < properties.property_var.count; i++) {
                id aI = [[properties property_var] objectAtIndex:i];
                [arrMapData addObject:aI];
//                [appDelegate.arrSearchResult addObject:aI];
            }

//            arrMapData = tempArray;
            self.propertyData = arrMapData;
//			appDelegate.offset = appDelegate.offset+20;
            [self setData];
        }
    }
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [appDelegate performDismiss2:0];
}


@end
