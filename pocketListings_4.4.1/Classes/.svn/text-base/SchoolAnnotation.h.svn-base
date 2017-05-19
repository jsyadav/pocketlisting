//
//  SchoolAnnotation.h
//  pocketListings
//
//  Created by Developer mTgr8 on 9/12/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface SchoolAnnotation : NSObject <MKAnnotation> {
    NSDictionary* details; 
}
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) NSDictionary* details;
- (NSString *) title;
- (NSString *) subtitle;
- (id) initWithCoordinate:(CLLocationCoordinate2D)aCoordinate details:(NSDictionary*)details;
-(NSString*) getValue:(NSString*)key formatString:(NSString*)formatString;
-(NSString*) getInnerValue:(NSString*)outkey key:(NSString*)key formatString:(NSString*)formatString;
@end

@interface PublicSchoolAnnotation : SchoolAnnotation {
    
}
@end

@interface PrivateSchoolAnnotation : SchoolAnnotation {
   
}
@end

