/** 
 * OpenHouse.m
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
 
// <OpenHouse>
 	// 	<OpenHousePublicRemarks></OpenHousePublicRemarks>
 	// 	<StartDateTime></StartDateTime>
 	// 	<EndDateTime></EndDateTime>
 	// 	<PropertyID></PropertyID>
 	// 	<ListingID></ListingID>
 	// 	<OpenHouseID></OpenHouseID>
 	// </OpenHouse>
 
#import  "OpenHouse.h";
#import  "CXMLNode.h";


@implementation OpenHouse 
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

@synthesize startDateTime_var;
@synthesize startDateTime_var_XMLNAME;
- (NSString*) startDateTime_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( startDateTime_var == nil){
		self.startDateTime_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,startDateTime_var_XMLNAME] dictionary:nsMappings inNode:xml];
	}
		
    return startDateTime_var;
}

@synthesize openHouseID_var;
@synthesize openHouseID_var_XMLNAME;
- (NSString*) openHouseID_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( openHouseID_var == nil){
		self.openHouseID_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,openHouseID_var_XMLNAME] dictionary:nsMappings inNode:xml];
	}
		
    return openHouseID_var;
}

@synthesize endDateTime_var;
@synthesize endDateTime_var_XMLNAME;
- (NSString*) endDateTime_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( endDateTime_var == nil){
		self.endDateTime_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,endDateTime_var_XMLNAME] dictionary:nsMappings inNode:xml];
	}
		
    return endDateTime_var;
}

@synthesize openHousePublicRemarks_var;
@synthesize openHousePublicRemarks_var_XMLNAME;
- (NSString*) openHousePublicRemarks_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( openHousePublicRemarks_var == nil){
		self.openHousePublicRemarks_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,openHousePublicRemarks_var_XMLNAME] dictionary:nsMappings inNode:xml];
	}
		
    return openHousePublicRemarks_var;
}

@synthesize listingID_var;
@synthesize listingID_var_XMLNAME;
- (NSString*) listingID_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( listingID_var == nil){
		self.listingID_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,listingID_var_XMLNAME] dictionary:nsMappings inNode:xml];
	}
		
    return listingID_var;
}

@synthesize propertyID_var;
@synthesize propertyID_var_XMLNAME;
- (NSString*) propertyID_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( propertyID_var == nil){
		self.propertyID_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,propertyID_var_XMLNAME] dictionary:nsMappings inNode:xml];
	}
		
    return propertyID_var;
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
	    self.startDateTime_var_XMLNAME=@"StartDateTime";
	self.startDateTime_var=nil;
	    self.openHouseID_var_XMLNAME=@"OpenHouseID";
	self.openHouseID_var=nil;
	    self.endDateTime_var_XMLNAME=@"EndDateTime";
	self.endDateTime_var=nil;
	    self.openHousePublicRemarks_var_XMLNAME=@"OpenHousePublicRemarks";
	self.openHousePublicRemarks_var=nil;
	    self.listingID_var_XMLNAME=@"ListingID";
	self.listingID_var=nil;
	    self.propertyID_var_XMLNAME=@"PropertyID";
	self.propertyID_var=nil;
			}
	return self;
}

- (void)dealloc {
	[startDateTime_var_XMLNAME release];
	[startDateTime_var release];
	[openHouseID_var_XMLNAME release];
	[openHouseID_var release];
	[endDateTime_var_XMLNAME release];
	[endDateTime_var release];
	[openHousePublicRemarks_var_XMLNAME release];
	[openHousePublicRemarks_var release];
	[listingID_var_XMLNAME release];
	[listingID_var release];
	[propertyID_var_XMLNAME release];
	[propertyID_var release];
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
		
						if(self.startDateTime_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.startDateTime_var_XMLNAME,self.startDateTime_var,self.startDateTime_var_XMLNAME];
				 	} 
		  
						if(self.openHouseID_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.openHouseID_var_XMLNAME,self.openHouseID_var,self.openHouseID_var_XMLNAME];
				 	} 
		  
						if(self.endDateTime_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.endDateTime_var_XMLNAME,self.endDateTime_var,self.endDateTime_var_XMLNAME];
				 	} 
		  
						if(self.openHousePublicRemarks_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.openHousePublicRemarks_var_XMLNAME,self.openHousePublicRemarks_var,self.openHousePublicRemarks_var_XMLNAME];
				 	} 
		  
						if(self.listingID_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.listingID_var_XMLNAME,self.listingID_var,self.listingID_var_XMLNAME];
				 	} 
		  
						if(self.propertyID_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.propertyID_var_XMLNAME,self.propertyID_var,self.propertyID_var_XMLNAME];
				 	} 
		  
			
		return serializedForm;
	}
	
	- (NSString *)getDefaultElementName{
		return @"OpenHouse";
	}
	- (NSString *)getURI{
		return @"";
	}
@end
