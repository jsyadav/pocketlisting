//
//  MyAnnotation.h
//  CustomCalloutMapView
//
//  Created by Kaustubh
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
//#import "MapViewController.h"
@class MapViewController;

@interface MyAnnotation : NSObject<MKAnnotation> {

	CLLocationCoordinate2D coordinate;
	NSString *name;
	NSString *title;
	NSString* address;
	NSString* description;
	id propertyData;
	NSString* listingId;
	MapViewController* mapController;
	NSString* imageURL;
}	


@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic,retain) NSString *name;
@property (nonatomic,retain) NSString *title;
@property (nonatomic, retain) 	id propertyData;
@property (nonatomic,retain) NSString* address;
@property (nonatomic,retain) NSString* description;
@property (nonatomic, retain) NSString* listingId;
@property (nonatomic, retain) NSString* imageURL;
@property (nonatomic, retain) MapViewController* mapController;
//- (id) initWithCoords:(CLLocationCoordinate2D) coords name:(NSString*) inputName;
-(id) initWithCoordiateAndDetails:(CLLocationCoordinate2D)location address:(NSString*)aAddress details:(NSString*)details propertyData:(id)aPropertyData mapController:(MapViewController*)aController;
- (NSString *)title;
- (NSString *)subtitle;
- (void) showPD;
- (void) showPropertyDetails;
@end
