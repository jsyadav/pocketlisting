//
//  SearchCell.h
//  MLS-R-App
//
//  Created by Developer mTgr8 on 10/15/09.
//  Copyright 2009 mTgr8 Inc.. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Property.h"

@interface SearchCell : UITableViewCell {
	id cellObject;
	IBOutlet  UIImageView* imageView;
	IBOutlet  UILabel *labelView;
	IBOutlet  UILabel *descView;
    IBOutlet  UILabel *statusView;
    IBOutlet  UILabel *openHouseLabel;
    IBOutlet UIActivityIndicatorView *busyIndicator;
}

@property (nonatomic, retain) id cellObject;
@property (nonatomic, retain) IBOutlet  UIImageView* imageView;
@property (nonatomic, retain) IBOutlet  UILabel *labelView;
@property (nonatomic, retain) IBOutlet  UILabel *descView;
@property (nonatomic, retain) IBOutlet  UILabel *statusView;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *busyIndicator;

- (id)initFromResource;
-(void)setCellObject:(id)aPropData;
-(void)getImage:(NSString *)imgURL;

@end
