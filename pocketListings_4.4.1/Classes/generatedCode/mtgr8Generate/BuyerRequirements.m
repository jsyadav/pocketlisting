/** 
 * BuyerRequirements.m
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
 
// <BuyerRequirements>
 	// 	<PriceFrom></PriceFrom>
 	// 	<PriceTo></PriceTo>
 	// </BuyerRequirements>
 
#import  "BuyerRequirements.h";
#import  "CXMLNode.h";


@implementation BuyerRequirements 
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

@synthesize priceFrom_var;
@synthesize priceFrom_var_XMLNAME;
- (NSNumber*) priceFrom_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( priceFrom_var == nil){
		self.priceFrom_var=[XMLUtil getNumberFromString:[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,priceFrom_var_XMLNAME] dictionary:nsMappings inNode:xml]];
	}
		
    return priceFrom_var;
}

@synthesize priceTo_var;
@synthesize priceTo_var_XMLNAME;
- (NSNumber*) priceTo_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( priceTo_var == nil){
		self.priceTo_var=[XMLUtil getNumberFromString:[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,priceTo_var_XMLNAME] dictionary:nsMappings inNode:xml]];
	}
		
    return priceTo_var;
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
	    self.priceFrom_var_XMLNAME=@"PriceFrom";
	self.priceFrom_var=nil;
	    self.priceTo_var_XMLNAME=@"PriceTo";
	self.priceTo_var=nil;
			}
	return self;
}

- (void)dealloc {
	[priceFrom_var_XMLNAME release];
	[priceFrom_var release];
	[priceTo_var_XMLNAME release];
	[priceTo_var release];
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
		
						if(self.priceFrom_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.priceFrom_var_XMLNAME,[self.priceFrom_var stringValue],self.priceFrom_var_XMLNAME];	
				 	} 
		  
						if(self.priceTo_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.priceTo_var_XMLNAME,[self.priceTo_var stringValue],self.priceTo_var_XMLNAME];	
				 	} 
		  
			
		return serializedForm;
	}
	
	- (NSString *)getDefaultElementName{
		return @"BuyerRequirements";
	}
	- (NSString *)getURI{
		return @"";
	}
@end
