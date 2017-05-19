/** 
 * Company.m
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
 
// <Company>
 	// 	<Id></Id>
 	// 	<Name></Name>
 	// 	<Industry></Industry>
 	// 	<Image></Image>
 	// </Company>
 
#import  "Company.h";
#import  "CXMLNode.h";


@implementation Company 
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

@synthesize name_var;
@synthesize name_var_XMLNAME;
- (NSString*) name_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( name_var == nil){
		self.name_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,name_var_XMLNAME] dictionary:nsMappings inNode:xml];
	}
		
    return name_var;
}

@synthesize image_var;
@synthesize image_var_XMLNAME;
- (NSString*) image_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( image_var == nil){
		self.image_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,image_var_XMLNAME] dictionary:nsMappings inNode:xml];
	}
		
    return image_var;
}

@synthesize industry_var;
@synthesize industry_var_XMLNAME;
- (Industry*) industry_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( industry_var == nil){
		id objXML = [XMLUtil getXMLValue:[NSString stringWithFormat:@"%@:%@",prefix,industry_var_XMLNAME] dictionary:nsMappings inNode:xml];
		if( objXML != nil){
			self.industry_var=[[Industry   alloc] initWithXML:objXML];
		}
	}
		
    return industry_var;
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
	    self.name_var_XMLNAME=@"Name";
	self.name_var=nil;
	    self.image_var_XMLNAME=@"Image";
	self.image_var=nil;
	    self.industry_var_XMLNAME=@"Industry";
	self.industry_var=nil;
	    self.id_var_XMLNAME=@"Id";
	self.id_var=nil;
			}
	return self;
}

- (void)dealloc {
	[name_var_XMLNAME release];
	[name_var release];
	[image_var_XMLNAME release];
	[image_var release];
	[industry_var_XMLNAME release];
	[industry_var release];
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
		
						if(self.name_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.name_var_XMLNAME,self.name_var,self.name_var_XMLNAME];
				 	} 
		  
						if(self.image_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.image_var_XMLNAME,self.image_var,self.image_var_XMLNAME];
				 	} 
		  
						if(self.industry_var!=nil){
		    			[serializedForm appendFormat:@"%@", [self.industry_var serializeToXMLString:self.industry_var_XMLNAME nameSpaces:nameSpaces]];		
				 	} 
		  
						if(self.id_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.id_var_XMLNAME,self.id_var,self.id_var_XMLNAME];
				 	} 
		  
			
		return serializedForm;
	}
	
	- (NSString *)getDefaultElementName{
		return @"Company";
	}
	- (NSString *)getURI{
		return @"";
	}
@end
