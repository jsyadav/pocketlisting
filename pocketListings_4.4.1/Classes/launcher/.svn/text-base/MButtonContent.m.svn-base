//
//  MButtonContent.m
//  MLauncher
//
//  Created by Developer mTgr8 on 10/30/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MButtonContent.h"
#import "MURLImageResponse.h"
#import "MURLRequest.h"
#import "MURLCache.h"
#import "MCorePreprocessorMacros.h"

@implementation MButtonContent

@synthesize title     = _title;
@synthesize imageURL  = _imageURL;
@synthesize image     = _image;
@synthesize style     = _style;
@synthesize delegate  = _delegate;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithButton:(MButton*)button {
	self = [super init];
    if (self) {
        _button = button;
    }
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
    [_request cancel];
    TT_RELEASE_SAFELY(_request);
    TT_RELEASE_SAFELY(_title);
    TT_RELEASE_SAFELY(_imageURL);
    TT_RELEASE_SAFELY(_image);
    TT_RELEASE_SAFELY(_style);
    self.delegate = nil;
    
    [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark MURLRequestDelegate


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)requestDidStartLoad:(MURLRequest*)request {
    [_request release];
    _request = [request retain];
    
    if ([_delegate respondsToSelector:@selector(imageViewDidStartLoad:)]) {
        [_delegate imageViewDidStartLoad:nil];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)requestDidFinishLoad:(MURLRequest*)request {
    MURLImageResponse* response = request.response;
    self.image = response.image;
    [_button setNeedsDisplay];
    
    TT_RELEASE_SAFELY(_request);
    
    if ([_delegate respondsToSelector:@selector(imageView:didLoadImage:)]) {
        [_delegate imageView:nil didLoadImage:response.image];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)request:(MURLRequest*)request didFailLoadWithError:(NSError*)error {
    TT_RELEASE_SAFELY(_request);
    
    if ([_delegate respondsToSelector:@selector(imageView:didFailLoadWithError:)]) {
        [_delegate imageView:nil didFailLoadWithError:error];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)requestDidCancelLoad:(MURLRequest*)request {
    TT_RELEASE_SAFELY(_request);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Public


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setImageURL:(NSString*)URL {
    if (self.image && _imageURL && [URL isEqualToString:_imageURL])
        return;
    
    [self stopLoading];
    [_imageURL release];
    _imageURL = [URL retain];
    
    if (_imageURL.length) {
        [self reload];
        
    } else {
        self.image = nil;
        [_button setNeedsDisplay];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)reload {
    if (!_request && _imageURL) {
        UIImage* image = [[MURLCache sharedCache] imageForURL:_imageURL];
        if (image) {
            self.image = image;
            [_button setNeedsDisplay];
            
            if ([_delegate respondsToSelector:@selector(imageView:didLoadImage:)]) {
                [_delegate imageView:nil didLoadImage:image];
            }
            
        } else {
            MURLRequest* request = [MURLRequest requestWithURL:_imageURL delegate:self];
            request.response = [[[MURLImageResponse alloc] init] autorelease];
            [request send];
        }
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)stopLoading {
    [_request cancel];
}


@end

