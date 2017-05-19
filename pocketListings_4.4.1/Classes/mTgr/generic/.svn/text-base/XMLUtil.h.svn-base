//
//  XMLUtil.h
//  Alerts
//
//  Created by Indroniel Deb Roy on 5/21/09.
//  Copyright 2009 mtgr8 Systems Inc.. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TouchXML.h"



@interface XMLUtil : NSObject {
	
}

+ (id)getXMLValue:(NSString *)name dictionary:(NSDictionary*)dic    inNode:(CXMLNode*)node;
+ (NSString*)getXMLStringValue:(NSString *)name dictionary:(NSDictionary*)dic inNode:(CXMLNode*)node;
+ (id)getXMLValue:(NSString *)name inNode:(CXMLNode*)node;
+ (NSString*)getXMLStringValue:(NSString *)name inNode:(CXMLNode*)node;
+ (NSString*)getDataXMLStringValue:(NSString *)name inNode:(CXMLNode*)node;
+ (NSNumber*)getNumberFromString:(NSString *)aString;
+ (NSString *)getNewNSPrefix:(NSMutableDictionary *)nsMappings forURI:(NSString *)uri;
+ (NSDate*)getDateForString:(NSString*)str;
+ (NSString*)getStringFromDate:(NSDate*)date;
+ (BOOL)getBoolForString:(NSString*)str;
+ (BOOL)isNodeNil:(CXMLNode*)lNode;
+(NSMutableDictionary*) newParseDataDictionary:(NSString*)header data:(NSString*)data delim:(NSString*)delim;
+(NSString*)makePrefix:(NSDictionary*)dic;
+ (NSString*)getPrefix:(NSString*)nsURI  dictionary:(NSDictionary*)dic;

@end
