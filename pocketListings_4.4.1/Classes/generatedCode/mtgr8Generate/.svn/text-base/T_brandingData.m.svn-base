//
//  T_brandingData.m
//  idx
//
//  Created by Kaustubh Chavan on 9/15/10.
//  Copyright 2010 Xoriant Corporation. All rights reserved.
//

#import "T_brandingData.h"
#import  "CXMLNode.h"

@implementation T_brandingData
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

@synthesize mTag_var;
@synthesize mTag_var_XMLNAME;
- (NSString*) mTag_var{
	NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
	if( mTag_var == nil){
			
		self.mTag_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,mTag_var_XMLNAME] dictionary:nsMappings inNode:xml];

	}
	
    return mTag_var;
}

@synthesize status_var;
@synthesize status_var_XMLNAME;
- (NSString*) status_var{
	NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
	if( status_var == nil){
		
		self.status_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,status_var_XMLNAME] dictionary:nsMappings inNode:xml];
		
	}
	
    return status_var;
}

@synthesize agentId_var;
@synthesize agentId_var_XMLNAME;
- (NSString*) agentId_var{
	NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
	if( agentId_var == nil){
		
		self.agentId_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,agentId_var_XMLNAME] dictionary:nsMappings inNode:xml];
		
	}
	
    return agentId_var;
}

@synthesize accountType_var;
@synthesize accountType_var_XMLNAME;
- (NSString*) accountType_var{
	NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
	if( accountType_var == nil){
		
		self.accountType_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,accountType_var_XMLNAME] dictionary:nsMappings inNode:xml];
		
	}
	
    return accountType_var;
}

@synthesize agentFName_var;
@synthesize agentFName_var_XMLNAME;
- (NSString*) agentFName_var{
	NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
	if( agentFName_var == nil){
		
		self.agentFName_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,agentFName_var_XMLNAME] dictionary:nsMappings inNode:xml];
		
	}
	
    return agentFName_var;
}

@synthesize agentLName_var;
@synthesize agentLName_var_XMLNAME;
- (NSString*) agentLName_var{
	NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
	if( agentLName_var == nil){
		
		self.agentLName_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,agentLName_var_XMLNAME] dictionary:nsMappings inNode:xml];
		
	}
	
    return agentLName_var;
}

@synthesize agentLic_var;
@synthesize agentLic_var_XMLNAME;
- (NSString*) agentLic_var{
	NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
	if( agentLic_var == nil){
		
		self.agentLic_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,agentLic_var_XMLNAME] dictionary:nsMappings inNode:xml];
		
	}
	
    return agentLic_var;
}

@synthesize agentPhone_var;
@synthesize agentPhone_var_XMLNAME;
- (NSString*) agentPhone_var{
	NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
	if( agentPhone_var == nil){
		
		self.agentPhone_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,agentPhone_var_XMLNAME] dictionary:nsMappings inNode:xml];
		
	}
	
    return agentPhone_var;
}

@synthesize agentEmail_var;
@synthesize agentEmail_var_XMLNAME;
- (NSString*) agentEmail_var{
	NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
	if( agentEmail_var == nil){
		
		self.agentEmail_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,agentEmail_var_XMLNAME] dictionary:nsMappings inNode:xml];
		
	}
	
    return agentEmail_var;
}

@synthesize agentImage_var;
@synthesize agentImage_var_XMLNAME;
- (NSString*) agentImage_var{
	NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
	if( agentImage_var == nil){
		
		self.agentImage_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,agentImage_var_XMLNAME] dictionary:nsMappings inNode:xml];
		
	}
	
    return agentImage_var;
}

@synthesize officeName_var;
@synthesize officeName_var_XMLNAME;
- (NSString*) officeName_var{
	NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
	if( officeName_var == nil){
		
		self.officeName_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,officeName_var_XMLNAME] dictionary:nsMappings inNode:xml];
		
	}
	
    return officeName_var;
}

@synthesize officeLic_var;
@synthesize officeLic_var_XMLNAME;
- (NSString*) officeLic_var{
	NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
	if( officeLic_var == nil){
		
		self.officeLic_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,officeLic_var_XMLNAME] dictionary:nsMappings inNode:xml];
		
	}
	
    return officeLic_var;
}

@synthesize officeImage_var;
@synthesize officeImage_var_XMLNAME;
- (NSString*) officeImage_var{
	NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
	if( officeImage_var == nil){
		
		self.officeImage_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,officeImage_var_XMLNAME] dictionary:nsMappings inNode:xml];
		
	}
	
    return officeImage_var;
}

@synthesize vanityText_var;
@synthesize vanityText_var_XMLNAME;
- (NSString*) vanityText_var{
	NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
	if( vanityText_var == nil){
		
		self.vanityText_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,vanityText_var_XMLNAME] dictionary:nsMappings inNode:xml];
		
	}
	
    return vanityText_var;
}

@synthesize agentFeedName_var;
@synthesize agentFeedName_var_XMLNAME;
- (NSString*) agentFeedName_var{
	NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
	if( agentFeedName_var == nil){
		
		self.agentFeedName_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,agentFeedName_var_XMLNAME] dictionary:nsMappings inNode:xml];
		
	}
	
    return agentFeedName_var;
}

@synthesize agentFeedURL_var;
@synthesize agentFeedURL_var_XMLNAME;
- (NSString*) agentFeedURL_var{
	NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
	if( agentFeedURL_var == nil){
		
		self.agentFeedURL_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,agentFeedURL_var_XMLNAME] dictionary:nsMappings inNode:xml];
		
	}
	
    return agentFeedURL_var;
}

@synthesize credentialToUse_var;
@synthesize credentialToUse_var_XMLNAME;
- (NSString*) credentialToUse_var{
	NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
	if( credentialToUse_var == nil){
		
		self.credentialToUse_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,credentialToUse_var_XMLNAME] dictionary:nsMappings inNode:xml];
		
	}
	
    return credentialToUse_var;
}

@synthesize apiKey_var;
@synthesize apiKey_var_XMLNAME;
- (NSString*) apiKey_var{
	NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
	if( apiKey_var == nil){
		
		self.apiKey_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,apiKey_var_XMLNAME] dictionary:nsMappings inNode:xml];
		
	}
	
    return apiKey_var;
}

@synthesize agentLogin_var;
@synthesize agentLogin_var_XMLNAME;
- (NSString*) agentLogin_var{
	NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
	if( agentLogin_var == nil){
		
		self.agentLogin_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,agentLogin_var_XMLNAME] dictionary:nsMappings inNode:xml];
		
	}
	
    return agentLogin_var;
}

@synthesize agentPassword_var;
@synthesize agentPassword_var_XMLNAME;
- (NSString*) agentPassword_var{
	NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
	if( agentPassword_var == nil){
		
		self.agentPassword_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,agentPassword_var_XMLNAME] dictionary:nsMappings inNode:xml];
		
	}
	
    return agentPassword_var;
}

@synthesize other1_var;
@synthesize other1_var_XMLNAME;
- (NSString*) other1_var{
	NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
	if( other1_var == nil){
		
		self.other1_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,other1_var_XMLNAME] dictionary:nsMappings inNode:xml];
		
	}
	
    return other1_var;
}

@synthesize other2_var;
@synthesize other2_var_XMLNAME;
- (NSString*) other2_var{
	NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
	if( other2_var == nil){
		
		self.other2_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,other2_var_XMLNAME] dictionary:nsMappings inNode:xml];
		
	}
	
    return other2_var;
}

@synthesize officeLogoURL_var;
@synthesize officeLogoURL_var_XMLNAME;
- (NSString*) officeLogoURL_var{
	NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
	if( officeLogoURL_var == nil){
		
		self.officeLogoURL_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,officeLogoURL_var_XMLNAME] dictionary:nsMappings inNode:xml];
		
	}
	
    return officeLogoURL_var;
}

@synthesize facebookUrl_var;
@synthesize facebookUrl_var_XMLNAME;
- (NSString*) facebookUrl_var{
	NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
	if( facebookUrl_var == nil){
		
		self.facebookUrl_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,facebookUrl_var_XMLNAME] dictionary:nsMappings inNode:xml];
		
	}
	
    return facebookUrl_var;
}

@synthesize zipCode_var;
@synthesize zipCode_var_XMLNAME;
- (NSString*) zipCode_var{
	NSString* prefix = [XMLUtil getPrefix:[self getURI] dictionary:nsMappings];	
	if( zipCode_var == nil){
		
		self.zipCode_var=[XMLUtil getXMLStringValue:[NSString stringWithFormat:@"%@:%@",prefix,zipCode_var_XMLNAME] dictionary:nsMappings inNode:xml];
		
	}
	
    return zipCode_var;
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
		
		self.zipCode_var=nil;
		self.zipCode_var_XMLNAME=@"zipCode";
		
		self.facebookUrl_var=nil;
		self.facebookUrl_var_XMLNAME=@"facebookUrl";
		
	    self.mTag_var=nil;
		self.mTag_var_XMLNAME=@"mTag";
		
		self.status_var=nil;
		self.status_var_XMLNAME=@"Status";
		
		self.agentId_var=nil;
		self.agentId_var_XMLNAME=@"agentId";
		
		self.accountType_var=nil;
		self.accountType_var_XMLNAME=@"accountType";
		
		self.agentFName_var=nil;
		self.agentFName_var_XMLNAME=@"agentFName";
		
		self.agentLName_var=nil;
		self.agentLName_var_XMLNAME=@"agentLName";
		
		self.agentLic_var=nil;
		self.agentLic_var_XMLNAME=@"agentLic";
		
		self.agentPhone_var=nil;
		self.agentPhone_var_XMLNAME=@"agentPhone";
		
		self.agentEmail_var=nil;
		self.agentEmail_var_XMLNAME=@"agentEmail";
		
		self.agentImage_var=nil;
		self.agentImage_var_XMLNAME=@"agentImage";
		
		self.officeName_var=nil;
		self.officeName_var_XMLNAME=@"officeName";
		
		self.officeLic_var=nil;
		self.officeLic_var_XMLNAME=@"officeLic";
		
		self.officeImage_var=nil;
		self.officeImage_var_XMLNAME=@"officeImage";
		
		self.officeLogoURL_var=nil;
		self.officeLogoURL_var_XMLNAME=@"officeLogoURL";
		
		self.vanityText_var=nil;
		self.vanityText_var_XMLNAME=@"vanityText";
		
		self.agentFeedName_var=nil;
		self.agentFeedName_var_XMLNAME=@"agentFeedName";
		
		self.agentFeedURL_var=nil;
		self.agentFeedURL_var_XMLNAME=@"agentFeedURL";
		
		self.credentialToUse_var=nil;
		self.credentialToUse_var_XMLNAME=@"credentialToUse";
		
		self.apiKey_var=nil;
		self.apiKey_var_XMLNAME=@"apiKey";
		
		self.agentLogin_var=nil;
		self.agentLogin_var_XMLNAME=@"agentLogin";
		
		self.agentPassword_var=nil;
		self.agentPassword_var_XMLNAME=@"agentPassword";
		
		self.other1_var=nil;
		self.other1_var_XMLNAME=@"other1";
		
		self.other2_var=nil;
		self.other2_var_XMLNAME=@"other2";
	}
	return self;
}

- (void)dealloc {
	
	[mTag_var release];
	[mTag_var_XMLNAME release];
	
	[status_var release];
	[status_var_XMLNAME release];
	
	[agentId_var release];
	[agentId_var_XMLNAME release];
	
	[accountType_var release];
	[accountType_var_XMLNAME release];
	
	[agentFName_var release];
	[agentFName_var_XMLNAME release];
	
	[agentLName_var release];
	[agentLName_var_XMLNAME release];
	
	[agentLic_var release];
	[agentLic_var_XMLNAME release];
	
	[agentPhone_var release];
	[agentPhone_var_XMLNAME release];
	
	[agentEmail_var release];
	[agentEmail_var_XMLNAME release];
	
	[agentImage_var release];
	[agentImage_var_XMLNAME release];
	
	[officeName_var release];
	[officeName_var_XMLNAME release];
	
	[officeLic_var release];
	[officeLic_var_XMLNAME release];
	
	[officeImage_var release];
	[officeImage_var_XMLNAME release];
	
	[vanityText_var release];
	[vanityText_var_XMLNAME release];
	
	[agentFeedName_var release];
	[agentFeedName_var_XMLNAME release];
	
	[agentFeedURL_var release];
	[agentFeedURL_var_XMLNAME release];
	
	[credentialToUse_var release];
	[credentialToUse_var_XMLNAME release];
	
	[apiKey_var release];
	[apiKey_var_XMLNAME release];
	
	[agentLogin_var release];
	[agentLogin_var_XMLNAME release];
	
	[agentPassword_var release];
	[agentPassword_var_XMLNAME release];
	
	[other1_var release];
	[other1_var_XMLNAME release];
	
	[other2_var release];
	[other2_var_XMLNAME release];
	
	[officeLogoURL_var release];
	[officeLogoURL_var_XMLNAME release];
	
	[facebookUrl_var release];
	[facebookUrl_var_XMLNAME release];
	
	[zipCode_var release];
	[zipCode_var_XMLNAME release];
	
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
	
	if(self.mTag_var!=nil){
		[serializedForm appendFormat:@"<%@ %@>%@</%@>", self.mTag_var_XMLNAME,[self serializedAttributeString],self.mTag_var,self.mTag_var_XMLNAME];
	} 
	
	if(self.status_var!=nil){
		[serializedForm appendFormat:@"<%@ %@>%@</%@>", self.status_var_XMLNAME,[self serializedAttributeString],self.status_var,self.status_var_XMLNAME];
	} 
	if(self.agentId_var!=nil){
		[serializedForm appendFormat:@"<%@ %@>%@</%@>", self.agentId_var_XMLNAME,[self serializedAttributeString],self.agentId_var,self.agentId_var_XMLNAME];
	} 
	if(self.accountType_var!=nil){
		[serializedForm appendFormat:@"<%@ %@>%@</%@>", self.accountType_var_XMLNAME,[self serializedAttributeString],self.accountType_var,self.accountType_var_XMLNAME];
	} 
	if(self.agentFName_var!=nil){
		[serializedForm appendFormat:@"<%@ %@>%@</%@>", self.agentFName_var_XMLNAME,[self serializedAttributeString],self.agentFName_var,self.agentFName_var_XMLNAME];
	} 
	if(self.agentLName_var!=nil){
		[serializedForm appendFormat:@"<%@ %@>%@</%@>", self.agentLName_var_XMLNAME,[self serializedAttributeString],self.agentLName_var,self.agentLName_var_XMLNAME];
	} 
	if(self.agentLic_var!=nil){
		[serializedForm appendFormat:@"<%@ %@>%@</%@>", self.agentLic_var_XMLNAME,[self serializedAttributeString],self.agentLic_var,self.agentLic_var_XMLNAME];
	} 
	if(self.agentPhone_var!=nil){
		[serializedForm appendFormat:@"<%@ %@>%@</%@>", self.agentPhone_var_XMLNAME,[self serializedAttributeString],self.agentPhone_var,self.agentPhone_var_XMLNAME];
	} 
	if(self.agentEmail_var!=nil){
		[serializedForm appendFormat:@"<%@ %@>%@</%@>", self.agentEmail_var_XMLNAME,[self serializedAttributeString],self.agentEmail_var,self.agentEmail_var_XMLNAME];
	} 
	if(self.agentImage_var!=nil){
		[serializedForm appendFormat:@"<%@ %@>%@</%@>", self.agentImage_var_XMLNAME,[self serializedAttributeString],self.agentImage_var,self.agentImage_var_XMLNAME];
	} 
	if(self.officeName_var!=nil){
		[serializedForm appendFormat:@"<%@ %@>%@</%@>", self.officeName_var_XMLNAME,[self serializedAttributeString],self.officeName_var,self.officeName_var_XMLNAME];
	} 
	if(self.officeLic_var!=nil){
		[serializedForm appendFormat:@"<%@ %@>%@</%@>", self.officeLic_var_XMLNAME,[self serializedAttributeString],self.officeLic_var,self.officeLic_var_XMLNAME];
	} 
	if(self.officeImage_var!=nil){
		[serializedForm appendFormat:@"<%@ %@>%@</%@>", self.officeImage_var_XMLNAME,[self serializedAttributeString],self.officeImage_var,self.officeImage_var_XMLNAME];
	} 
	if(self.vanityText_var!=nil){
		[serializedForm appendFormat:@"<%@ %@>%@</%@>", self.vanityText_var_XMLNAME,[self serializedAttributeString],self.vanityText_var,self.vanityText_var_XMLNAME];
	} 
	if(self.agentFeedName_var!=nil){
		[serializedForm appendFormat:@"<%@ %@>%@</%@>", self.agentFeedName_var_XMLNAME,[self serializedAttributeString],self.agentFeedName_var,self.agentFeedName_var_XMLNAME];
	} 
	if(self.agentFeedURL_var!=nil){
		[serializedForm appendFormat:@"<%@ %@>%@</%@>", self.agentFeedURL_var_XMLNAME,[self serializedAttributeString],self.agentFeedURL_var,self.agentFeedURL_var_XMLNAME];
	} 
	if(self.credentialToUse_var!=nil){
		[serializedForm appendFormat:@"<%@ %@>%@</%@>", self.credentialToUse_var_XMLNAME,[self serializedAttributeString],self.credentialToUse_var,self.credentialToUse_var_XMLNAME];
	} 
	if(self.apiKey_var!=nil){
		[serializedForm appendFormat:@"<%@ %@>%@</%@>", self.apiKey_var_XMLNAME,[self serializedAttributeString],self.apiKey_var,self.apiKey_var_XMLNAME];
	} 
	if(self.agentLogin_var!=nil){
		[serializedForm appendFormat:@"<%@ %@>%@</%@>", self.agentLogin_var_XMLNAME,[self serializedAttributeString],self.agentLogin_var,self.agentLogin_var_XMLNAME];
	} 
	if(self.agentPassword_var!=nil){
		[serializedForm appendFormat:@"<%@ %@>%@</%@>", self.agentPassword_var_XMLNAME,[self serializedAttributeString],self.agentPassword_var,self.agentPassword_var_XMLNAME];
	} 
	if(self.other1_var!=nil){
		[serializedForm appendFormat:@"<%@ %@>%@</%@>", self.other1_var_XMLNAME,[self serializedAttributeString],self.other1_var,self.other1_var_XMLNAME];
	} 
	if(self.other2_var!=nil){
		[serializedForm appendFormat:@"<%@ %@>%@</%@>", self.other2_var_XMLNAME,[self serializedAttributeString],self.other2_var,self.other2_var_XMLNAME];
	} 
	if(self.officeLogoURL_var!=nil){
		[serializedForm appendFormat:@"<%@ %@>%@</%@>", self.officeLogoURL_var_XMLNAME,[self serializedAttributeString],self.officeLogoURL_var,self.officeLogoURL_var_XMLNAME];
	}
	if(self.facebookUrl_var!=nil){
		[serializedForm appendFormat:@"<%@ %@>%@</%@>", self.facebookUrl_var_XMLNAME,[self serializedAttributeString],self.facebookUrl_var,self.facebookUrl_var_XMLNAME];
	}
	if(self.zipCode_var!=nil){
		[serializedForm appendFormat:@"<%@ %@>%@</%@>", self.zipCode_var_XMLNAME,[self serializedAttributeString],self.zipCode_var,self.zipCode_var_XMLNAME];
	}
	
	return serializedForm;
}

- (NSString *)getDefaultElementName{
	return @"T_brandingData";
}
- (NSString *)getURI{
	return @"http://www.agentstorm.com/schemas/1.0.xsd";
}


@end
