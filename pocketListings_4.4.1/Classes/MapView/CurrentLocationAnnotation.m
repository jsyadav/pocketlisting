//
//  CurrentLocationAnnotation.m
//  retsClient
//
//  Created by Indroniel Deb Roy on 8/15/09.
//  Copyright 2009 mtgr8 Systems Inc.. All rights reserved.
//

#import "CurrentLocationAnnotation.h"


@implementation CurrentLocationAnnotation
@synthesize coordinate;

-(id) initWithCoordiate:(CLLocationCoordinate2D)location{
	if (self = [super init]) {
        coordinate = location;
    }
    return self;
}

- (NSString *)title{
	return @"Current Location";
}
@end
