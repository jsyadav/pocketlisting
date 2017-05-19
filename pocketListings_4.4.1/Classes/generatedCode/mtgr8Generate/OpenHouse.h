/** 
 * OpenHouse.h
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



@interface OpenHouse : 
  	NSObject
 {

        NSMutableDictionary* nsMappings;
        CXMLNode* xml;
        NSString* xmlString;
	   NSString* startDateTime_var;
	NSString* startDateTime_var_XMLNAME;

	   NSString* openHouseID_var;
	NSString* openHouseID_var_XMLNAME;

	   NSString* endDateTime_var;
	NSString* endDateTime_var_XMLNAME;

	   NSString* openHousePublicRemarks_var;
	NSString* openHousePublicRemarks_var_XMLNAME;

	   NSString* listingID_var;
	NSString* listingID_var_XMLNAME;

	   NSString* propertyID_var;
	NSString* propertyID_var_XMLNAME;


}

@property (readwrite,retain) NSMutableDictionary* nsMappings;
@property (readwrite,retain) CXMLNode* xml;
@property (nonatomic,readwrite,retain) NSString* xmlString;

	   @property (nonatomic,readwrite,retain) NSString* startDateTime_var;
	
	@property (readwrite,retain) NSString* startDateTime_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* openHouseID_var;
	
	@property (readwrite,retain) NSString* openHouseID_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* endDateTime_var;
	
	@property (readwrite,retain) NSString* endDateTime_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* openHousePublicRemarks_var;
	
	@property (readwrite,retain) NSString* openHousePublicRemarks_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* listingID_var;
	
	@property (readwrite,retain) NSString* listingID_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* propertyID_var;
	
	@property (readwrite,retain) NSString* propertyID_var_XMLNAME;



- (id)initWithXML:(CXMLNode*)xml;
@end