/** 
 * PhoneNumbers.m
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
 
// <PhoneNumbers>
 	// 	<PhoneNumber></PhoneNumber>
 	// </PhoneNumbers>
 
#import  "PhoneNumbers.h";
#import  "CXMLNode.h";

#import "PhoneNumber.h"

@implementation PhoneNumbers 
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

@synthesize phoneNumber_var;
@synthesize phoneNumber_var_XMLNAME;
- (NSMutableArray*) phoneNumber_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( phoneNumber_var == nil){
		id resXML= [XMLUtil getXMLValue:[NSString stringWithFormat:@"%@:%@",prefix,phoneNumber_var_XMLNAME] dictionary:nsMappings inNode:xml];
		if( resXML != nil){
			self.phoneNumber_var = [[NSMutableArray alloc] init];
			if( [resXML isKindOfClass:[CXMLElement class]]){
									[self.phoneNumber_var addObject:[[[PhoneNumber alloc] initWithXML:resXML] autorelease]];		
							}else if( [resXML isKindOfClass:[NSArray class]]){
				for(int i=0;i<[resXML count];i++){
									[self.phoneNumber_var addObject:[[[PhoneNumber alloc] initWithXML:[resXML objectAtIndex:i]] autorelease]];		
								}
			}
		}
	}
		
    return phoneNumber_var;
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
	    self.phoneNumber_var_XMLNAME=@"PhoneNumber";
	self.phoneNumber_var=nil;
			}
	return self;
}

- (void)dealloc {
	[phoneNumber_var_XMLNAME release];
	[phoneNumber_var release];
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
		
						if(self.phoneNumber_var!=nil){
		    			for(int i=0;i<[self.phoneNumber_var count];i++){
			    					[serializedForm appendFormat:@"%@", [[self.phoneNumber_var objectAtIndex:i] serializeToXMLString:self.phoneNumber_var_XMLNAME nameSpaces:nameSpaces]];		
							}
				 	} 
		  
			
		return serializedForm;
	}
	
	- (NSString *)getDefaultElementName{
		return @"PhoneNumbers";
	}
	- (NSString *)getURI{
		return @"";
	}
@end
