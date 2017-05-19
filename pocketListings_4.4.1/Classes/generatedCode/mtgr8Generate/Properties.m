/** 
 * Properties.m
 *
 * Copyright mTgr8 Inc. <2010>  <idebroy@mtgr8.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>
 **/
 
// <Properties>
 	// 	<Property></Property>
 	// </Properties>
 
#import  "Properties.h";
#import  "CXMLNode.h";

#import "Property.h"

@implementation Properties 
@synthesize nsMappings;
@synthesize xml;
@synthesize xmlString;

-(id)initFromXMLString:(NSString*)aStr{
	CXMLDocument *resDoc = [[[CXMLDocument alloc] initWithXMLString:aStr options:0 error:nil] autorelease];
	return [self initWithXML:[resDoc rootElement]];
}

-(NSString*) xmlString{
	if( xmlString == nil){
		self.xmlString = [self serializeToXMLString:nil nameSpaces:nil];
	}
	return xmlString;
}

@synthesize property_var;
@synthesize property_var_XMLNAME;
- (NSMutableArray*) property_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( property_var == nil){
		id resXML= [XMLUtil getXMLValue:[NSString stringWithFormat:@"%@:%@",prefix,property_var_XMLNAME] dictionary:nsMappings inNode:xml];
		if( resXML != nil){
			self.property_var = [[NSMutableArray alloc] init];
			if( [resXML isKindOfClass:[CXMLElement class]]){
									[self.property_var addObject:[[[Property alloc] initWithXML:resXML] autorelease]];		
							}else if( [resXML isKindOfClass:[NSArray class]]){
				for(int i=0;i<[resXML count];i++){
									[self.property_var addObject:[[[Property alloc] initWithXML:[resXML objectAtIndex:i]] autorelease]];		
								}
			}
		}
	}
		
    return property_var;
}


@synthesize elapsedTime_avar;
@synthesize elapsedTime_avar_XMLNAME;
- (NSNumber*) elapsedTime_avar{
		if( elapsedTime_avar == nil){
		self.elapsedTime_avar=[XMLUtil getNumberFromString:[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@",elapsedTime_avar_XMLNAME] dictionary:nsMappings inNode:xml]];
	}
		
    return elapsedTime_avar;
}

@synthesize totalcount_avar;
@synthesize totalcount_avar_XMLNAME;
- (NSNumber*) totalcount_avar{
		if( totalcount_avar == nil){
		self.totalcount_avar=[XMLUtil getNumberFromString:[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@",totalcount_avar_XMLNAME] dictionary:nsMappings inNode:xml]];
	}
		
    return totalcount_avar;
}

@synthesize count_avar;
@synthesize count_avar_XMLNAME;
- (NSNumber*) count_avar{
		if( count_avar == nil){
		self.count_avar=[XMLUtil getNumberFromString:[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@",count_avar_XMLNAME] dictionary:nsMappings inNode:xml]];
	}
		
    return count_avar;
}


- (id)initWithXML:(CXMLNode*)axml { 
	if(self = [super init]){
		nsMappings = [[NSMutableDictionary alloc] init];
		NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];
		if( prefix == nil){
			prefix = [XMLUtil makePrefix:nsMappings];
		}
		[nsMappings setObject:[self getURI] forKey:prefix];
		self.xml=axml;
		id var=nil;
		id res=nil;
	    self.property_var_XMLNAME=@"Property";
	self.property_var=nil;
		    self.elapsedTime_avar_XMLNAME=@"elapsedTime";
	self.elapsedTime_avar=nil;
	    self.totalcount_avar_XMLNAME=@"totalcount";
	self.totalcount_avar=nil;
	    self.count_avar_XMLNAME=@"count";
	self.count_avar=nil;
		}
	return self;
}

- (void)dealloc {
	[property_var_XMLNAME release];
	[property_var release];
	[nsMappings release];
	[xml release];

    [super dealloc];
}

- (NSString *)serializeToXMLString:(NSString *)elemName nameSpaces:(NSMutableDictionary *)nameSpaces{
	
		NSMutableString *serializedForm = [NSMutableString string];
		NSString *prefix = [XMLUtil getNewNSPrefix:nameSpaces forURI:[self getURI]];
		NSString *elName = elemName ? elemName : [self getDefaultElementName];
		if( prefix != nil){
			[serializedForm appendFormat:@"<%@ xmlns=\"%@\"", elName,[self getURI]];
		}
		else{
			[serializedForm appendFormat:@"<%@",elName];
		}
	
		[serializedForm appendString:[self serializedAttributeString]];
		[serializedForm appendFormat:@">"];
		[serializedForm appendString:[self serializedElementString:nameSpaces]];
	
		if( prefix != nil){
			[serializedForm appendFormat:@"</%@>", elName];
		}
		else{
			[serializedForm appendFormat:@"</%@>",elName];
		}
		return serializedForm;
	
	}
	- (NSString *)serializedAttributeString{
		NSMutableString *serializedForm = [NSMutableString string];
				if(self.elapsedTime_avar!=nil){
			[serializedForm appendFormat:@" %@=\"%@\"", self.elapsedTime_avar_XMLNAME ,self.elapsedTime_avar];
	 	} 
				if(self.totalcount_avar!=nil){
			[serializedForm appendFormat:@" %@=\"%@\"", self.totalcount_avar_XMLNAME ,self.totalcount_avar];
	 	} 
				if(self.count_avar!=nil){
			[serializedForm appendFormat:@" %@=\"%@\"", self.count_avar_XMLNAME ,self.count_avar];
	 	} 
				return serializedForm;
	}
	- (NSString *)serializedElementString:(NSMutableDictionary *)nameSpaces
	{
		NSMutableString *serializedForm = [NSMutableString string];
		
						if(self.property_var!=nil){
		    			for(int i=0;i<[self.property_var count];i++){
			    					[serializedForm appendFormat:@"%@", [[self.property_var objectAtIndex:i] serializeToXMLString:self.property_var_XMLNAME nameSpaces:nameSpaces]];		
							}
				 	} 
		  
			
		return serializedForm;
	}
	
	- (NSString *)getDefaultElementName{
		return @"Properties";
	}
	- (NSString *)getURI{
		return @"";
	}
@end
