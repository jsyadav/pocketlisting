//
//  AnnotationCalloutView.h
//  MLS-R-App
//
//  Created by Developer mTgr8 on 10/6/09.
//  Copyright 2009 mTgr8 Inc.. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AnnotationCalloutView : UIView {
	IBOutlet UILabel* titleLabel;
	IBOutlet UILabel* detailsLabel;
	IBOutlet UIImageView* imageView;
}

@property (nonatomic, retain) IBOutlet UILabel* titleLabel;
@property (nonatomic, retain) IBOutlet UILabel* detailsLabel;
@property (nonatomic, retain) IBOutlet UIImageView* imageView;

- (id)initFromResource;

@end
