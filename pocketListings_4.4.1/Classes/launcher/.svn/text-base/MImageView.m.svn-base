//
//  MImageView.m
//  MLauncher
//
//  Created by Developer mTgr8 on 10/29/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MImageView.h"
#import "MStyleContext.h"
#import "MURLRequest.h"
#import "MURLCache.h"
#import "MContentStyle.h"
#import "MURLImageResponse.h"
#import "MImageLayer.h"
#import "MCorePreprocessorMacros.h"

@implementation MImageView


@synthesize urlPath             = _urlPath;
@synthesize image               = _image;
@synthesize defaultImage        = _defaultImage;
@synthesize autoresizesToImage  = _autoresizesToImage;

@synthesize delegate = _delegate;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
    if (self) {
        _autoresizesToImage = NO;
    }
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
    _delegate = nil;
    [_request cancel];
    TT_RELEASE_SAFELY(_request);
    TT_RELEASE_SAFELY(_urlPath);
    TT_RELEASE_SAFELY(_image);
    TT_RELEASE_SAFELY(_defaultImage);
    [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UIView


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (Class)layerClass {
    return [MImageLayer class];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)drawRect:(CGRect)rect {
    if (self.style) {
        [super drawRect:rect];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark TTView


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)drawContent:(CGRect)rect {
    if (nil != _image) {
        [_image drawInRect:rect contentMode:self.contentMode];
        
    } else {
        [_defaultImage drawInRect:rect contentMode:self.contentMode];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark MURLRequestDelegate


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)requestDidStartLoad:(MURLRequest*)request {
    [_request release];
    _request = [request retain];
    
    [self imageViewDidStartLoad];
    if ([_delegate respondsToSelector:@selector(imageViewDidStartLoad:)]) {
        [_delegate imageViewDidStartLoad:self];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)requestDidFinishLoad:(MURLRequest*)request {
    MURLImageResponse* response = request.response;
    [self setImage:response.image];
    
    TT_RELEASE_SAFELY(_request);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)request:(MURLRequest*)request didFailLoadWithError:(NSError*)error {
    TT_RELEASE_SAFELY(_request);
    
    [self imageViewDidFailLoadWithError:error];
    if ([_delegate respondsToSelector:@selector(imageView:didFailLoadWithError:)]) {
        [_delegate imageView:self didFailLoadWithError:error];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)requestDidCancelLoad:(MURLRequest*)request {
    TT_RELEASE_SAFELY(_request);
    
    [self imageViewDidFailLoadWithError:nil];
    if ([_delegate respondsToSelector:@selector(imageView:didFailLoadWithError:)]) {
        [_delegate imageView:self didFailLoadWithError:nil];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark MStyleDelegate


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)drawLayer:(MStyleContext*)context withStyle:(MStyle*)style {
    if ([style isKindOfClass:[MContentStyle class]]) {
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGContextSaveGState(ctx);
        
        CGRect rect = context.frame;
        [context.shape addToPath:rect];
        CGContextClip(ctx);
        
        [self drawContent:rect];
        
        CGContextRestoreGState(ctx);
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark MURLRequestDelegate


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)isLoading {
    return !!_request;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)isLoaded {
    return nil != _image && _image != _defaultImage;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)reload {
    if (nil == _request && nil != _urlPath) {
        UIImage* image = [[MURLCache sharedCache] imageForURL:_urlPath];
        
        if (nil != image) {
            self.image = image;
            
        } else {
            MURLRequest* request = [MURLRequest requestWithURL:_urlPath delegate:self];
            request.response = [[[MURLImageResponse alloc] init] autorelease];
            
            if (![request send]) {
                // Put the default image in place while waiting for the request to load
                if (_defaultImage && nil == self.image) {
                    self.image = _defaultImage;
                }
            }
        }
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)stopLoading {
    [_request cancel];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)imageViewDidStartLoad {
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)imageViewDidLoadImage:(UIImage*)image {
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)imageViewDidFailLoadWithError:(NSError*)error {
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark public


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)unsetImage {
    [self stopLoading];
    self.image = nil;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setDefaultImage:(UIImage*)theDefaultImage {
    if (_defaultImage != theDefaultImage) {
        [_defaultImage release];
        _defaultImage = [theDefaultImage retain];
    }
    if (nil == _urlPath || 0 == _urlPath.length) {
        //no url path set yet, so use it as the current image
        self.image = _defaultImage;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setUrlPath:(NSString*)urlPath {
    // Check for no changes.
    if (nil != _image && nil != _urlPath && [urlPath isEqualToString:_urlPath]) {
        return;
    }
    
    [self stopLoading];
    
    {
        NSString* urlPathCopy = [urlPath copy];
        [_urlPath release];
        _urlPath = urlPathCopy;
    }
    
    if (nil == _urlPath || 0 == _urlPath.length) {
        // Setting the url path to an empty/nil path, so let's restore the default image.
        self.image = _defaultImage;
        
    } else {
        [self reload];
    }
}


@end
