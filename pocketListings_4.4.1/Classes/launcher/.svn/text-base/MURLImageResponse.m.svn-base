//
//  MURLImageResponse.m
//  MLauncher
//
//  Created by Developer mTgr8 on 10/30/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MURLImageResponse.h"
#import "MURLRequest.h"
#import "MURLCache.h"
#import "MCorePreprocessorMacros.h"

@implementation MURLImageResponse

@synthesize image = _image;


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
    TT_RELEASE_SAFELY(_image);
    
    [super dealloc];
}


//////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark MURLResponse


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSError*)request:(MURLRequest*)request processResponse:(NSHTTPURLResponse*)response
               data:(id)data {
    // This response is designed for NSData and UIImage objects, so if we get anything else it's
    // probably a mistake.
    
    
    if ([data isKindOfClass:[UIImage class]]) {
        _image = [data retain];
        
    } else if ([data isKindOfClass:[NSData class]]) {
        // TODO(jverkoey Feb 10, 2010): This logic doesn't entirely make sense. Why don't we just store
        // the data in the cache if there was a cache miss, and then just retain the image data we
        // downloaded? This needs to be tested in production.
        UIImage* image = [[MURLCache sharedCache] imageForURL:request.urlPath fromDisk:NO];
        
        if (nil == image) {
            image = [UIImage imageWithData:data];
        }
        
        if (nil != image) {
            if (!request.respondedFromCache) {
                // XXXjoe Working on option to scale down really large images to a smaller size to save memory
                //        if (image.size.width * image.size.height > (300*300)) {
                //          image = [image transformWidth:300 height:(image.size.height/image.size.width)*300.0
                //                         rotate:NO];
                //          NSData* data = UIImagePNGRepresentation(image);
                //          [[MURLCache sharedCache] storeData:data forURL:request.URL];
                //        }
                [[MURLCache sharedCache] storeImage:image forURL:request.urlPath];
            }
            
            _image = [image retain];
            
        } else {
            return [NSError errorWithDomain:@"mtgr8.network"
                                       code:100
                                   userInfo:nil];
        }
    }
    
    return nil;
}


@end

