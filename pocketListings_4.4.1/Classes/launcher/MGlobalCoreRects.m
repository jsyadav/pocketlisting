//
//  MGlobalCoreRects.m
//  MLauncher
//
//  Created by Developer mTgr8 on 10/30/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MGlobalCoreRects.h"
#import "MCorePreprocessorMacros.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
CGRect MRectContract(CGRect rect, CGFloat dx, CGFloat dy) {
    return CGRectMake(rect.origin.x, rect.origin.y, rect.size.width - dx, rect.size.height - dy);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
CGRect MRectShift(CGRect rect, CGFloat dx, CGFloat dy) {
    return CGRectOffset(MRectContract(rect, dx, dy), dx, dy);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
CGRect MRectInset(CGRect rect, UIEdgeInsets insets) {
    return CGRectMake(rect.origin.x + insets.left, rect.origin.y + insets.top,
                      rect.size.width - (insets.left + insets.right),
                      rect.size.height - (insets.top + insets.bottom));
}
