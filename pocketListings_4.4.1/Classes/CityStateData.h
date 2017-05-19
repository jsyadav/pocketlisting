//
//  CityStateData.h
//  pocketListings
//
//  Created by Kaustubh Chavan on 1/12/11.
//  Copyright 2011 Xoriant Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CityStateData : NSObject {

	NSString *city;
	NSString *state;
	NSString *country;
}

@property (nonatomic, retain) NSString *city;
@property (nonatomic, retain) NSString *state;
@property (nonatomic, retain) NSString *country;

@end
