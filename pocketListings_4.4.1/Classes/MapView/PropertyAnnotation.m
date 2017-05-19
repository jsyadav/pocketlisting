//
//  PropertyAnnotation.m
//  retsClient
//
//  Created by Indroniel Deb Roy on 8/15/09.
//  Copyright 2009 mtgr8 Systems Inc.. All rights reserved.
//

#import "PropertyAnnotation.h"


@implementation PropertyAnnotation
@synthesize coordinate;
@synthesize address;
@synthesize description;
@synthesize propertyData;
@synthesize mapController;
@synthesize listingID,imageURL;

-(id) initWithCoordiateAndDeatils:(CLLocationCoordinate2D)location address:(NSString*)aAddress 
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
	return self.description;
}

- (NSString *)subtitle{
	return self.address;
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
