//
//  MImageStyle.m
//  MLauncher
//
//  Created by Developer mTgr8 on 10/30/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MImageStyle.h"
#import "MStyleContext.h"
#import "MURLCache.h"
#import "UIImageAdditions.h"
#import "MCorePreprocessorMacros.h"

@implementation MImageStyle

@synthesize imageURL      = _imageURL;
@synthesize image         = _image;
@synthesize defaultImage  = _defaultImage;
@synthesize contentMode   = _contentMode;
@synthesize size          = _size;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithNext:(MStyle*)next {
	self = [super initWithNext:next];
    if (self) {
        _contentMode = UIViewContentModeScaleToFill;
        _size = CGSizeZero;
    }
    
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
    TT_RELEASE_SAFELY(_imageURL);
    TT_RELEASE_SAFELY(_image);
    TT_RELEASE_SAFELY(_defaultImage);
    
    [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Class public


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MImageStyle*)styleWithImageURL:(NSString*)imageURL next:(MStyle*)next {
    MImageStyle* style = [[[self alloc] initWithNext:next] autorelease];
    style.imageURL = imageURL;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MImageStyle*)styleWithImageURL:(NSString*)imageURL defaultImage:(UIImage*)defaultImage
                              next:(MStyle*)next {
    MImageStyle* style = [[[self alloc] initWithNext:next] autorelease];
    style.imageURL = imageURL;
    style.defaultImage = defaultImage;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MImageStyle*)styleWithImageURL:(NSString*)imageURL
                      defaultImage:(UIImage*)defaultImage
                       contentMode:(UIViewContentMode)contentMode
                              size:(CGSize)size
                              next:(MStyle*)next {
    MImageStyle* style = [[[self alloc] initWithNext:next] autorelease];
    style.imageURL = imageURL;
    style.defaultImage = defaultImage;
    style.contentMode = contentMode;
    style.size = size;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MImageStyle*)styleWithImage:(UIImage*)image next:(MStyle*)next {
    MImageStyle* style = [[[self alloc] initWithNext:next] autorelease];
    style.image = image;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MImageStyle*)styleWithImage:(UIImage*)image defaultImage:(UIImage*)defaultImage
                           next:(MStyle*)next {
    MImageStyle* style = [[[self alloc] initWithNext:next] autorelease];
    style.image = image;
    style.defaultImage = defaultImage;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
+ (MImageStyle*)styleWithImage:(UIImage*)image
                   defaultImage:(UIImage*)defaultImage
                    contentMode:(UIViewContentMode)contentMode
                           size:(CGSize)size
                           next:(MStyle*)next {
    MImageStyle* style = [[[self alloc] initWithNext:next] autorelease];
    style.image = image;
    style.defaultImage = defaultImage;
    style.contentMode = contentMode;
    style.size = size;
    return style;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Private


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIImage*)imageForContext:(MStyleContext*)context {
    UIImage* image = self.image;
    if (!image && [context.delegate respondsToSelector:@selector(imageForLayerWithStyle:)]) {
        image = [context.delegate imageForLayerWithStyle:self];
    }
    return image;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark MStyle


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)draw:(MStyleContext*)context {
    UIImage* image = [self imageForContext:context];
    if (image) {
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGContextSaveGState(ctx);
        CGRect rect = [image convertRect:context.contentFrame withContentMode:_contentMode];
        [context.shape addToPath:rect];
        CGContextClip(ctx);
        
        [image drawInRect:context.contentFrame contentMode:_contentMode];
        
        CGContextRestoreGState(ctx);
    }
    return [self.next draw:context];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)addToSize:(CGSize)size context:(MStyleContext*)context {
    if (_size.width || _size.height) {
        size.width += _size.width;
        size.height += _size.height;
        
    } else if (_contentMode != UIViewContentModeScaleToFill
               && _contentMode != UIViewContentModeScaleAspectFill
               && _contentMode != UIViewContentModeScaleAspectFit) {
        UIImage* image = [self imageForContext:context];
        if (image) {
            size.width += image.size.width;
            size.height += image.size.height;
        }
    }
    
    if (_next) {
        return [self.next addToSize:size context:context];
        
    } else {
        return size;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Public


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UIImage*)image {
    if (!_image && _imageURL) {
        _image = [[[MURLCache sharedCache] imageForURL:_imageURL] retain];
    }
    
    return _image;
}


@end
