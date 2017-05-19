//
//  AppUtils.m
//  MLS-R-App
//
//  Created by mDeveloper on 9/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AppUtils.h"
#import "ConnectionDelegate.h"


@implementation AppUtils

+(pocketListingsAppDelegate*) getAppDelegate{
	pocketListingsAppDelegate* appDelegate = (pocketListingsAppDelegate*)[[UIApplication sharedApplication] delegate];
	return appDelegate;
}


+(void) requestServer:(NSURLRequest*)aRequest resultTarget:(id)target targetFunction:(SEL)function{
	
	ConnectionDelegate *aDelegate = [[[ConnectionDelegate alloc] init] autorelease]; //leak
	
	aDelegate.target = target;
	
	aDelegate.callback = function;
	
	`
	
}

+(void) requestBinaryDataFromServer:(NSURLRequest*)aRequest resultTarget:(id)target targetFunction:(SEL)function{
	
	ConnectionDelegate *aDelegate = [[[ConnectionDelegate alloc] initForBinary] autorelease];
	
	aDelegate.target = target;
	
	aDelegate.callback = function;
	
	[[[NSURLConnection alloc] initWithRequest:aRequest delegate:aDelegate] autorelease];
	
}

+(NSString*)formatFloatStr:(NSString*)aStr{
	NSScanner *aScanner = [NSScanner scannerWithString:aStr];
	double value=-1;
	[aScanner scanDouble:&value];
	if( value==-1){
		return aStr;
	}
	return [NSString stringWithFormat:@"%.0f",value];
}


+(NSString*)formatPrice:(NSString*)aStr{
	NSScanner *aScanner = [NSScanner scannerWithString:aStr];
	NSString *price=nil;
	[aScanner scanUpToString:@"." intoString:&price];
	if( price == nil){
		price = aStr;
	}
	aStr = price;
	NSMutableString *resStr = [[[NSMutableString alloc] init]autorelease];
	while( aStr.length > 3){
		NSString* aSubStr = [aStr substringFromIndex:aStr.length - 3];
		aStr = [aStr substringWithRange:NSMakeRange(0, aStr.length - 3)];
		[resStr  insertString:[NSString stringWithFormat:@",%@",aSubStr] atIndex:0];
	}
	[resStr insertString:aStr atIndex:0];
	return resStr;
}
				
+(void) requestURLFromServer:(NSURLRequest*)aRequest resultTarget:(id)target targetFunction:(SEL)function{
	
	ConnectionDelegate *aDelegate = [[[ConnectionDelegate alloc] init] autorelease];
	
	aDelegate.target = target;
	
	aDelegate.callback = function;
	
	[[[NSURLConnection alloc] initWithRequest:aRequest delegate:aDelegate] autorelease];
	
}

+(void) requestJSonFromServer:(NSURLRequest*)aRequest resultTarget:(id)target targetFunction:(SEL)function{
	
	ConnectionDelegate *aDelegate = [[[ConnectionDelegate alloc] initForJson] autorelease];
	
	aDelegate.target = target;
	
	aDelegate.callback = function;
	
	[[[NSURLConnection alloc] initWithRequest:aRequest delegate:aDelegate startImmediately:YES] autorelease];
	
}


+ (NSString*) getObjectURL:(NSString*)responseString forKey:(NSString*)forKey finalDelim:(NSString*)finalDelim{
    NSString* result=[[[NSString alloc] init] autorelease];
    NSScanner *theScanner = [NSScanner scannerWithString:responseString];
    while ([theScanner isAtEnd] == NO){
        [theScanner scanUpToString:forKey intoString:NULL];
        [theScanner scanString:forKey intoString:NULL];
        [theScanner scanUpToString:finalDelim intoString:&result];
    }
    return result;
}

@end
