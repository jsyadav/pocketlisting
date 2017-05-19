//
//  FbGraphResponse.h
//  oAuth2Test
//
//  Created by dominic dimarco (ddimarco@room214.com @dominicdimarco) on 6/5/10.
//  Copyright 2010 Room 214. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FbGraphResponse : NSObject {

	NSString *htmlResponse;
	UIImage *imageResponse;
	NSError *error;
	
}

@property (nonatomic, retain) NSString *htmlResponse;
@property (nonatomic, retain) UIImage *imageResponse;
@property (nonatomic, retain) NSError *error;

@end
