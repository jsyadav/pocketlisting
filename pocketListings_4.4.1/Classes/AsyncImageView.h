//
//  AsyncImageView.h
//  MLS-R-App
//
//  Created by Kaustubh Chavan on 23/04/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SearchResultController;
@interface AsyncImageView : UIView 
{
	NSURLConnection* connection; //keep a reference to the connection so we can cancel download in dealloc
	NSMutableData* data; //keep reference to the data so we can collect it as it downloads
	//but where is the UIImage reference? We keep it in self.subviews - no need to re-code what we have in the parent class
	SearchResultController *objSearchResultController;
	NSURL *imgUrl;
}

- (void)loadImageFromURL:(NSURL*)url;
- (UIImage*) image;

@end