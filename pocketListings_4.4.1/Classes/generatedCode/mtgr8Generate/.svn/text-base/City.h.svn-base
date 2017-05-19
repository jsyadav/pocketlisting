/** 
 * City.h
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

#import "City.h"

@interface City : 
  	NSObject <XMLAble>
 {

        NSMutableDictionary* nsMappings;
        CXMLNode* xml;
        NSString* xmlString;
	   NSString* state_var;
	NSString* state_var_XMLNAME;

	   NSString* country_var;
	NSString* country_var_XMLNAME;

	   City* city_var;
	NSString* city_var_XMLNAME;


}

@property (readwrite,retain) NSMutableDictionary* nsMappings;
@property (readwrite,retain) CXMLNode* xml;
@property (nonatomic,readwrite,retain) NSString* xmlString;

	   @property (nonatomic,readwrite,retain) NSString* state_var;
	
	@property (readwrite,retain) NSString* state_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* country_var;
	
	@property (readwrite,retain) NSString* country_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) City* city_var;
	
	@property (readwrite,retain) NSString* city_var_XMLNAME;



- (id)initWithXML:(CXMLNode*)xml;
- (NSString *)serializeToXMLString:(NSString *)elemName nameSpaces:(NSMutableDictionary *)nameSpaces;
- (NSString *)getURI;
- (NSString *)getDefaultElementName;
- (NSString *)serializedAttributeString;
- (NSString *)serializedElementString:(NSMutableDictionary *)nameSpaces;

@end