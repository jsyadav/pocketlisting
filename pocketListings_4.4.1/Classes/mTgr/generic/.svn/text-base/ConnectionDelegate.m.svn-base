//
//  ConnectionDelegate.m
//  Alerts
//
//  Created by Indroniel Deb Roy on 5/26/09.
//  Copyright 2009 mtgr8 Systems Inc.. All rights reserved.
//

#import "ConnectionDelegate.h"
#import <CommonCrypto/CommonDigest.h>
#import "pocketListingsAppDelegate.h"
#import "TBXML.h"
#import "XMLUtil.h"
#import "NSDataAdditions.h"
#import "SBJson.h"

@interface ConnectionDelegate () <SBJsonStreamParserAdapterDelegate>
@end

@implementation ConnectionDelegate

@synthesize responseData;
@synthesize mResponse; //leak
@synthesize target;
@synthesize callback;

#pragma mark SBJsonStreamParserAdapterDelegate methods

- (void)parser:(SBJsonStreamParser *)parser foundArray:(NSArray *)array {
    SEL select= self.callback; 
    id lTarget = self.target;
    
    if( [lTarget respondsToSelector:select] ){
        [lTarget performSelector:select withObject:array withObject:self];
    }
}

- (void)parser:(SBJsonStreamParser *)parser foundObject:(NSDictionary *)dict {
	SEL select= self.callback; 
    id lTarget = self.target;
    
    if( [lTarget respondsToSelector:select] ){
        [lTarget performSelector:select withObject:dict withObject:self];
    }
}


- (id)init { 
	if(self = [super init]){ 
		responseData = [[NSMutableData alloc] init]; //leak
		isBinaryData = NO;
        isJson=NO;
		appDelegate = (pocketListingsAppDelegate *)[[UIApplication sharedApplication] delegate];
	}
	return self;
}

- (id)initForJson { 
	if(self = [super init]){ 
		responseData = [[NSMutableData alloc] init]; //leak
		isBinaryData = NO;
        isJson=YES;
		appDelegate = (pocketListingsAppDelegate *)[[UIApplication sharedApplication] delegate];
	}
	return self;
}

- (id)initForBinary { 
	if(self = [super init]){ 
		responseData = [[NSMutableData alloc] init];
		isBinaryData = YES;
        isJson=NO;
	}
	return self;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.mResponse = response;
	
	[responseData setLength:0];
}

//- (NSString*) calculatetestResponseHash{
//	NSString* a1 =[self md5:[NSString stringWithFormat:@"Joe:RETS Server:%@",@"Schmoe"]];
//	NSString* a2 =[self md5:[NSString stringWithFormat:@"GET:%@",@"/rets/login"]];
//	NSString* hash =[self md5:[NSString stringWithFormat:@"%@:70f104d8bd262d3ec91e329d5c0096ea:00000001:8fc20cecd714197dc13be16ab3b63767:auth:%@",a1,a2]];
//	if([hash isEqual:@"02956398642e709eef9849aefa9cd1e8"]){
//		NSLog(@"Hash computation successful");
//	}
//	if([hash length]==32){
//		NSLog(@"Length Equal");
//	}
//	return hash;
//}

	 

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	SEL select= self.callback; 
	id lTarget = self.target;
	
	if( [lTarget respondsToSelector:select] ){
		[lTarget performSelector:select withObject:nil withObject:nil];
	}
	
	NSLog(@"Connection Error!%@",error);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Once this method is invoked, "responseData" contains the complete result
	//NSLog(@"All Data received! %d",[responseData length]);
	
	if( isBinaryData ){
		NSData *data = [[[NSData alloc] initWithBytes:[responseData mutableBytes] length:[responseData length]] autorelease];
		SEL select= self.callback; 
		id lTarget = self.target;
		
		if( [lTarget respondsToSelector:select] ){
			[lTarget performSelector:select withObject:data withObject:self];
		}
	}
	else{
        
		NSString *resStr= [[[NSString alloc] initWithBytes:[responseData mutableBytes] length:[responseData length] encoding:NSUTF8StringEncoding]autorelease];
		resStr = [[resStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] retain];
        if(isJson){
            [self parseJson:resStr];
        }else{    
				if ([resStr rangeOfString:@"<?xml version="].location != NSNotFound || [resStr rangeOfString:@"<brandingData xmlns:xsi"].location != NSNotFound)
				{
					CXMLDocument *resDoc = [[[CXMLDocument alloc] initWithXMLString:resStr options:0 error:nil] autorelease];
                    
                    CXMLNode* lNode = [XMLUtil getXMLValue:@"Error" inNode:[resDoc rootElement]];
                    if( lNode != nil ){
                        NSString* code = [XMLUtil getXMLStringValue:@"Code" inNode:lNode];
                        NSString* desc =  [XMLUtil getXMLStringValue:@"Description" inNode:lNode];
                        
                        [appDelegate performDismiss:0];
                        [appDelegate performDismiss2:0];
                        [appDelegate invalidTimer];
                        
                        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"Server Error Code:%@",code] message:desc delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        [alertView show];
                        [alertView release];                        
                    }else{
					
					SEL select= self.callback; 
					id lTarget = self.target;
					
					if( [lTarget respondsToSelector:select] ){
						[lTarget performSelector:select withObject:resDoc withObject:self];
					}
                    }
					
				}
				else {
					[appDelegate performDismiss:0];
					[appDelegate performDismiss2:0];
					//NSLog(@"Connection Alert");
					UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"No response from server. Please try again later." message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
					[alertView show];
					[alertView release];
				}
				
//			}

			
//		}
//		[tbxml release];
		[resStr release]; // leak
	}
    }
}

-(void) parseJson:(NSString*)contentStr{
   SBJsonParser *parser = [[SBJsonParser alloc] init];
   id resultObj = [parser objectWithString:contentStr error:nil];
    
    SEL select= self.callback; 
    id lTarget = self.target;
    
    if( [lTarget respondsToSelector:select] ){
        [lTarget performSelector:select withObject:resultObj
                      withObject:self];
    }
 
    
}

-(void) debugResponse{
	//NSLog(@"***********response header start*********");
	//NSEnumerator* enumerator = [[mResponse allHeaderFields] keyEnumerator];
	//id key;
	//while ((key = [enumerator nextObject])) {
		//NSLog(@"%@ : %@", key, [[mResponse allHeaderFields] objectForKey:key]);
	//}
	//NSLog(@"***********response header end*********");
}

- (void) getCookieValue:(NSString*)url {
	//NSArray * availableCookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:url]];
	/*NSLog(@"***********cookie start*********");
	for(int i=0; i<availableCookies.count;i++){
		
		NSLog([[availableCookies objectAtIndex:i] value]);
	}
	NSLog(@"***********cookie*********");*/
}

- (void) test:(NSNumber*)one more:(NSNumber*)two{
	
}

- (void)dealloc {
	[responseData release];
	[mResponse release];
    [super dealloc];
}




@end
