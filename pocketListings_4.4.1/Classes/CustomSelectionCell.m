//
//  CustomSelectionCell.m
//  pocketListings
//
//  Created by Kaustubh Chavan on 1/14/11.
//  Copyright 2011 Xoriant Corporation. All rights reserved.
//

#import "CustomSelectionCell.h"


@implementation CustomSelectionCell
@synthesize lblName;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        // Initialization code
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
    [super dealloc];
}


@end
