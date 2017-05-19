/** 
 * Address.m
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
 
// <Address>
 	// 	<Id></Id>
 	// 	<Type></Type>
 	// 	<Street1></Street1>
 	// 	<Street2></Street2>
 	// 	<City></City>
 	// 	<State></State>
 	// 	<Country></Country>
 	// 	<Zip></Zip>
 	// </Address>
 
#import  "Address.h";
#import  "CXMLNode.h";


@implementation Address 
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

@synthesize zip_var;
@synthesize zip_var_XMLNAME;
- (NSString*) zip_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( zip_var == nil){
		self.zip_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,zip_var_XMLNAME] dictionary:nsMappings inNode:xml];
	}
		
    return zip_var;
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

@synthesize state_var;
@synthesize state_var_XMLNAME;
- (NSString*) state_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( state_var == nil){
		self.state_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,state_var_XMLNAME] dictionary:nsMappings inNode:xml];
	}
		
    return state_var;
}

@synthesize street2_var;
@synthesize street2_var_XMLNAME;
- (Street2*) street2_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( street2_var == nil){
		id objXML = [XMLUtil getXMLValue:[NSString stringWithFormat:@"%@:%@",prefix,street2_var_XMLNAME] dictionary:nsMappings inNode:xml];
		if( objXML != nil){
			self.street2_var=[[Street2   alloc] initWithXML:objXML];
		}
	}
		
    return street2_var;
}

@synthesize street1_var;
@synthesize street1_var_XMLNAME;
- (NSString*) street1_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( street1_var == nil){
		self.street1_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,street1_var_XMLNAME] dictionary:nsMappings inNode:xml];
	}
		
    return street1_var;
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
- (NSString*) city_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( city_var == nil){
		self.city_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,city_var_XMLNAME] dictionary:nsMappings inNode:xml];
	}
		
    return city_var;
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
	    self.zip_var_XMLNAME=@"Zip";
	self.zip_var=nil;
	    self.type_var_XMLNAME=@"Type";
	self.type_var=nil;
	    self.state_var_XMLNAME=@"State";
	self.state_var=nil;
	    self.street2_var_XMLNAME=@"Street2";
	self.street2_var=nil;
	    self.street1_var_XMLNAME=@"Street1";
	self.street1_var=nil;
	    self.country_var_XMLNAME=@"Country";
	self.country_var=nil;
	    self.city_var_XMLNAME=@"City";
	self.city_var=nil;
	    self.id_var_XMLNAME=@"Id";
	self.id_var=nil;
			}
	return self;
}

- (void)dealloc {
	[zip_var_XMLNAME release];
	[zip_var release];
	[type_var_XMLNAME release];
	[type_var release];
	[state_var_XMLNAME release];
	[state_var release];
	[street2_var_XMLNAME release];
	[street2_var release];
	[street1_var_XMLNAME release];
	[street1_var release];
	[country_var_XMLNAME release];
	[country_var release];
	[city_var_XMLNAME release];
	[city_var release];
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
		
						if(self.zip_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.zip_var_XMLNAME,self.zip_var,self.zip_var_XMLNAME];
				 	} 
		  
						if(self.type_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.type_var_XMLNAME,self.type_var,self.type_var_XMLNAME];
				 	} 
		  
						if(self.state_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.state_var_XMLNAME,self.state_var,self.state_var_XMLNAME];
				 	} 
		  
						if(self.street2_var!=nil){
		    			[serializedForm appendFormat:@"<%@ %@>%@</%@>", self.street2_var_XMLNAME,[self.street2_var serializedAttributeString],[[self.street2_var xml] stringValue],self.street2_var_XMLNAME];
				 	} 
		  
						if(self.street1_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.street1_var_XMLNAME,self.street1_var,self.street1_var_XMLNAME];
				 	} 
		  
						if(self.country_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.country_var_XMLNAME,self.country_var,self.country_var_XMLNAME];
				 	} 
		  
						if(self.city_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.city_var_XMLNAME,self.city_var,self.city_var_XMLNAME];
				 	} 
		  
						if(self.id_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.id_var_XMLNAME,self.id_var,self.id_var_XMLNAME];
				 	} 
		  
			
		return serializedForm;
	}
	
	- (NSString *)getDefaultElementName{
		return @"Address";
	}
	- (NSString *)getURI{
		return @"";
	}
@end
