//
//  ConnectionDelegate.h
//  Alerts
//
//  Created by Indroniel Deb Roy on 5/26/09.
//  Copyright 2009 mtgr8 Systems Inc.. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TouchXML.h"


@class pocketListingsAppDelegate;
@interface ConnectionDelegate : NSObject {
	NSMutableData *responseData;
	NSURLResponse *mResponse;
	id target;
	SEL callback;
	
	BOOL isBinaryData;
    BOOL isJson;
	pocketListingsAppDelegate *appDelegate;
}

@property (readwrite,retain) NSMutableData *responseData;
@property (readwrite,retain) NSURLResponse *mResponse;
@property (readwrite,assign) id target;
@property (readwrite,assign) SEL callback;

- (id)initForBinary;
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;
- (void)connectionDidFinishLoading:(NSURLConnection *)connection;
- (void) getCookieValue:(NSString*)url;
-(void) parseJson:(NSString*)contentStr;
- (id)initForJson;



@end
