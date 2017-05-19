//
//  CurrentLocationAnnotation.h
//  retsClient
//
//  Created by Indroniel Deb Roy on 8/15/09.
//  Copyright 2009 mtgr8 Systems Inc.. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CurrentLocationAnnotation : NSObject <MKAnnotation>{
	CLLocationCoordinate2D coordinate;
}
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

-(id) initWithCoordiate:(CLLocationCoordinate2D)location;
- (NSString *)title;
@end
