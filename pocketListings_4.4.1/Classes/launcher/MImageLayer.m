//
//  MImageLayer.m
//  MLauncher
//
//  Created by Developer mTgr8 on 10/31/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MImageLayer.h"
#import "MImageView.h"
#import "MCorePreprocessorMacros.h"

@implementation MImageLayer

@synthesize override = _override;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)display {
    if (nil != _override) {
        self.contents = (id)_override.image.CGImage;
        
    } else {
        return [super display];
    }
}


@end
