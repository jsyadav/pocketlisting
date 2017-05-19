/** 
 * City.m
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
 
// <City>
 	// 	<City></City>
 	// 	<Country></Country>
 	// 	<State></State>
 	// </City>
 
#import  "City.h";
#import  "CXMLNode.h";


@implementation City 
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

@synthesize state_var;
@synthesize state_var_XMLNAME;
- (NSString*) state_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( state_var == nil){
		self.state_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,state_var_XMLNAME] dictionary:nsMappings inNode:xml];
	}
		
    return state_var;
}

@synthesize country_var;
@synthesize country_var_XMLNAME;
- (NSString*) country_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( country_var == nil){
		self.country_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,country_var_XMLNAME] dictionary:nsMappings inNode:xml];
	}
		
    return country_var;
}

@synthesize city_var;
@synthesize city_var_XMLNAME;
- (City*) city_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( city_var == nil){
		id objXML = [XMLUtil getXMLValue:[NSString stringWithFormat:@"%@:%@",prefix,city_var_XMLNAME] dictionary:nsMappings inNode:xml];
		if( objXML != nil){
			self.city_var=[[City   alloc] initWithXML:objXML];
		}
	}
		
    return city_var;
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
		//id var=nil;
		//id res=nil;
	    self.state_var_XMLNAME=@"State";
	self.state_var=nil;
	    self.country_var_XMLNAME=@"Country";
	self.country_var=nil;
	    self.city_var_XMLNAME=@"City";
	self.city_var=nil;
			}
	return self;
}

- (void)dealloc {
	[state_var_XMLNAME release];
	[state_var release];
	[country_var_XMLNAME release];
	[country_var release];
	[city_var_XMLNAME release];
	[city_var release];
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
		
						if(self.state_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.state_var_XMLNAME,self.state_var,self.state_var_XMLNAME];
				 	} 
		  
						if(self.country_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.country_var_XMLNAME,self.country_var,self.country_var_XMLNAME];
				 	} 
		  
						if(self.city_var!=nil){
		    			[serializedForm appendFormat:@"%@", [self.city_var serializeToXMLString:self.city_var_XMLNAME nameSpaces:nameSpaces]];		
				 	} 
		  
			
		return serializedForm;
	}
	
	- (NSString *)getDefaultElementName{
		return @"City";
	}
	- (NSString *)getURI{
		return @"http://www.agentstorm.com/schemas/1.0.xsd";
	}
@end
