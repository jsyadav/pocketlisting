//
//  MoreInfoView.h
//  CustomCalloutMapView
//
//  Created by Kaustubh
//

#import <Foundation/Foundation.h>
#import  "MyAnnotation.h"
@class MapViewController;

@interface MoreInfoView : UIView {

	IBOutlet UILabel* text;
	IBOutlet UILabel* titleLabel;
	IBOutlet UILabel* subTitleLabel;
	IBOutlet UIButton* detailsButton;
	MapViewController *mapController;
    IBOutlet UIImageView *initialImage;
    
    id annotation;
	
}

@property (nonatomic, retain) IBOutlet UILabel*  text;
@property (nonatomic, retain) IBOutlet UILabel* titleLabel;
@property (nonatomic, retain) IBOutlet UILabel* subTitleLabel;
@property (nonatomic, retain) IBOutlet UIButton* detailsButton;
@property (nonatomic, retain) MapViewController* mapController;
@property (nonatomic, retain) IBOutlet UIImageView *initialImage;
@property (nonatomic, assign) id annotation;

-(IBAction) getDetails:(id) sender;

@end
