//
//  MButtonContent.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/30/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MURLRequestDelegate.h"

@class MStyle,MButton;
@protocol MImageViewDelegate; 


@interface MButtonContent: NSObject <MURLRequestDelegate> {
    MButton*     _button;
    NSString*     _title;
    NSString*     _imageURL;
    UIImage*      _image;
    MStyle*      _style;
    MURLRequest* _request;
    
    id<MImageViewDelegate> _delegate;
}

@property (nonatomic, copy)   NSString* title;
@property (nonatomic, copy)   NSString* imageURL;
@property (nonatomic, retain) UIImage*  image;
@property (nonatomic, retain) MStyle*  style;
@property (nonatomic, assign) id<MImageViewDelegate> delegate;

- (id)initWithButton:(MButton*)button;

- (void)reload;
- (void)stopLoading;

@end
