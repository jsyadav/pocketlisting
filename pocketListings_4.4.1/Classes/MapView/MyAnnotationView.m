//
//  MyAnnotationView.m
//  CustomCalloutMapView
//
//  Created by Kaustubh
//

#import "MyAnnotationView.h"
#import "CurrentLocationAnnotation.h"


@implementation MyAnnotationView

- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
	if (self != nil) {
		if ([annotation isKindOfClass:[CurrentLocationAnnotation class]])
		{
			self.image= [UIImage imageNamed:@"blue_dot_big.png"];
		}
		else{
			self.image= [UIImage imageNamed:@"Rap_HouseIcon.png"];
		}
		
		//CGPoint notNear = CGPointMake(10000.0,10000.0);
		//self.calloutOffset = notNear;

	}
	return self;
}

@end
