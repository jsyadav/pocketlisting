//
//  XMLUtil.m
//  Alerts
//
//  Created by Indroniel Deb Roy on 5/21/09.
//  Copyright 2009 mtgr8 Systems Inc.. All rights reserved.
//

#import "XMLUtil.h"


@implementation XMLUtil

+ (NSString*)getPrefix:(NSString*)nsURI  dictionary:(NSDictionary*)dic{
	NSArray* allKeys=[dic allKeys]; //leak
	for(int i=0;i<allKeys.count;i++){
		NSString* key = [allKeys objectAtIndex:i];
		NSString* value = [dic objectForKey:key];
		if( [value isEqualToString:nsURI]){
			return key;
		}
	}
	return nil;
}

+(NSString*)makePrefix:(NSDictionary*)dic{
	NSArray* allKeys=[dic allKeys];
	return [NSString stringWithFormat:@"ns%d",allKeys.count];	//leak
}


+ (id)getXMLValue:(NSString *)name dictionary:(NSDictionary*)dic   inNode:(CXMLNode*)node{
	id ret=nil;
	//NSArray* resultNodes = [node nodesForXPath:[NSString stringWithFormat:@"%@",name] error:nil];
	NSArray* resultNodes = [node nodesForXPath:[NSString stringWithFormat:@"%@",name] namespaceMappings:dic error:nil];
	if( resultNodes.count == 0){
		// the named element is not found...
		// try as an attribute
		resultNodes = [node nodesForXPath:[NSString stringWithFormat:@"@%@",name] namespaceMappings:dic error:nil]; 
		if(resultNodes.count == 0){
			//it's not found...
			//return nil;
		}else{
			ret= [resultNodes objectAtIndex:0];
		}
	}else if( resultNodes.count > 1){
		ret= resultNodes;
	}else{
		id lNode = [resultNodes objectAtIndex:0];
		if([XMLUtil isNodeNil:lNode]){
			//return nil;
		}
		ret= lNode;
	}
	
	if(ret == nil){
		NSRange range=[name rangeOfString:@":"];
		if(range.location != -1 && range.location < name.length){
			name = [name substringFromIndex:range.location+1];	
		}
		ret = [XMLUtil getXMLValue:name inNode:node];	
	}
	
	return ret;
}

+ (BOOL)isNodeNil:(CXMLNode*)lNode{
	if( [lNode isKindOfClass:[CXMLElement class]]){
		CXMLElement* lElem = (CXMLElement*)lNode;
		NSArray* arr=[lElem attributes];
		for( int i=0;i<arr.count;i++){
			//NSLog(@"___________________________________________");
//			NSLog([[arr objectAtIndex:i] stringValue]);
//			NSLog([[arr objectAtIndex:i] URI]);	
//			NSLog([[arr objectAtIndex:i] prefix]);
//			NSLog([[arr objectAtIndex:i] localName]);
//			NSLog(@"___________________________________________");
			CXMLNode* aAttr=[arr objectAtIndex:i];
			if( [[aAttr localName] isEqual:@"nil"]){
				if([[aAttr URI] isEqual:@"http://www.w3.org/2001/XMLSchema-instance"]){
					if( [[aAttr stringValue] isEqual:@"true"] ){
						return YES;
					}
				}
			}
		}
	}
	return NO;
}

+ (id)getXMLValue:(NSString *)name inNode:(CXMLNode*)node{
	
	NSArray* resultNodes = [node nodesForXPath:[NSString stringWithFormat:@"%@",name] error:nil];
	if( resultNodes.count == 0){
		// the named element is not found...
		// try as an attribute
		resultNodes = [node nodesForXPath:[NSString stringWithFormat:@"@%@",name] error:nil]; 
		if(resultNodes.count == 0){
			//it's not found...
			return nil;
		}else{
			return [resultNodes objectAtIndex:0]; 
		}
	}else if( resultNodes.count > 1){
		return resultNodes;
	}else{
		return [resultNodes objectAtIndex:0];
	}
	
	return nil;
}

+ (id)getDataXMLValue:(NSString *)name inNode:(CXMLNode*)node{
	
	NSArray* resultNodes = [node nodesForXPath:[NSString stringWithFormat:@"%@",name] error:nil];
	if( resultNodes.count == 0){
		// the named element is not found...
		// try as an attribute
		resultNodes = [node nodesForXPath:[NSString stringWithFormat:@"@%@",name] error:nil]; 
		if(resultNodes.count == 0){
			//it's not found...
			return nil;
		}else{
			return [resultNodes objectAtIndex:0]; 
		}
	}else if( resultNodes.count > 1){
		return [resultNodes objectAtIndex:0];
	}else{
		return [resultNodes objectAtIndex:0];
	}
	
	return nil;
}

+ (NSString*)getXMLStringValue:(NSString *)name dictionary:(NSDictionary*)dic inNode:(CXMLNode*)node{
	return [[XMLUtil getXMLValue:name dictionary:dic inNode:node] stringValue];
}

+ (NSString*)getXMLStringValue:(NSString *)name inNode:(CXMLNode*)node{
	return [[XMLUtil getXMLValue:name inNode:node] stringValue]; //leak
}

+ (NSString*)getDataXMLStringValue:(NSString *)name inNode:(CXMLNode*)node{
	return [[XMLUtil getDataXMLValue:name inNode:node] stringValue];
}

+ (NSNumber*)getNumberFromString:(NSString *)aString{
	if ( aString != nil){
		NSScanner *theScanner= [NSScanner scannerWithString:aString];
		double num;
		BOOL scanResult = [theScanner scanDouble:&num];
		if (scanResult == NO) {
			return nil;
		}
		NSNumber* lNumber = [[NSNumber alloc] initWithDouble:num];
		
		[lNumber autorelease];
		
		return lNumber;
	}else{
		return nil;
	}
}

+ (NSString *)getNewNSPrefix:(NSMutableDictionary *)nsMappings forURI:(NSString *)uri{
	NSString* aPrx =[nsMappings objectForKey:uri];
	if( aPrx == nil){
		// we need to come up with new prefix and add to mappings
		NSArray* keys =[[nsMappings keyEnumerator] allObjects];
		int count = [ keys count];
		
		aPrx = [NSString stringWithFormat:@"ns%d",count];
		[nsMappings setObject:aPrx forKey:uri];
		
		return aPrx;
	}
	return nil;
}

//+ (NSDate*)getDateForString:(NSString*)str{
//	NSString* aCalenderFormat = @"%Y-%m-%dT%H:%M:%S";
//	NSDateFormatter *dateFormat = [[[NSDateFormatter alloc]
//								   initWithDateFormat:aCalenderFormat allowNaturalLanguage:NO] autorelease];
//	return [dateFormat dateFromString:str];
//	//return [NSCalendar dateWithString:str calendarFormat:aCalenderFormat];
//}
//
//+ (NSString*)getStringFromDate:(NSDate*)date{
//	NSString* aCalenderFormat = @"%Y-%m-%dT%H:%M:%S";
//	NSDateFormatter *dateFormat = [[[NSDateFormatter alloc]
//									initWithDateFormat:aCalenderFormat allowNaturalLanguage:NO] autorelease];
//	return [dateFormat stringFromDate:date];
//}

+ (NSDate*)getDateForString:(NSString*)str{
	NSDateFormatter *dateFormat = [[[NSDateFormatter alloc]
									init] autorelease];
	[dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:SS"];
	return [dateFormat dateFromString:str];
}

+ (NSString*)getStringFromDate:(NSDate*)date{
	NSDateFormatter *dateFormat = [[[NSDateFormatter alloc]
									init] autorelease];
	[dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:SS"];
	return [dateFormat stringFromDate:date];
}

+ (BOOL)getBoolForString:(NSString*)str{
	if([str isEqual:@"true"] || [str isEqual:@"TRUE"]){
		return YES;
	}
	return NO;
}

+(NSMutableDictionary*) newParseDataDictionary:(NSString*)header data:(NSString*)data delim:(NSString*)delim {
    // NSScanner *aHeaderScanner = [NSScanner scannerWithString:header];
    // NSScanner *aDataScanner = [NSScanner scannerWithString:data];
    
	NSArray* headers = [header componentsSeparatedByString:delim];
	NSArray* values = [data componentsSeparatedByString:delim];
	NSMutableDictionary* aDic = [[NSMutableDictionary alloc] init];//MemLeak2
    
    /* while ([aHeaderScanner isAtEnd] == NO) {
	 NSString* colName;
	 NSString* colValue;
	 [aHeaderScanner scanUpToString:delim intoString:&colName];
	 [aDataScanner scanUpToString:delim intoString:&colValue];
	 
	 if( colName != nil){
	 [aDic setObject:colValue forKey:colName];
	 */
    if( headers.count == values.count ){
        for(int i=0;i<headers.count;i++){
            [aDic setObject:[values objectAtIndex:i] forKey:[headers objectAtIndex:i]];
        }
        
	}
	return aDic;
    [aDic release];
	
}


@end
