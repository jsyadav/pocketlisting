//
//  FbGraphImage.h
//  oAuth2Test
//
//  Created by dominic dimarco (ddimarco@room214.com @dominicdimarco) on 6/9/10.
//  Copyright 2010 Room 214. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FbGraphFile : NSObject {

	UIImage *uploadImage;
}
@property (nonatomic, retain) UIImage *uploadImage;

- (id)initWithImage:(UIImage *)upload_image;
- (void)appendDataToBody:(NSMutableData *)body;
@end
