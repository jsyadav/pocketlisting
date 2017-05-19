/** 
 * OpenHouses.m
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
 
// <OpenHouses>
 	// 	<OpenHouse></OpenHouse>
 	// </OpenHouses>
 
#import  "OpenHouses.h";
#import  "CXMLNode.h";

#import "OpenHouse.h"

@implementation OpenHouses 
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

@synthesize openHouse_var;
@synthesize openHouse_var_XMLNAME;
- (NSMutableArray*) openHouse_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( openHouse_var == nil){
		id resXML= [XMLUtil getXMLValue:[NSString stringWithFormat:@"%@:%@",prefix,openHouse_var_XMLNAME] dictionary:nsMappings inNode:xml];
		if( resXML != nil){
			self.openHouse_var = [[NSMutableArray alloc] init];
			if( [resXML isKindOfClass:[CXMLElement class]]){
									[self.openHouse_var addObject:[[[OpenHouse alloc] initWithXML:resXML] autorelease]];		
							}else if( [resXML isKindOfClass:[NSArray class]]){
				for(int i=0;i<[resXML count];i++){
									[self.openHouse_var addObject:[[[OpenHouse alloc] initWithXML:[resXML objectAtIndex:i]] autorelease]];		
								}
			}
		}
	}
		
    return openHouse_var;
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
	    self.openHouse_var_XMLNAME=@"OpenHouse";
	self.openHouse_var=nil;
			}
	return self;
}

- (void)dealloc {
	[openHouse_var_XMLNAME release];
	[openHouse_var release];
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
				return serializedForm;
	}
	- (NSString *)serializedElementString:(NSMutableDictionary *)nameSpaces
	{
		NSMutableString *serializedForm = [NSMutableString string];
		
						if(self.openHouse_var!=nil){
		    			for(int i=0;i<[self.openHouse_var count];i++){
			    					[serializedForm appendFormat:@"%@", [[self.openHouse_var objectAtIndex:i] serializeToXMLString:self.openHouse_var_XMLNAME nameSpaces:nameSpaces]];		
							}
				 	} 
		  
			
		return serializedForm;
	}
	
	- (NSString *)getDefaultElementName{
		return @"OpenHouses";
	}
	- (NSString *)getURI{
		return @"";
	}
@end
