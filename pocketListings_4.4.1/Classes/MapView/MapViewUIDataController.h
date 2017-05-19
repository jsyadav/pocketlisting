//
//  MapViewUIDataController.h
//  MLS-R-App
//
//  Created by Kaustubh Chavan on 6/1/10.
//  Copyright 2010 Xoriant Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Property.h"
#import "MapViewController.h"


@interface MapViewUIDataController : NSObject {
	Property *propertyData;

}
@property (nonatomic ,retain) Property *propertyData;
-(id) initWithPropertyData:(Property *)propertyData;
@end
