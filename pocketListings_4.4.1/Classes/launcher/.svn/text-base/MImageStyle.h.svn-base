//
//  MImageStyle.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/30/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MStyle.h"

@interface MImageStyle : MStyle {
    NSString*         _imageURL;
    UIImage*          _image;
    UIImage*          _defaultImage;
    
    CGSize            _size;
    
    UIViewContentMode _contentMode;
}

@property (nonatomic, copy)   NSString* imageURL;
@property (nonatomic, retain) UIImage*  image;
@property (nonatomic, retain) UIImage*  defaultImage;
@property (nonatomic)         CGSize    size;

@property (nonatomic)         UIViewContentMode contentMode;

+ (MImageStyle*)styleWithImageURL:(NSString*)imageURL next:(MStyle*)next;
+ (MImageStyle*)styleWithImageURL:(NSString*)imageURL defaultImage:(UIImage*)defaultImage
                              next:(MStyle*)next;
+ (MImageStyle*)styleWithImageURL:(NSString*)imageURL defaultImage:(UIImage*)defaultImage
                       contentMode:(UIViewContentMode)contentMode
                              size:(CGSize)size next:(MStyle*)next;
+ (MImageStyle*)styleWithImage:(UIImage*)image next:(MStyle*)next;
+ (MImageStyle*)styleWithImage:(UIImage*)image defaultImage:(UIImage*)defaultImage
                           next:(MStyle*)next;
+ (MImageStyle*)styleWithImage:(UIImage*)image defaultImage:(UIImage*)defaultImage
                    contentMode:(UIViewContentMode)contentMode
                           size:(CGSize)size next:(MStyle*)next;

@end
