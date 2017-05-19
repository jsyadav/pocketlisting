//
//  mTgr8SearchSettingObject.m
//  MLS-R-App
//
//  Created by Developer mTgr8 on 10/3/09.
//  Copyright 2009 mTgr8 Inc.. All rights reserved.
//

#import "mTgr8SearchSettingObject.h"


@implementation mTgr8SearchSettingObject

@synthesize searchPropertyTypes;
@synthesize selectedPropertyTypes;
@synthesize startPriceOptions;
@synthesize selectedStartPrice;
@synthesize endPriceOptions;
@synthesize selectedEndPrice;
@synthesize minBedroomOptions;
@synthesize selectedMinBedroom;
@synthesize maxBedroomOptions;
@synthesize selectedMaxBedroom;
@synthesize minBathroomOptions;
@synthesize selectedMinBathroom;
@synthesize maxBathroomOptions;
@synthesize selectedMaxBathroom;
@synthesize minSquarefootageOptions;
@synthesize selectedMinSquarefootage;
@synthesize maxSquarefootageOptions;
@synthesize selectedMaxSquarefootage;
@synthesize selectedZipCode, City, State, streetName;

- (id)init { 
	if(self = [super init]){
        
        defaults = [NSUserDefaults standardUserDefaults];
        NSString *startPrice = [defaults stringForKey:@"startPrice"];
        NSString *endPrice = [defaults stringForKey:@"endPrice"];
        NSString *minBed = [defaults stringForKey:@"minBed"];
        NSString *maxBed = [defaults stringForKey:@"maxBed"];
        NSString *minBath = [defaults stringForKey:@"minBath"];
        NSString *maxBath = [defaults stringForKey:@"maxBath"];
		NSString *minSqFt = [defaults stringForKey:@"minSqFt"];
        NSString *maxSqFt = [defaults stringForKey:@"maxSqFt"];
        //NSString *zipCode = [defaults stringForKey:@"zipCode"];
        
		self.startPriceOptions = [[NSMutableArray alloc] init];
		[self.startPriceOptions addObject:@"No Min"];
		[self.startPriceOptions addObject:@"$50K"];
		[self.startPriceOptions addObject:@"$75K"];
		[self.startPriceOptions addObject:@"$100K"];
		[self.startPriceOptions addObject:@"$125K"];
		[self.startPriceOptions addObject:@"$150K"];
		[self.startPriceOptions addObject:@"$175K"];
		[self.startPriceOptions addObject:@"$200K"];
		[self.startPriceOptions addObject:@"$225K"];
		[self.startPriceOptions addObject:@"$250K"];
		[self.startPriceOptions addObject:@"$275K"];
		[self.startPriceOptions addObject:@"$300K"];
		[self.startPriceOptions addObject:@"$350K"];
		[self.startPriceOptions addObject:@"$400K"];
		[self.startPriceOptions addObject:@"$450K"];
		[self.startPriceOptions addObject:@"$500K"];
		[self.startPriceOptions addObject:@"$550K"];
		[self.startPriceOptions addObject:@"$600K"];
		[self.startPriceOptions addObject:@"$650K"];
		[self.startPriceOptions addObject:@"$700K"];
		[self.startPriceOptions addObject:@"$750K"];
		[self.startPriceOptions addObject:@"$800K"];
		[self.startPriceOptions addObject:@"$850K"];
		[self.startPriceOptions addObject:@"$900K"];
		[self.startPriceOptions addObject:@"$1M"];
		[self.startPriceOptions addObject:@"$1.2M"];
		[self.startPriceOptions addObject:@"$1.4M"];
		[self.startPriceOptions addObject:@"$1.6M"];
		[self.startPriceOptions addObject:@"$1.8M"];
		[self.startPriceOptions addObject:@"$2M"];
		[self.startPriceOptions addObject:@"$2.5M"];
		[self.startPriceOptions addObject:@"$3M"];
		[self.startPriceOptions addObject:@"$4M"];
		[self.startPriceOptions addObject:@"$5M"];
        //[self.startPriceOptions addObject:@"$1.5M"];
        //[self.startPriceOptions addObject:@"$2M"];
        
        if(startPrice==nil)
        {
            self.selectedStartPrice = [self.startPriceOptions objectAtIndex:0];
            [defaults setObject:self.selectedStartPrice forKey:@"startPrice"];
			[defaults setObject:self.selectedStartPrice forKey:@"tempMinPrice"];
        }
        else
        {
            self.selectedStartPrice = startPrice;
			[defaults setObject:startPrice forKey:@"tempMinPrice"];
        }
            
		
		self.endPriceOptions = [[NSMutableArray alloc] init];
		[self.endPriceOptions addObject:@"No Max"];
		[self.endPriceOptions addObject:@"$50K"];
		[self.endPriceOptions addObject:@"$75K"];
		[self.endPriceOptions addObject:@"$100K"];
		[self.endPriceOptions addObject:@"$125K"];
		[self.endPriceOptions addObject:@"$150K"];
		[self.endPriceOptions addObject:@"$175K"];
		[self.endPriceOptions addObject:@"$200K"];
		[self.endPriceOptions addObject:@"$225K"];
		[self.endPriceOptions addObject:@"$250K"];
		[self.endPriceOptions addObject:@"$275K"];
		[self.endPriceOptions addObject:@"$300K"];
		[self.endPriceOptions addObject:@"$350K"];
		[self.endPriceOptions addObject:@"$400K"];
		[self.endPriceOptions addObject:@"$450K"];
		[self.endPriceOptions addObject:@"$500K"];
		[self.endPriceOptions addObject:@"$550K"];
		[self.endPriceOptions addObject:@"$600K"];
		[self.endPriceOptions addObject:@"$650K"];
		[self.endPriceOptions addObject:@"$700K"];
		[self.endPriceOptions addObject:@"$750K"];
		[self.endPriceOptions addObject:@"$800K"];
		[self.endPriceOptions addObject:@"$850K"];
		[self.endPriceOptions addObject:@"$900K"];
		[self.endPriceOptions addObject:@"$1M"];
		[self.endPriceOptions addObject:@"$1.2M"];
		[self.endPriceOptions addObject:@"$1.4M"];
		[self.endPriceOptions addObject:@"$1.6M"];
		[self.endPriceOptions addObject:@"$1.8M"];
		[self.endPriceOptions addObject:@"$2M"];
		[self.endPriceOptions addObject:@"$2.5M"];
		[self.endPriceOptions addObject:@"$3M"];
		[self.endPriceOptions addObject:@"$4M"];
		[self.endPriceOptions addObject:@"$5M+"];
        //[self.endPriceOptions addObject:@"$1.5M"];
        //[self.endPriceOptions addObject:@"$2M"];
        
        if(endPrice==nil)
		{
            self.selectedEndPrice = [self.endPriceOptions objectAtIndex:0];
            [defaults setObject:self.selectedEndPrice forKey:@"endPrice"];
			[defaults setObject:self.selectedEndPrice forKey:@"tempMaxPrice"];
        }
        else
        {
            self.selectedEndPrice = endPrice;
			[defaults setObject:endPrice forKey:@"tempMaxPrice"];
        }
		
		self.minBedroomOptions = [[NSMutableArray alloc] init];
		[self.minBedroomOptions addObject:@"No Min"];
		[self.minBedroomOptions addObject:@"1"];
		[self.minBedroomOptions addObject:@"2"];
		[self.minBedroomOptions addObject:@"3"];
		[self.minBedroomOptions addObject:@"4"];
        [self.minBedroomOptions addObject:@"5"];
        [self.minBedroomOptions addObject:@"6"];
        //[self.minBedroomOptions addObject:@"7"];
        //[self.minBedroomOptions addObject:@"8"];
        //[self.minBedroomOptions addObject:@"9"];
        //[self.minBedroomOptions addObject:@"10"];
		
        if(minBed==nil)
        {
            self.selectedMinBedroom = [self.minBedroomOptions objectAtIndex:0];
            [defaults setObject:self.selectedMinBedroom forKey:@"minBed"];
			[defaults setObject:self.selectedMinBedroom forKey:@"tempMinBed"];
        }
        else
        {
            self.selectedMinBedroom = minBed;
			[defaults setObject:minBed forKey:@"tempMinBed"];
        }
		
		self.maxBedroomOptions = [[NSMutableArray alloc] init];
		[self.maxBedroomOptions addObject:@"No Max"];
		[self.maxBedroomOptions addObject:@"1"];
		[self.maxBedroomOptions addObject:@"2"];
		[self.maxBedroomOptions addObject:@"3"];
		[self.maxBedroomOptions addObject:@"4"];
        [self.maxBedroomOptions addObject:@"5"];
        [self.maxBedroomOptions addObject:@"6+"];
        //[self.maxBedroomOptions addObject:@"7"];
        //[self.maxBedroomOptions addObject:@"8"];
        //[self.maxBedroomOptions addObject:@"9"];
        //[self.maxBedroomOptions addObject:@"10"];
		
        if(maxBed==nil)
        {
            self.selectedMaxBedroom = [self.maxBedroomOptions objectAtIndex:0];
            [defaults setObject:self.selectedMaxBedroom forKey:@"maxBed"];
			[defaults setObject:self.selectedMaxBedroom forKey:@"tempMaxBed"];
        }
        else
        {
            self.selectedMaxBedroom = maxBed;
			[defaults setObject:maxBed forKey:@"tempMaxBed"];
        }
		
		self.minBathroomOptions = [[NSMutableArray alloc] init];
		[self.minBathroomOptions addObject:@"No Min"];
		[self.minBathroomOptions addObject:@"1"];
		[self.minBathroomOptions addObject:@"2"];
		[self.minBathroomOptions addObject:@"3"];
		[self.minBathroomOptions addObject:@"4"];
        [self.minBathroomOptions addObject:@"5"];
        [self.minBathroomOptions addObject:@"6"];
        //[self.minBathroomOptions addObject:@"7"];
        //[self.minBathroomOptions addObject:@"8"];
        //[self.minBathroomOptions addObject:@"9"];
        //[self.minBathroomOptions addObject:@"10"];
		
        if(minBath==nil)
        {
            self.selectedMinBathroom = [self.minBathroomOptions objectAtIndex:0];
            [defaults setObject:self.selectedMinBathroom forKey:@"minBath"];
			[defaults setObject:self.selectedMinBathroom forKey:@"tempMinBath"];
            
        }
        else
        {
            self.selectedMinBathroom = minBath;
			[defaults setObject:minBath forKey:@"tempMinBath"];
        }
		
		self.maxBathroomOptions = [[NSMutableArray alloc] init];
		[self.maxBathroomOptions addObject:@"No Max"];
		[self.maxBathroomOptions addObject:@"1"];
		[self.maxBathroomOptions addObject:@"2"];
		[self.maxBathroomOptions addObject:@"3"];
		[self.maxBathroomOptions addObject:@"4"];
        [self.maxBathroomOptions addObject:@"5"];
        [self.maxBathroomOptions addObject:@"6+"];
        //[self.maxBathroomOptions addObject:@"7"];
        //[self.maxBathroomOptions addObject:@"8"];
        //[self.maxBathroomOptions addObject:@"9"];
        //[self.maxBathroomOptions addObject:@"10"];
		
        if(maxBath==nil)
        {
            self.selectedMaxBathroom = [self.maxBathroomOptions objectAtIndex:0];
            [defaults setObject:self.selectedMaxBathroom forKey:@"maxBath"];
			[defaults setObject:self.selectedMaxBathroom forKey:@"tempMaxBath"];
        }
        else
        {
            self.selectedMaxBathroom = maxBath;
			[defaults setObject:maxBath forKey:@"tempMaxBath"];
        }
		
		self.minSquarefootageOptions = [[NSMutableArray alloc] init];
		[self.minSquarefootageOptions addObject:@"No Min"];
		[self.minSquarefootageOptions addObject:@"250"];
		[self.minSquarefootageOptions addObject:@"500"];
		[self.minSquarefootageOptions addObject:@"1000"];
		[self.minSquarefootageOptions addObject:@"1500"];
		[self.minSquarefootageOptions addObject:@"2000"];
		[self.minSquarefootageOptions addObject:@"3000"];
		[self.minSquarefootageOptions addObject:@"5000"];
		
		if(minSqFt==nil)
        {
           self.selectedMinSquarefootage = [self.minSquarefootageOptions objectAtIndex:0];
            [defaults setObject:self.selectedMinSquarefootage forKey:@"minSqFt"];
			[defaults setObject:self.selectedMinSquarefootage forKey:@"tempMinSqFt"];
        }
        else
        {
            self.selectedMinSquarefootage = minSqFt;
			[defaults setObject:minSqFt forKey:@"tempMinSqFt"];
        }
		
		
		self.maxSquarefootageOptions = [[NSMutableArray alloc] init];
		[self.maxSquarefootageOptions addObject:@"No Max"];
		[self.maxSquarefootageOptions addObject:@"500"];
		[self.maxSquarefootageOptions addObject:@"1000"];
		[self.maxSquarefootageOptions addObject:@"2000"];
		[self.maxSquarefootageOptions addObject:@"3000"];
		[self.maxSquarefootageOptions addObject:@"4000"];
		[self.maxSquarefootageOptions addObject:@"5000"];
		[self.maxSquarefootageOptions addObject:@"7500+"];
		//[self.maxSquarefootageOptions addObject:@"10000"];
		
		if(maxSqFt==nil)
        {
			self.selectedMaxSquarefootage = [self.maxSquarefootageOptions objectAtIndex:0];
            [defaults setObject:self.selectedMaxSquarefootage forKey:@"maxSqFt"];
			[defaults setObject:self.selectedMaxSquarefootage forKey:@"tempMaxSqFt"];
        }
        else
        {
            self.selectedMaxSquarefootage = maxSqFt;
			[defaults setObject:maxSqFt forKey:@"tempMaxSqFt"];
        }
		
		
        
        //self.selectedZipCode = @"35801";
        self.selectedZipCode = @"";
        
        //saving initial defaults to NSUserDefaults
        //defaults = [NSUserDefaults standardUserDefaults];
        
        /*
        NSString *endPrice = [defaults stringForKey:@"endPrice"];
        NSLog(@"End Price: %@",endPrice);
        if(endPrice == nil)
        {   
            //First run, No values set
            //Setting defaults
            [defaults setObject:self.selectedStartPrice forKey:@"startPrice"];
            [defaults setObject:self.selectedEndPrice forKey:@"endPrice"];
            [defaults setObject:self.selectedMinBedroom forKey:@"minBed"];
            [defaults setObject:self.selectedMaxBedroom forKey:@"maxBed"];
            [defaults setObject:self.selectedMinBathroom forKey:@"minBath"];
            [defaults setObject:self.selectedMaxBathroom forKey:@"maxBath"];
            [defaults setObject:self.selectedZipCode forKey:@"zipCode"];
        }
        else
        {
            //Do nothing. Set values continue to remain.
        }
         */
        [defaults synchronize];
        //NSLog(@"SearchSettingObject: %@, %@, %@, %@, %@, %@, %@, %@, %@",startPrice, endPrice, minBed, maxBed, minBath, maxBath, minSqFt, maxSqFt, zipCode);
		
	}
	return self;
}

-(NSString*)getStringRespresentation:(NSArray*)props{
	NSMutableString* resStr = [[[NSMutableString alloc] init]autorelease];
	for(int i=0;i<props.count;i++){
		if( [[props objectAtIndex:i] isKindOfClass:[NSString class]]){
			[resStr appendString:[props objectAtIndex:i]];
		}else{
			[resStr appendString:[[props objectAtIndex:i] stringValue]];
		}
		if( i+1<props.count){
			[resStr appendString:@","];
		}
	}
	return resStr;
}

-(NSString*)getPropertType{
	return [self getStringRespresentation:[self selectedPropertyTypes]];
}

-(NSString*)getStringRespresentation:(NSString*)start end:(NSString*)end{
	return [NSString stringWithFormat:@"%@ - %@",start,end];
}

-(NSString*)getPriceRange{
    //[defaults setObject:self.selectedStartPrice forKey:@"startPrice"];
    //[defaults setObject:self.selectedEndPrice forKey:@"endPrice"];
	return [self getStringRespresentation:[defaults objectForKey:@"startPrice"] end:[defaults objectForKey:@"endPrice"]];
}

-(NSString*)getBedrooms{
    //[defaults setObject:self.selectedMinBedroom forKey:@"minBed"];
    //[defaults setObject:self.selectedMaxBedroom forKey:@"maxBed"];
	return [self getStringRespresentation:[defaults objectForKey:@"minBed"] end:[defaults objectForKey:@"maxBed"]];
}

-(NSString*)getBathrooms{
    //[defaults setObject:self.selectedMinBathroom forKey:@"minBath"];
    //[defaults setObject:self.selectedMaxBathroom forKey:@"maxBath"];
	return [self getStringRespresentation:[defaults objectForKey:@"minBath"] end:[defaults objectForKey:@"maxBath"]];
}

-(NSString*)getSquareFootage{
	return [self getStringRespresentation:[defaults objectForKey:@"minSqFt"] end:[defaults objectForKey:@"maxSqFt"]];
}


- (void)dealloc {
	
	[startPriceOptions release];
	[selectedStartPrice release];
	[endPriceOptions release];
	[selectedEndPrice release];
	[minBedroomOptions release];
	[selectedMinBedroom release];
	[maxBedroomOptions release];
	[selectedMaxBedroom release];
	[minBathroomOptions release];
	[selectedMinBathroom release];
	[maxBathroomOptions release];
	[selectedMaxBathroom release];
	[minSquarefootageOptions release];
	[selectedMinSquarefootage release];
	[maxSquarefootageOptions release];
	[selectedMaxSquarefootage release];
    [selectedZipCode release];
    [super dealloc];
}

@end
