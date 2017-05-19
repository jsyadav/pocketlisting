/** 
 * PhoneNumber.m
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
 
// <PhoneNumber>
 	// 	<Id></Id>
 	// 	<Type></Type>
 	// 	<Country></Country>
 	// 	<Number></Number>
 	// </PhoneNumber>
 
#import  "PhoneNumber.h";
#import  "CXMLNode.h";


@implementation PhoneNumber 
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

@synthesize type_var;
@synthesize type_var_XMLNAME;
- (NSString*) type_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( type_var == nil){
		self.type_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,type_var_XMLNAME] dictionary:nsMappings inNode:xml];
	}
		
    return type_var;
}

@synthesize number_var;
@synthesize number_var_XMLNAME;
- (NSNumber*) number_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( number_var == nil){
		self.number_var=[XMLUtil getNumberFromString:[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,number_var_XMLNAME] dictionary:nsMappings inNode:xml]];
	}
		
    return number_var;
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

@synthesize id_var;
@synthesize id_var_XMLNAME;
- (NSString*) id_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( id_var == nil){
		self.id_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,id_var_XMLNAME] dictionary:nsMappings inNode:xml];
	}
		
    return id_var;
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
	    self.type_var_XMLNAME=@"Type";
	self.type_var=nil;
	    self.number_var_XMLNAME=@"Number";
	self.number_var=nil;
	    self.country_var_XMLNAME=@"Country";
	self.country_var=nil;
	    self.id_var_XMLNAME=@"Id";
	self.id_var=nil;
			}
	return self;
}

- (void)dealloc {
	[type_var_XMLNAME release];
	[type_var release];
	[number_var_XMLNAME release];
	[number_var release];
	[country_var_XMLNAME release];
	[country_var release];
	[id_var_XMLNAME release];
	[id_var release];
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
		
						if(self.type_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.type_var_XMLNAME,self.type_var,self.type_var_XMLNAME];
				 	} 
		  
						if(self.number_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.number_var_XMLNAME,[self.number_var stringValue],self.number_var_XMLNAME];	
				 	} 
		  
						if(self.country_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.country_var_XMLNAME,self.country_var,self.country_var_XMLNAME];
				 	} 
		  
						if(self.id_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.id_var_XMLNAME,self.id_var,self.id_var_XMLNAME];
				 	} 
		  
			
		return serializedForm;
	}
	
	- (NSString *)getDefaultElementName{
		return @"PhoneNumber";
	}
	- (NSString *)getURI{
		return @"";
	}
@end
