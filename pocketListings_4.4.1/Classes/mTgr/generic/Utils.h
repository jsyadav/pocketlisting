//
//  Utils.h
//  retsClient
//
//  Created by Indroniel Deb Roy on 8/9/09.
//  Copyright 2009 mtgr8 Systems Inc.. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Utils : NSObject {

}
+(NSString *) urlencode: (NSString *) url;
+ (void)showErrorAlert:(NSString*)msg;
+(NSString*)formatMinMaxStr:(NSString*)aStr;
+(NSString*) formatMinMaxPrice:(NSString*)aStr;

@end
