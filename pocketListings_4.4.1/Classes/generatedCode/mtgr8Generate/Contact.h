/** 
 * Contact.h
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

#import <Foundation/Foundation.h>
#import "TouchXML.h"
#import "XMLUtil.h"


#import "Company.h"
#import "Addresses.h"
#import "EmailAddresses.h"
#import "PhoneNumbers.h"
#import "SecondaryContacts.h"
#import "BuyerRequirements.h"
#import "Notes.h"
#import "XMLAble.h"

@interface Contact : 
  	NSObject <XMLAble>
 {

        NSMutableDictionary* nsMappings;
        CXMLNode* xml;
        NSString* xmlString;
	   SecondaryContacts* secondaryContacts_var;
	NSString* secondaryContacts_var_XMLNAME;

	   NSString* background_var;
	NSString* background_var_XMLNAME;

	   NSString* name_var;
	NSString* name_var_XMLNAME;

	   NSString* id_var;
	NSString* id_var_XMLNAME;

	   BuyerRequirements* buyerRequirements_var;
	NSString* buyerRequirements_var_XMLNAME;

	   EmailAddresses* emailAddresses_var;
	NSString* emailAddresses_var_XMLNAME;

	   NSString* image_var;
	NSString* image_var_XMLNAME;

	   Addresses* addresses_var;
	NSString* addresses_var_XMLNAME;

	   NSString* contactSource_var;
	NSString* contactSource_var_XMLNAME;

	   PhoneNumbers* phoneNumbers_var;
	NSString* phoneNumbers_var_XMLNAME;

	   Notes* notes_var;
	NSString* notes_var_XMLNAME;

	   Company* company_var;
	NSString* company_var_XMLNAME;

	   NSString* jobTitle_var;
	NSString* jobTitle_var_XMLNAME;

	   NSNumber* companyId_var;
	NSString* companyId_var_XMLNAME;


}

@property (readwrite,retain) NSMutableDictionary* nsMappings;
@property (readwrite,retain) CXMLNode* xml;
@property (nonatomic,readwrite,retain) NSString* xmlString;

	   @property (nonatomic,readwrite,retain) SecondaryContacts* secondaryContacts_var;
	
	@property (readwrite,retain) NSString* secondaryContacts_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* background_var;
	
	@property (readwrite,retain) NSString* background_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* name_var;
	
	@property (readwrite,retain) NSString* name_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* id_var;
	
	@property (readwrite,retain) NSString* id_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) BuyerRequirements* buyerRequirements_var;
	
	@property (readwrite,retain) NSString* buyerRequirements_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) EmailAddresses* emailAddresses_var;
	
	@property (readwrite,retain) NSString* emailAddresses_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* image_var;
	
	@property (readwrite,retain) NSString* image_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) Addresses* addresses_var;
	
	@property (readwrite,retain) NSString* addresses_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* contactSource_var;
	
	@property (readwrite,retain) NSString* contactSource_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) PhoneNumbers* phoneNumbers_var;
	
	@property (readwrite,retain) NSString* phoneNumbers_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) Notes* notes_var;
	
	@property (readwrite,retain) NSString* notes_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) Company* company_var;
	
	@property (readwrite,retain) NSString* company_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* jobTitle_var;
	
	@property (readwrite,retain) NSString* jobTitle_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSNumber* companyId_var;
	
	@property (readwrite,retain) NSString* companyId_var_XMLNAME;



- (id)initWithXML:(CXMLNode*)xml;
@end