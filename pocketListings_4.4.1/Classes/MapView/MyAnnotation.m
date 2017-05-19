//
//  MyAnnotation.m
//  CustomCalloutMapView
//
//  Created by Kaustubh
//

#import "MyAnnotation.h"
#import "MapViewController.h"

@implementation MyAnnotation

@synthesize coordinate, name, title, description, address, listingId;
@synthesize propertyData;
@synthesize mapController,imageURL;
/*
- (id) initWithCoords:(CLLocationCoordinate2D) coords name:(NSString*) inputName {
	
	self = [super init];
	if (self != nil) {
		coordinate = coords;
		self.name = inputName;
		self.title = inputName;
	}
	return self;
	
}*/

-(id) initWithCoordiateAndDetails:(CLLocationCoordinate2D)location address:(NSString*)aAddress 
						  details:(NSString*)details propertyData:(id)aPropertyData mapController:(MapViewController*)aController{
	if (self = [super init]) {
        coordinate = location;
		self.address = aAddress;
		self.description = details;
		self.propertyData = aPropertyData;
		self.mapController = aController;
}
    return self;
}


- (NSString *)title{
	return self.address; //KC-15Feb-8.1
	//return @"";
}

- (NSString *)subtitle{
	return self.description;//KC-15Feb-8.1
	//return @""; 
}

- (void)drawRect:(CGRect)rect {
}

- (void) showPD{
	//NSLog(@"sPD - MyAnn");
	//MapViewController *map = [[MapViewController alloc]init];
	//map = (MapViewController*)self.mapController;
	[mapController showPropertyDetails:propertyData];
}

- (void) showPropertyDetails{
	[mapController showPropertyDetails:propertyData];
}

- (void)dealloc {
	[address release];
	[description release];
	[propertyData release];
	[super dealloc];
}

@end
