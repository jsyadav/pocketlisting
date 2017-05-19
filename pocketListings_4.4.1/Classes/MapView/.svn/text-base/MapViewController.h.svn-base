//
//  MapViewController.h
//  retsClient
//
//  Created by Indroniel Deb Roy on 8/15/09.
//  Copyright 2009 mtgr8 Systems Inc.. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKReverseGeocoder.h>
#import <MessageUI/MessageUI.h>

@class pocketListingsAppDelegate, TouchView, MyAnnotation, MoreInfoView, Property;

@interface MapViewController : UIViewController <MKMapViewDelegate, UIActionSheetDelegate, MFMailComposeViewControllerDelegate> {
    MKMapView *mapView;
    CLLocationCoordinate2D location;
    double latitudeDelta;
    double longitudeDelta;

    id propertyData;
    NSMutableArray *annotations;
    UISegmentedControl *segmentedControl;
    UIActivityIndicatorView *activityView;

    pocketListingsAppDelegate *appDelegate;

    UIImageView *imageView;
    UIImageView *lView;
    UIActivityIndicatorView *busyIndicator;
    Property *objProperty;

    TouchView *touchView;
    MyAnnotation *annot;
    IBOutlet MoreInfoView *moreInfoView;

    NSMutableArray *arrCoordinateLat;
    NSMutableArray *arrCoordinateLon;
    NSMutableArray *arrMapData;

    UIActionSheet *actionSheet;

    NSString *mailTo;
    NSMutableString *mailSubject;
    NSMutableString *mailBody;
    NSMutableString *sendImgURL;

    NSUserDefaults *defaults;

    UIButton *btnLoadMore;

    NSInteger deltaValue;
    NSOperationQueue *operationQueue;


    BOOL isLoadFirst;

    UIButton *btnSearchRegion;

    MKCoordinateRegion currentRegion;
}

@property(nonatomic, retain) NSOperationQueue *operationQueue;

@property(nonatomic, retain) id propertyData;
@property(nonatomic, retain) NSMutableArray *annotations;
@property(nonatomic, retain) NSMutableArray *arrMapData;
@property(nonatomic, retain) MKMapView *mapView;
@property(nonatomic, retain) UISegmentedControl *segmentedControl;
@property(nonatomic, retain) UIActivityIndicatorView *activityView;
@property(retain) IBOutlet MoreInfoView *moreInfoView;
extern NSString *const GMAP_ANNOTATION_SELECTED;
@property(nonatomic, retain) MyAnnotation *annot;
@property(nonatomic, retain) TouchView *touchView;
@property(nonatomic, retain) UIActivityIndicatorView *busyIndicator;
@property (nonatomic,readwrite ) MKCoordinateRegion currentRegion;

- (id)initWithNibNameAndProperties:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
                   currentLocation:(CLLocationCoordinate2D)alocation latitudeDelta:(double)latDelta longitudeDelta:(double)longDelta
                      propertyData:(id)aPropertyData;

- (void)showPropertyDetails:(id)aPropertyData;

- (void)makeAnnotationData:(id)aPropertyData;

- (void)mapLoadIndicatorON;

- (void)hideAnnotation;

- (void)calculateSpan:(BOOL)newRegion;

- (void)setData;

- (void)showActivityViewer;

- (void)performDismiss:(NSTimer *)timer;

- (void)prepareBody:(NSInteger)buttonIndex;

- (void)sendMail;

- (void)refreshView;

- (IBAction)LoadMore:(id)sender;

- (void)propertiesFromServer;

- (void)makeAnnotationDataForPropery:(Property *)annotPropertyData;

- (NSString *)getDescriptionString:(Property *)annotPropertyData;

- (void)propertiesForRegion:(MKCoordinateRegion)region;
@end

