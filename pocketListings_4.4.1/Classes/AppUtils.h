//
//  AppUtils.h
//  MLS-R-App
//
//  Created by mDeveloper on 9/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "pocketListingsAppDelegate.h"



@interface AppUtils : NSObject {

}

+(pocketListingsAppDelegate*) getAppDelegate;

+(void) requestServer:(NSURLRequest*)aRequest resultTarget:(id)target targetFunction:(SEL)function;  
+(void) requestBinaryDataFromServer:(NSURLRequest*)aRequest resultTarget:(id)target targetFunction:(SEL)function;
+(void) requestURLFromServer:(NSURLRequest*)aRequest resultTarget:(id)target targetFunction:(SEL)function;
+(NSString*)formatFloatStr:(NSString*)aStr;
+(NSString*)formatPrice:(NSString*)aStr;
+ (NSString*) getObjectURL:(NSString*)responseString forKey:(NSString*)forKey finalDelim:(NSString*)finalDelim;
+(void) requestJSonFromServer:(NSURLRequest*)aRequest resultTarget:(id)target targetFunction:(SEL)function;
@end
