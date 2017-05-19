/** 
 * Contact.m
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
 
// <Contact>
 	// 	<Id></Id>
 	// 	<Name></Name>
 	// 	<ContactSource></ContactSource>
 	// 	<JobTitle></JobTitle>
 	// 	<Background></Background>
 	// 	<CompanyId></CompanyId>
 	// 	<Image></Image>
 	// 	<Company></Company>
 	// 	<Addresses></Addresses>
 	// 	<EmailAddresses></EmailAddresses>
 	// 	<PhoneNumbers></PhoneNumbers>
 	// 	<SecondaryContacts></SecondaryContacts>
 	// 	<BuyerRequirements></BuyerRequirements>
 	// 	<Notes></Notes>
 	// </Contact>
 
#import  "Contact.h"
#import  "CXMLNode.h"


@implementation Contact 
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

@synthesize secondaryContacts_var;
@synthesize secondaryContacts_var_XMLNAME;
- (SecondaryContacts*) secondaryContacts_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( secondaryContacts_var == nil){
		id objXML = [XMLUtil getXMLValue:[NSString stringWithFormat:@"%@:%@",prefix,secondaryContacts_var_XMLNAME] dictionary:nsMappings inNode:xml];
		if( objXML != nil){
			self.secondaryContacts_var=[[SecondaryContacts   alloc] initWithXML:objXML];
		}
	}
		
    return secondaryContacts_var;
}

@synthesize background_var;
@synthesize background_var_XMLNAME;
- (NSString*) background_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( background_var == nil){
		self.background_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,background_var_XMLNAME] dictionary:nsMappings inNode:xml];
	}
		
    return background_var;
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

@synthesize id_var;
@synthesize id_var_XMLNAME;
- (NSString*) id_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( id_var == nil){
		self.id_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,id_var_XMLNAME] dictionary:nsMappings inNode:xml];
	}
		
    return id_var;
}

@synthesize buyerRequirements_var;
@synthesize buyerRequirements_var_XMLNAME;
- (BuyerRequirements*) buyerRequirements_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( buyerRequirements_var == nil){
		id objXML = [XMLUtil getXMLValue:[NSString stringWithFormat:@"%@:%@",prefix,buyerRequirements_var_XMLNAME] dictionary:nsMappings inNode:xml];
		if( objXML != nil){
			self.buyerRequirements_var=[[BuyerRequirements   alloc] initWithXML:objXML];
		}
	}
		
    return buyerRequirements_var;
}

@synthesize emailAddresses_var;
@synthesize emailAddresses_var_XMLNAME;
- (EmailAddresses*) emailAddresses_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( emailAddresses_var == nil){
		id objXML = [XMLUtil getXMLValue:[NSString stringWithFormat:@"%@:%@",prefix,emailAddresses_var_XMLNAME] dictionary:nsMappings inNode:xml];
		if( objXML != nil){
			self.emailAddresses_var=[[EmailAddresses   alloc] initWithXML:objXML];
		}
	}
		
    return emailAddresses_var;
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

@synthesize addresses_var;
@synthesize addresses_var_XMLNAME;
- (Addresses*) addresses_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( addresses_var == nil){
		id objXML = [XMLUtil getXMLValue:[NSString stringWithFormat:@"%@:%@",prefix,addresses_var_XMLNAME] dictionary:nsMappings inNode:xml];
		if( objXML != nil){
			self.addresses_var=[[Addresses   alloc] initWithXML:objXML];
		}
	}
		
    return addresses_var;
}

@synthesize contactSource_var;
@synthesize contactSource_var_XMLNAME;
- (NSString*) contactSource_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( contactSource_var == nil){
		self.contactSource_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,contactSource_var_XMLNAME] dictionary:nsMappings inNode:xml];
	}
		
    return contactSource_var;
}

@synthesize phoneNumbers_var;
@synthesize phoneNumbers_var_XMLNAME;
- (PhoneNumbers*) phoneNumbers_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( phoneNumbers_var == nil){
		id objXML = [XMLUtil getXMLValue:[NSString stringWithFormat:@"%@:%@",prefix,phoneNumbers_var_XMLNAME] dictionary:nsMappings inNode:xml];
		if( objXML != nil){
			self.phoneNumbers_var=[[PhoneNumbers   alloc] initWithXML:objXML];
		}
	}
		
    return phoneNumbers_var;
}

@synthesize notes_var;
@synthesize notes_var_XMLNAME;
- (Notes*) notes_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( notes_var == nil){
		id objXML = [XMLUtil getXMLValue:[NSString stringWithFormat:@"%@:%@",prefix,notes_var_XMLNAME] dictionary:nsMappings inNode:xml];
		if( objXML != nil){
			self.notes_var=[[Notes   alloc] initWithXML:objXML];
		}
	}
		
    return notes_var;
}

@synthesize company_var;
@synthesize company_var_XMLNAME;
- (Company*) company_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( company_var == nil){
		id objXML = [XMLUtil getXMLValue:[NSString stringWithFormat:@"%@:%@",prefix,company_var_XMLNAME] dictionary:nsMappings inNode:xml];
		if( objXML != nil){
			self.company_var=[[Company   alloc] initWithXML:objXML];
		}
	}
		
    return company_var;
}

@synthesize jobTitle_var;
@synthesize jobTitle_var_XMLNAME;
- (NSString*) jobTitle_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( jobTitle_var == nil){
		self.jobTitle_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,jobTitle_var_XMLNAME] dictionary:nsMappings inNode:xml];
	}
		
    return jobTitle_var;
}

@synthesize companyId_var;
@synthesize companyId_var_XMLNAME;
- (NSNumber*) companyId_var{
	   NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
		if( companyId_var == nil){
		self.companyId_var=[XMLUtil getNumberFromString:[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,companyId_var_XMLNAME] dictionary:nsMappings inNode:xml]];
	}
		
    return companyId_var;
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
	    self.secondaryContacts_var_XMLNAME=@"SecondaryContacts";
	self.secondaryContacts_var=nil;
	    self.background_var_XMLNAME=@"Background";
	self.background_var=nil;
	    self.name_var_XMLNAME=@"Name";
	self.name_var=nil;
	    self.id_var_XMLNAME=@"Id";
	self.id_var=nil;
	    self.buyerRequirements_var_XMLNAME=@"BuyerRequirements";
	self.buyerRequirements_var=nil;
	    self.emailAddresses_var_XMLNAME=@"EmailAddresses";
	self.emailAddresses_var=nil;
	    self.image_var_XMLNAME=@"Image";
	self.image_var=nil;
	    self.addresses_var_XMLNAME=@"Addresses";
	self.addresses_var=nil;
	    self.contactSource_var_XMLNAME=@"ContactSource";
	self.contactSource_var=nil;
	    self.phoneNumbers_var_XMLNAME=@"PhoneNumbers";
	self.phoneNumbers_var=nil;
	    self.notes_var_XMLNAME=@"Notes";
	self.notes_var=nil;
	    self.company_var_XMLNAME=@"Company";
	self.company_var=nil;
	    self.jobTitle_var_XMLNAME=@"JobTitle";
	self.jobTitle_var=nil;
	    self.companyId_var_XMLNAME=@"CompanyId";
	self.companyId_var=nil;
			}
	return self;
}

- (void)dealloc {
	[secondaryContacts_var_XMLNAME release];
	[secondaryContacts_var release];
	[background_var_XMLNAME release];
	[background_var release];
	[name_var_XMLNAME release];
	[name_var release];
	[id_var_XMLNAME release];
	[id_var release];
	[buyerRequirements_var_XMLNAME release];
	[buyerRequirements_var release];
	[emailAddresses_var_XMLNAME release];
	[emailAddresses_var release];
	[image_var_XMLNAME release];
	[image_var release];
	[addresses_var_XMLNAME release];
	[addresses_var release];
	[contactSource_var_XMLNAME release];
	[contactSource_var release];
	[phoneNumbers_var_XMLNAME release];
	[phoneNumbers_var release];
	[notes_var_XMLNAME release];
	[notes_var release];
	[company_var_XMLNAME release];
	[company_var release];
	[jobTitle_var_XMLNAME release];
	[jobTitle_var release];
	[companyId_var_XMLNAME release];
	[companyId_var release];
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
		
						if(self.secondaryContacts_var!=nil){
		    			[serializedForm appendFormat:@"<%@ %@>%@</%@>", self.secondaryContacts_var_XMLNAME,[self.secondaryContacts_var serializedAttributeString],[[self.secondaryContacts_var xml] stringValue],self.secondaryContacts_var_XMLNAME];
				 	} 
		  
						if(self.background_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.background_var_XMLNAME,self.background_var,self.background_var_XMLNAME];
				 	} 
		  
						if(self.name_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.name_var_XMLNAME,self.name_var,self.name_var_XMLNAME];
				 	} 
		  
						if(self.id_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.id_var_XMLNAME,self.id_var,self.id_var_XMLNAME];
				 	} 
		  
						if(self.buyerRequirements_var!=nil){
		    			[serializedForm appendFormat:@"%@", [self.buyerRequirements_var serializeToXMLString:self.buyerRequirements_var_XMLNAME nameSpaces:nameSpaces]];		
				 	} 
		  
						if(self.emailAddresses_var!=nil){
		    			[serializedForm appendFormat:@"%@", [self.emailAddresses_var serializeToXMLString:self.emailAddresses_var_XMLNAME nameSpaces:nameSpaces]];		
				 	} 
		  
						if(self.image_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.image_var_XMLNAME,self.image_var,self.image_var_XMLNAME];
				 	} 
		  
						if(self.addresses_var!=nil){
		    			[serializedForm appendFormat:@"%@", [self.addresses_var serializeToXMLString:self.addresses_var_XMLNAME nameSpaces:nameSpaces]];		
				 	} 
		  
						if(self.contactSource_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.contactSource_var_XMLNAME,self.contactSource_var,self.contactSource_var_XMLNAME];
				 	} 
		  
						if(self.phoneNumbers_var!=nil){
		    			[serializedForm appendFormat:@"%@", [self.phoneNumbers_var serializeToXMLString:self.phoneNumbers_var_XMLNAME nameSpaces:nameSpaces]];		
				 	} 
		  
						if(self.notes_var!=nil){
		    			[serializedForm appendFormat:@"%@", [self.notes_var serializeToXMLString:self.notes_var_XMLNAME nameSpaces:nameSpaces]];		
				 	} 
		  
						if(self.company_var!=nil){
		    			[serializedForm appendFormat:@"%@", [self.company_var serializeToXMLString:self.company_var_XMLNAME nameSpaces:nameSpaces]];		
				 	} 
		  
						if(self.jobTitle_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.jobTitle_var_XMLNAME,self.jobTitle_var,self.jobTitle_var_XMLNAME];
				 	} 
		  
						if(self.companyId_var!=nil){
		    			[serializedForm appendFormat:@"<%@>%@</%@>", self.companyId_var_XMLNAME,[self.companyId_var stringValue],self.companyId_var_XMLNAME];	
				 	} 
		  
			
		return serializedForm;
	}
	
	- (NSString *)getDefaultElementName{
		return @"Contact";
	}
	- (NSString *)getURI{
		return @"";
	}
@end
