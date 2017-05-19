/** 
 * Note.m
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
 
// <Note>
 	// 	<Note></Note>
 	// 	<Date></Date>
 	// 	<UserId></UserId>
 	// </Note>
 
#import  "Note.h";
#import  "CXMLNode.h";


@implementation Note 
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

@synthesize date_var;
@synthesize date_var_XMLNAME;
- (NSString*) date_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( date_var == nil){
		self.date_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,date_var_XMLNAME] dictionary:nsMappings inNode:xml];
	}
		
    return date_var;
}

@synthesize userId_var;
@synthesize userId_var_XMLNAME;
- (NSNumber*) userId_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( userId_var == nil){
		self.userId_var=[XMLUtil getNumberFromString:[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,userId_var_XMLNAME] dictionary:nsMappings inNode:xml]];
	}
		
    return userId_var;
}

@synthesize note_var;
@synthesize note_var_XMLNAME;
- (Note*) note_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( note_var == nil){
		id objXML = [XMLUtil getXMLValue:[NSString stringWithFormat:@"%@:%@",prefix,note_var_XMLNAME] dictionary:nsMappings inNode:xml];
		if( objXML != nil){
			self.note_var=[[Note   alloc] initWithXML:objXML];
		}
	}
		
    return note_var;
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
	    self.date_var_XMLNAME=@"Date";
	self.date_var=nil;
	    self.userId_var_XMLNAME=@"UserId";
	self.userId_var=nil;
	    self.note_var_XMLNAME=@"Note";
	self.note_var=nil;
			}
	return self;
}

- (void)dealloc {
	[date_var_XMLNAME release];
	[date_var release];
	[userId_var_XMLNAME release];
	[userId_var release];
	[note_var_XMLNAME release];
	[note_var release];
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
		
						if(self.date_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.date_var_XMLNAME,self.date_var,self.date_var_XMLNAME];
				 	} 
		  
						if(self.userId_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.userId_var_XMLNAME,[self.userId_var stringValue],self.userId_var_XMLNAME];	
				 	} 
		  
						if(self.note_var!=nil){
		    			[serializedForm appendFormat:@"%@", [self.note_var serializeToXMLString:self.note_var_XMLNAME nameSpaces:nameSpaces]];		
				 	} 
		  
			
		return serializedForm;
	}
	
	- (NSString *)getDefaultElementName{
		return @"Note";
	}
	- (NSString *)getURI{
		return @"";
	}
@end
