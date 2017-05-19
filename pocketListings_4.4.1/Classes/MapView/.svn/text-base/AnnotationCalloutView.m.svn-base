//
//  AnnotationCalloutView.m
//  MLS-R-App
//
//  Created by Developer mTgr8 on 10/6/09.
//  Copyright 2009 mTgr8 Inc.. All rights reserved.
//

#import "AnnotationCalloutView.h"


@implementation AnnotationCalloutView

@synthesize titleLabel,detailsLabel,imageView;

- (id)initFromResource {
    if (self = [super init]) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"AnnotationCalloutView" owner:self options:nil];
		
		for (id currentObject in topLevelObjects){
			if ([currentObject isKindOfClass:[AnnotationCalloutView class]]){
				self =  (AnnotationCalloutView *) currentObject;
				break;
			}
		}
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)dealloc {
    [super dealloc];
}


@end
