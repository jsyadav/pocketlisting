//
//  MapViewUIDataController.m
//  MLS-R-App
//
//  Created by Kaustubh Chavan on 6/1/10.
//  Copyright 2010 Xoriant Corporation. All rights reserved.
//

#import "MapViewUIDataController.h"
#import "AppUtils.h"


@implementation MapViewUIDataController
@synthesize propertyData;

-(id) initWithPropertyData:(Property *)propData{
	self.propertyData = propData;
	return self;
}


- (NSString *) getPropAnotUIAddrData{
	//NSString* streetNumber = [XMLUtil getXMLStringValue:@"Listing/StreetAddress/StreetNumber" inNode:aPropertyData];
	NSString* streetNumber = propertyData.streetNumber_var;
	streetNumber = streetNumber!=nil?streetNumber:@"";
	//NSString* streetName = [XMLUtil getXMLStringValue:@"Listing/StreetAddress/StreetName" inNode:aPropertyData];
	NSString* streetName = propertyData.streetName_var;
	streetName = streetName!=nil?streetName:@"";
	//NSString* streetSuffix = [XMLUtil getXMLStringValue:@"Listing/StreetAddress/StreetSuffix" inNode:aPropertyData];
	NSString* streetSuffix =  propertyData.streetSuffix_var;
	streetSuffix = streetSuffix!=nil?streetSuffix:@"";
	
	//NSString* city  = [XMLUtil getXMLStringValue:@"Listing/StreetAddress/City" inNode:aPropertyData];
	NSString* city  = propertyData.city_var;
	city = city!=nil?city:@"NA";
	
	//NSString *stateOrProvince=[XMLUtil getXMLStringValue:@"Listing/StreetAddress/StateOrProvince" inNode:aPropertyData];
	//NSString *stateOrProvince=propertyData.listing.streetAddress.stateOrProvince;
	
	//stateOrProvince = stateOrProvince!=nil?stateOrProvince:@"NA";
	//NSString *postalCode=[XMLUtil getXMLStringValue:@"Listing/StreetAddress/PostalCode" inNode:aPropertyData];
	//NSString *postalCode=propertyData.zip_var;
	//postalCode = postalCode!=nil?postalCode:@"NA";
	
	NSString *addressStr = [NSString stringWithFormat:@"%@ %@ %@,%@,%@",streetNumber,streetName,streetSuffix,city];
	return addressStr;
	
}
- (NSString *) getPropAnotUIDetData{
	//NSString* listPrice= [XMLUtil getXMLStringValue:@"Listing/ListingData/ListPrice" inNode:aPropertyData];
	NSString* listPrice= [propertyData.listPrice_var stringValue];
	listPrice = listPrice!=nil?listPrice:@"NA";
	
	//NSString* bedrooms = [XMLUtil getXMLStringValue:@"Bedrooms" inNode:aPropertyData];
	NSString* bedroomsStr = propertyData.bedrooms_var;
	bedroomsStr = bedroomsStr!=nil?bedroomsStr:@"NA";
	
	NSString* bathrooms = propertyData.fullBathrooms_var;
	bathrooms = bathrooms!=nil?bathrooms:@"NA";
	
	NSString* description=[NSString stringWithFormat:@"$%@/ bd %@/ ba %@",[AppUtils formatPrice:listPrice] ,[AppUtils formatFloatStr:bedroomsStr],[AppUtils formatFloatStr:bathrooms]];
	return description;
	
	
}
- (NSString *) getPropAnotListingIdData{
	
	return propertyData.listingId_var;
}
- (NSString *) getPropAnotLatData{
	return [propertyData.latitude_var stringValue];
	
}
- (NSString *) getPropAnotLongData{
	return [propertyData.longitude_var stringValue];
}
@end
