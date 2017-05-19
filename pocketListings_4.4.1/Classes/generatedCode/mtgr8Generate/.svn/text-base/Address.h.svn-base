/** 
 * Address.h
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
#import "XMLAble.h"

#import "Street2.h"

@interface Address : 
  	NSObject <XMLAble>
 {

        NSMutableDictionary* nsMappings;
        CXMLNode* xml;
        NSString* xmlString;
	   NSString* zip_var;
	NSString* zip_var_XMLNAME;

	   NSString* type_var;
	NSString* type_var_XMLNAME;

	   NSString* state_var;
	NSString* state_var_XMLNAME;

	   Street2* street2_var;
	NSString* street2_var_XMLNAME;

	   NSString* street1_var;
	NSString* street1_var_XMLNAME;

	   NSString* country_var;
	NSString* country_var_XMLNAME;

	   NSString* city_var;
	NSString* city_var_XMLNAME;

	   NSString* id_var;
	NSString* id_var_XMLNAME;


}

@property (readwrite,retain) NSMutableDictionary* nsMappings;
@property (readwrite,retain) CXMLNode* xml;
@property (nonatomic,readwrite,retain) NSString* xmlString;

	   @property (nonatomic,readwrite,retain) NSString* zip_var;
	
	@property (readwrite,retain) NSString* zip_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* type_var;
	
	@property (readwrite,retain) NSString* type_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* state_var;
	
	@property (readwrite,retain) NSString* state_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) Street2* street2_var;
	
	@property (readwrite,retain) NSString* street2_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* street1_var;
	
	@property (readwrite,retain) NSString* street1_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* country_var;
	
	@property (readwrite,retain) NSString* country_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* city_var;
	
	@property (readwrite,retain) NSString* city_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* id_var;
	
	@property (readwrite,retain) NSString* id_var_XMLNAME;



- (id)initWithXML:(CXMLNode*)xml;
@end