//
//  PropertyAnnotation.h
//  retsClient
//
//  Created by Indroniel Deb Roy on 8/15/09.
//  Copyright 2009 mtgr8 Systems Inc.. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "MapViewController.h"


@interface PropertyAnnotation : NSObject <MKAnnotation>{
	CLLocationCoordinate2D coordinate;
	NSString* address;
	NSString* description;
	id propertyData;
	NSString* listingID;
	NSString* imageURL;
	MapViewController* mapController;
}
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) 	NSString* address;
@property (nonatomic, retain) 	NSString* description;
@property (nonatomic, retain) 	id propertyData;
@property (nonatomic, retain)   NSString* listingID;
@property (nonatomic, retain)   NSString* imageURL;
@property (nonatomic, assign)   MapViewController* mapController;

-(id) initWithCoordiateAndDeatils:(CLLocationCoordinate2D)location address:(NSString*)aAddress details:(NSString*)details propertyData:(id)aPropertyData mapController:(MapViewController*)aController;
- (NSString *)title;
- (NSString *)subtitle;
- (void) showPropertyDetails;

@end
