//
//  mTgr8SearchSettingObject.h
//  MLS-R-App
//
//  Created by Developer mTgr8 on 10/3/09.
//  Copyright 2009 mTgr8 Inc.. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface mTgr8SearchSettingObject : NSObject {
	
	
	NSMutableArray* searchPropertyTypes;
	NSMutableArray* selectedPropertyTypes;
	
	NSMutableArray* startPriceOptions;
	NSString* selectedStartPrice;
	
	NSMutableArray* endPriceOptions;
	NSString* selectedEndPrice;
	
	NSMutableArray* minBedroomOptions;
	NSString* selectedMinBedroom;
	
	NSMutableArray* maxBedroomOptions;
	NSString* selectedMaxBedroom;
	
	NSMutableArray* minBathroomOptions;
	NSString* selectedMinBathroom;
	
	NSMutableArray* maxBathroomOptions;
	NSString* selectedMaxBathroom;
	
	NSMutableArray* minSquarefootageOptions;
	NSString* selectedMinSquarefootage;
	
	NSMutableArray* maxSquarefootageOptions;
	NSString* selectedMaxSquarefootage;
    
    NSString* selectedZipCode;
    NSString *City;
    NSString *State;
    NSString *streetName;
    
    NSUserDefaults *defaults;
}

@property (nonatomic, retain) NSMutableArray* searchPropertyTypes;
@property (nonatomic, retain) NSMutableArray* selectedPropertyTypes;

@property (nonatomic, retain) NSMutableArray* startPriceOptions;
@property (nonatomic, retain) NSString* selectedStartPrice;

@property (nonatomic, retain) NSMutableArray* endPriceOptions;
@property (nonatomic, retain) NSString* selectedEndPrice;

@property (nonatomic, retain) NSMutableArray* minBedroomOptions;
@property (nonatomic, retain) NSString* selectedMinBedroom;

@property (nonatomic, retain) NSMutableArray* maxBedroomOptions;
@property (nonatomic, retain) NSString* selectedMaxBedroom;

@property (nonatomic, retain) NSMutableArray* minBathroomOptions;
@property (nonatomic, retain) NSString* selectedMinBathroom;

@property (nonatomic, retain) NSMutableArray* maxBathroomOptions;
@property (nonatomic, retain) NSString* selectedMaxBathroom;

@property (nonatomic, retain) NSMutableArray* minSquarefootageOptions;
@property (nonatomic, retain) NSString* selectedMinSquarefootage;

@property (nonatomic, retain) NSMutableArray* maxSquarefootageOptions;
@property (nonatomic, retain) NSString* selectedMaxSquarefootage;
@property (nonatomic, retain) NSString* selectedZipCode;
@property (nonatomic, retain) NSString *City;
@property (nonatomic, retain) NSString *State;
@property (nonatomic, retain) NSString *streetName;


-(NSString*)getStringRespresentation:(NSArray*)props;
-(NSString*)getStringRespresentation:(NSString*)start end:(NSString*)end;
-(NSString*)getPropertType;
-(NSString*)getPriceRange;
-(NSString*)getBedrooms;
-(NSString*)getBathrooms;
-(NSString*)getSquareFootage;

@end
