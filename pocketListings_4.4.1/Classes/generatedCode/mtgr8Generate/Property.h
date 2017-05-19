/** 
 * Property.h
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

#import "Photos.h"
#import "OpenHouses.h"

@interface Property : 
  	NSObject <XMLAble>
 {

        NSMutableDictionary* nsMappings;
        CXMLNode* xml;
        NSString* xmlString;
	   NSString* exteriorFeatures_var;
	NSString* exteriorFeatures_var_XMLNAME;

	   NSString* zip10_var;
	NSString* zip10_var_XMLNAME;

	   NSString* associationFee_var;
	NSString* associationFee_var_XMLNAME;

	   NSString* streetName_var;
	NSString* streetName_var_XMLNAME;

	   NSString* fireplaceLocation_var;
	NSString* fireplaceLocation_var_XMLNAME;

	   NSString* utilities_var;
	NSString* utilities_var_XMLNAME;

	   NSString* BLEOptIn_var;
	NSString* BLEOptIn_var_XMLNAME;

	   NSString* sewerSeptic_var;
	NSString* sewerSeptic_var_XMLNAME;

	   NSString* firePlace_Details_var;
	NSString* firePlace_Details_var_XMLNAME;

	   NSString* publicRemarks_var;
	NSString* publicRemarks_var_XMLNAME;

	   NSString* area_var;
	NSString* area_var_XMLNAME;

	   NSString* streetSuffix_var;
	NSString* streetSuffix_var_XMLNAME;

	   NSString* flooring_var;
	NSString* flooring_var_XMLNAME;

	   NSString* associationFeeFrequency_var;
	NSString* associationFeeFrequency_var_XMLNAME;

	   NSString* contactDate_var;
	NSString* contactDate_var_XMLNAME;

	   NSString* otherRooms_var;
	NSString* otherRooms_var_XMLNAME;

	   NSString* floorCovering_var;
	NSString* floorCovering_var_XMLNAME;

	   NSString* virtualTourLink_var;
	NSString* virtualTourLink_var_XMLNAME;

	   NSString* formalDiningRoom_var;
	NSString* formalDiningRoom_var_XMLNAME;

	   NSString* agentLastName_var;
	NSString* agentLastName_var_XMLNAME;

	   NSString* streetPrefix_var;
	NSString* streetPrefix_var_XMLNAME;

	   NSString* listDate_var;
	NSString* listDate_var_XMLNAME;

	   NSString* lotFeatures_var;
	NSString* lotFeatures_var_XMLNAME;

	   NSString* agentCompany_var;
	NSString* agentCompany_var_XMLNAME;

	   NSString* halfBathrooms_var;
	NSString* halfBathrooms_var_XMLNAME;

	   NSString* virtualTourURL_var;
	NSString* virtualTourURL_var_XMLNAME;

	   NSString* parking_Total_var;
	NSString* parking_Total_var_XMLNAME;

	   NSString* yardGrounds_var;
	NSString* yardGrounds_var_XMLNAME;

	   NSString* listPrice_var;
	NSString* listPrice_var_XMLNAME;

	   NSString* totalUnits_var;
	NSString* totalUnits_var_XMLNAME;

	   NSString* inFormalDiningRoom_var;
	NSString* inFormalDiningRoom_var_XMLNAME;

	   NSString* sewer_var;
	NSString* sewer_var_XMLNAME;

	   NSString* heating_var;
	NSString* heating_var_XMLNAME;

	   NSString* additionalListingInfo_var;
	NSString* additionalListingInfo_var_XMLNAME;

	   NSString* streetNumber_var;
	NSString* streetNumber_var_XMLNAME;

	   NSString* lotSizeArea_Units_var;
	NSString* lotSizeArea_Units_var_XMLNAME;

	   NSString* property_Age_var;
	NSString* property_Age_var_XMLNAME;

	   NSString* fullBathrooms_var;
	NSString* fullBathrooms_var_XMLNAME;

	   NSString* stories_var;
	NSString* stories_var_XMLNAME;

	   NSString* unitLocation_var;
	NSString* unitLocation_var_XMLNAME;

	   NSString* horsePropDesc_var;
	NSString* horsePropDesc_var_XMLNAME;

	   NSString* closeDate_var;
	NSString* closeDate_var_XMLNAME;

	   NSString* zoning_var;
	NSString* zoning_var_XMLNAME;

	   NSString* complex_Features_var;
	NSString* complex_Features_var_XMLNAME;

	   NSString* unbrandedVirtualTourLink_var;
	NSString* unbrandedVirtualTourLink_var_XMLNAME;

	   NSString* listingBranchNum_var;
	NSString* listingBranchNum_var_XMLNAME;

	   NSString* cityLimits_var;
	NSString* cityLimits_var_XMLNAME;

	   NSString* kitchenDescription_var;
	NSString* kitchenDescription_var_XMLNAME;

	   NSString* foundation_var;
	NSString* foundation_var_XMLNAME;

	   NSString* poolFeatures_var;
	NSString* poolFeatures_var_XMLNAME;

	   NSString* builderName_var;
	NSString* builderName_var_XMLNAME;

	   NSString* amenities_var;
	NSString* amenities_var_XMLNAME;

	   NSString* VOWAVM_var;
	NSString* VOWAVM_var_XMLNAME;

	   NSString* status_var;
	NSString* status_var_XMLNAME;

	   NSString* otherRoomsDescription_var;
	NSString* otherRoomsDescription_var_XMLNAME;

	   NSString* gas_var;
	NSString* gas_var_XMLNAME;

	   NSString* property_Energy_Information_var;
	NSString* property_Energy_Information_var_XMLNAME;

	   OpenHouses* openHouses_var;
	NSString* openHouses_var_XMLNAME;

	   NSString* crossStreet_var;
	NSString* crossStreet_var_XMLNAME;

	   NSString* id_var;
	NSString* id_var_XMLNAME;

	   NSString* carPort_var;
	NSString* carPort_var_XMLNAME;

	   NSString* associationFeeIncludes_var;
	NSString* associationFeeIncludes_var_XMLNAME;

	   NSString* garage_var;
	NSString* garage_var_XMLNAME;

	   NSString* fireplaceFeatures_var;
	NSString* fireplaceFeatures_var_XMLNAME;

	   NSString* water_var;
	NSString* water_var_XMLNAME;

	   NSString* sqFt_var;
	NSString* sqFt_var_XMLNAME;

	   NSString* style_var;
	NSString* style_var_XMLNAME;

	   Photos* photos_var;
	NSString* photos_var_XMLNAME;

	   NSString* shower_var;
	NSString* shower_var_XMLNAME;

	   NSString* type_var;
	NSString* type_var_XMLNAME;

	   NSString* spaFeatures_var;
	NSString* spaFeatures_var_XMLNAME;

	   NSString* elementarySchool_var;
	NSString* elementarySchool_var_XMLNAME;

	   NSString* yearBuilt_var;
	NSString* yearBuilt_var_XMLNAME;

	   NSString* zip_var;
	NSString* zip_var_XMLNAME;

	   NSString* agentName_var;
	NSString* agentName_var_XMLNAME;

	   NSString* diningRoomDescription_var;
	NSString* diningRoomDescription_var_XMLNAME;

	   NSString* bedroomDescription_var;
	NSString* bedroomDescription_var_XMLNAME;

	   NSString* hasFireplaces_var;
	NSString* hasFireplaces_var_XMLNAME;

	   NSString* agentId_var;
	NSString* agentId_var_XMLNAME;

	   NSString* levels_var;
	NSString* levels_var_XMLNAME;

	   NSString* tractName_var;
	NSString* tractName_var_XMLNAME;

	   NSString* VOWComm_var;
	NSString* VOWComm_var_XMLNAME;

	   NSString* taxAmount_var;
	NSString* taxAmount_var_XMLNAME;

	   NSString* directions_var;
	NSString* directions_var_XMLNAME;

	   NSNumber* longitude_var;
	NSString* longitude_var_XMLNAME;

	   NSString* otherAreas_var;
	NSString* otherAreas_var_XMLNAME;

	   NSString* property_Disability_Features_var;
	NSString* property_Disability_Features_var_XMLNAME;

	   NSString* revisionDate_var;
	NSString* revisionDate_var_XMLNAME;

	   NSString* familyRoom_var;
	NSString* familyRoom_var_XMLNAME;

	   NSString* rooms_var;
	NSString* rooms_var_XMLNAME;

	   NSString* insulation_var;
	NSString* insulation_var_XMLNAME;

	   NSString* cityUnincorporated_var;
	NSString* cityUnincorporated_var_XMLNAME;

	   NSString* county_var;
	NSString* county_var_XMLNAME;

	   NSString* listingId_var;
	NSString* listingId_var_XMLNAME;

	   NSString* poolOptions_var;
	NSString* poolOptions_var_XMLNAME;

	   NSString* agentFirstName_var;
	NSString* agentFirstName_var_XMLNAME;

	   NSString* country_var;
	NSString* country_var_XMLNAME;

	   NSString* warrantyInfo_var;
	NSString* warrantyInfo_var_XMLNAME;

	   NSString* highSchool_var;
	NSString* highSchool_var_XMLNAME;

	   NSString* fencing_var;
	NSString* fencing_var_XMLNAME;

	   NSString* schoolDistrict_var;
	NSString* schoolDistrict_var_XMLNAME;

	   NSString* constructionMaterials_var;
	NSString* constructionMaterials_var_XMLNAME;

	   NSString* propertyType_var;
	NSString* propertyType_var_XMLNAME;

	   NSString* view_var;
	NSString* view_var_XMLNAME;

	   NSString* lotSqFt_var;
	NSString* lotSqFt_var_XMLNAME;

	   NSString* exterior_var;
	NSString* exterior_var_XMLNAME;

	   NSString* listingAreaCode_var;
	NSString* listingAreaCode_var_XMLNAME;

	   NSString* property_Inclusions_var;
	NSString* property_Inclusions_var_XMLNAME;

	   NSString* city_var;
	NSString* city_var_XMLNAME;

	   NSString* bathsHalf_var;
	NSString* bathsHalf_var_XMLNAME;

	   NSString* tub_var;
	NSString* tub_var_XMLNAME;

	   NSString* listTeamAgentDREs_var;
	NSString* listTeamAgentDREs_var_XMLNAME;

	   NSString* cooling_var;
	NSString* cooling_var_XMLNAME;

	   NSString* remarks_var;
	NSString* remarks_var_XMLNAME;

	   NSString* pool_var;
	NSString* pool_var_XMLNAME;

	   NSString* energySavingFeatures_var;
	NSString* energySavingFeatures_var_XMLNAME;

	   NSString* listingType_var;
	NSString* listingType_var_XMLNAME;

	   NSString* community_CommunityName_var;
	NSString* community_CommunityName_var_XMLNAME;

	   NSString* laundryDescription_var;
	NSString* laundryDescription_var_XMLNAME;

	   NSString* hasPool_var;
	NSString* hasPool_var_XMLNAME;

	   NSString* electric_var;
	NSString* electric_var_XMLNAME;

	   NSString* listingLicenseNumber_var;
	NSString* listingLicenseNumber_var_XMLNAME;

	   NSString* fullAddress_var;
	NSString* fullAddress_var_XMLNAME;

	   NSString* middleOrJuniorSchool_var;
	NSString* middleOrJuniorSchool_var_XMLNAME;

	   NSString* unitDescription_var;
	NSString* unitDescription_var_XMLNAME;

	   NSString* showerTub_var;
	NSString* showerTub_var_XMLNAME;

	   NSString* roof_var;
	NSString* roof_var_XMLNAME;

	   NSString* lotDescription_var;
	NSString* lotDescription_var_XMLNAME;

	   NSString* garageDescription_var;
	NSString* garageDescription_var_XMLNAME;

	   NSString* state_var;
	NSString* state_var_XMLNAME;

	   NSString* disclosures_var;
	NSString* disclosures_var_XMLNAME;

	   NSString* modificationTimestamp_var;
	NSString* modificationTimestamp_var_XMLNAME;

	   NSString* property_HotTub_var;
	NSString* property_HotTub_var_XMLNAME;

	   NSString* newListingID_var;
	NSString* newListingID_var_XMLNAME;

	   NSString* bathroomFeatures_var;
	NSString* bathroomFeatures_var_XMLNAME;

	   NSString* subDivision_var;
	NSString* subDivision_var_XMLNAME;

	   NSString* bedrooms_var;
	NSString* bedrooms_var_XMLNAME;

	   NSString* closePrice_var;
	NSString* closePrice_var_XMLNAME;

	   NSNumber* latitude_var;
	NSString* latitude_var_XMLNAME;

	   NSString* photoModificationTimestamp_var;
	NSString* photoModificationTimestamp_var_XMLNAME;

	   NSString* horseProp_var;
	NSString* horseProp_var_XMLNAME;

	   NSString* numberUnits_var;
	NSString* numberUnits_var_XMLNAME;


}

@property (readwrite,retain) NSMutableDictionary* nsMappings;
@property (readwrite,retain) CXMLNode* xml;
@property (nonatomic,readwrite,retain) NSString* xmlString;

	   @property (nonatomic,readwrite,retain) NSString* exteriorFeatures_var;
	
	@property (readwrite,retain) NSString* exteriorFeatures_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* zip10_var;
	
	@property (readwrite,retain) NSString* zip10_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* associationFee_var;
	
	@property (readwrite,retain) NSString* associationFee_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* streetName_var;
	
	@property (readwrite,retain) NSString* streetName_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* fireplaceLocation_var;
	
	@property (readwrite,retain) NSString* fireplaceLocation_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* utilities_var;
	
	@property (readwrite,retain) NSString* utilities_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* BLEOptIn_var;
	
	@property (readwrite,retain) NSString* BLEOptIn_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* sewerSeptic_var;
	
	@property (readwrite,retain) NSString* sewerSeptic_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* firePlace_Details_var;
	
	@property (readwrite,retain) NSString* firePlace_Details_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* publicRemarks_var;
	
	@property (readwrite,retain) NSString* publicRemarks_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* area_var;
	
	@property (readwrite,retain) NSString* area_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* streetSuffix_var;
	
	@property (readwrite,retain) NSString* streetSuffix_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* flooring_var;
	
	@property (readwrite,retain) NSString* flooring_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* associationFeeFrequency_var;
	
	@property (readwrite,retain) NSString* associationFeeFrequency_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* contactDate_var;
	
	@property (readwrite,retain) NSString* contactDate_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* otherRooms_var;
	
	@property (readwrite,retain) NSString* otherRooms_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* floorCovering_var;
	
	@property (readwrite,retain) NSString* floorCovering_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* virtualTourLink_var;
	
	@property (readwrite,retain) NSString* virtualTourLink_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* formalDiningRoom_var;
	
	@property (readwrite,retain) NSString* formalDiningRoom_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* agentLastName_var;
	
	@property (readwrite,retain) NSString* agentLastName_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* streetPrefix_var;
	
	@property (readwrite,retain) NSString* streetPrefix_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* listDate_var;
	
	@property (readwrite,retain) NSString* listDate_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* lotFeatures_var;
	
	@property (readwrite,retain) NSString* lotFeatures_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* agentCompany_var;
	
	@property (readwrite,retain) NSString* agentCompany_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* halfBathrooms_var;
	
	@property (readwrite,retain) NSString* halfBathrooms_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* virtualTourURL_var;
	
	@property (readwrite,retain) NSString* virtualTourURL_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* parking_Total_var;
	
	@property (readwrite,retain) NSString* parking_Total_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* yardGrounds_var;
	
	@property (readwrite,retain) NSString* yardGrounds_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* listPrice_var;
	
	@property (readwrite,retain) NSString* listPrice_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* totalUnits_var;
	
	@property (readwrite,retain) NSString* totalUnits_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* inFormalDiningRoom_var;
	
	@property (readwrite,retain) NSString* inFormalDiningRoom_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* sewer_var;
	
	@property (readwrite,retain) NSString* sewer_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* heating_var;
	
	@property (readwrite,retain) NSString* heating_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* additionalListingInfo_var;
	
	@property (readwrite,retain) NSString* additionalListingInfo_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* streetNumber_var;
	
	@property (readwrite,retain) NSString* streetNumber_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* lotSizeArea_Units_var;
	
	@property (readwrite,retain) NSString* lotSizeArea_Units_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* property_Age_var;
	
	@property (readwrite,retain) NSString* property_Age_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* fullBathrooms_var;
	
	@property (readwrite,retain) NSString* fullBathrooms_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* stories_var;
	
	@property (readwrite,retain) NSString* stories_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* unitLocation_var;
	
	@property (readwrite,retain) NSString* unitLocation_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* horsePropDesc_var;
	
	@property (readwrite,retain) NSString* horsePropDesc_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* closeDate_var;
	
	@property (readwrite,retain) NSString* closeDate_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* zoning_var;
	
	@property (readwrite,retain) NSString* zoning_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* complex_Features_var;
	
	@property (readwrite,retain) NSString* complex_Features_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* unbrandedVirtualTourLink_var;
	
	@property (readwrite,retain) NSString* unbrandedVirtualTourLink_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* listingBranchNum_var;
	
	@property (readwrite,retain) NSString* listingBranchNum_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* cityLimits_var;
	
	@property (readwrite,retain) NSString* cityLimits_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* kitchenDescription_var;
	
	@property (readwrite,retain) NSString* kitchenDescription_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* foundation_var;
	
	@property (readwrite,retain) NSString* foundation_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* poolFeatures_var;
	
	@property (readwrite,retain) NSString* poolFeatures_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* builderName_var;
	
	@property (readwrite,retain) NSString* builderName_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* amenities_var;
	
	@property (readwrite,retain) NSString* amenities_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* VOWAVM_var;
	
	@property (readwrite,retain) NSString* VOWAVM_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* status_var;
	
	@property (readwrite,retain) NSString* status_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* otherRoomsDescription_var;
	
	@property (readwrite,retain) NSString* otherRoomsDescription_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* gas_var;
	
	@property (readwrite,retain) NSString* gas_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* property_Energy_Information_var;
	
	@property (readwrite,retain) NSString* property_Energy_Information_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) OpenHouses* openHouses_var;
	
	@property (readwrite,retain) NSString* openHouses_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* crossStreet_var;
	
	@property (readwrite,retain) NSString* crossStreet_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* id_var;
	
	@property (readwrite,retain) NSString* id_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* carPort_var;
	
	@property (readwrite,retain) NSString* carPort_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* associationFeeIncludes_var;
	
	@property (readwrite,retain) NSString* associationFeeIncludes_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* garage_var;
	
	@property (readwrite,retain) NSString* garage_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* fireplaceFeatures_var;
	
	@property (readwrite,retain) NSString* fireplaceFeatures_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* water_var;
	
	@property (readwrite,retain) NSString* water_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* sqFt_var;
	
	@property (readwrite,retain) NSString* sqFt_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* style_var;
	
	@property (readwrite,retain) NSString* style_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) Photos* photos_var;
	
	@property (readwrite,retain) NSString* photos_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* shower_var;
	
	@property (readwrite,retain) NSString* shower_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* type_var;
	
	@property (readwrite,retain) NSString* type_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* spaFeatures_var;
	
	@property (readwrite,retain) NSString* spaFeatures_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* elementarySchool_var;
	
	@property (readwrite,retain) NSString* elementarySchool_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* yearBuilt_var;
	
	@property (readwrite,retain) NSString* yearBuilt_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* zip_var;
	
	@property (readwrite,retain) NSString* zip_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* agentName_var;
	
	@property (readwrite,retain) NSString* agentName_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* diningRoomDescription_var;
	
	@property (readwrite,retain) NSString* diningRoomDescription_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* bedroomDescription_var;
	
	@property (readwrite,retain) NSString* bedroomDescription_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* hasFireplaces_var;
	
	@property (readwrite,retain) NSString* hasFireplaces_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* agentId_var;
	
	@property (readwrite,retain) NSString* agentId_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* levels_var;
	
	@property (readwrite,retain) NSString* levels_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* tractName_var;
	
	@property (readwrite,retain) NSString* tractName_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* VOWComm_var;
	
	@property (readwrite,retain) NSString* VOWComm_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* taxAmount_var;
	
	@property (readwrite,retain) NSString* taxAmount_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* directions_var;
	
	@property (readwrite,retain) NSString* directions_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSNumber* longitude_var;
	
	@property (readwrite,retain) NSString* longitude_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* otherAreas_var;
	
	@property (readwrite,retain) NSString* otherAreas_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* property_Disability_Features_var;
	
	@property (readwrite,retain) NSString* property_Disability_Features_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* revisionDate_var;
	
	@property (readwrite,retain) NSString* revisionDate_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* familyRoom_var;
	
	@property (readwrite,retain) NSString* familyRoom_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* rooms_var;
	
	@property (readwrite,retain) NSString* rooms_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* insulation_var;
	
	@property (readwrite,retain) NSString* insulation_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* cityUnincorporated_var;
	
	@property (readwrite,retain) NSString* cityUnincorporated_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* county_var;
	
	@property (readwrite,retain) NSString* county_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* listingId_var;
	
	@property (readwrite,retain) NSString* listingId_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* poolOptions_var;
	
	@property (readwrite,retain) NSString* poolOptions_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* agentFirstName_var;
	
	@property (readwrite,retain) NSString* agentFirstName_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* country_var;
	
	@property (readwrite,retain) NSString* country_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* warrantyInfo_var;
	
	@property (readwrite,retain) NSString* warrantyInfo_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* highSchool_var;
	
	@property (readwrite,retain) NSString* highSchool_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* fencing_var;
	
	@property (readwrite,retain) NSString* fencing_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* schoolDistrict_var;
	
	@property (readwrite,retain) NSString* schoolDistrict_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* constructionMaterials_var;
	
	@property (readwrite,retain) NSString* constructionMaterials_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* propertyType_var;
	
	@property (readwrite,retain) NSString* propertyType_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* view_var;
	
	@property (readwrite,retain) NSString* view_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* lotSqFt_var;
	
	@property (readwrite,retain) NSString* lotSqFt_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* exterior_var;
	
	@property (readwrite,retain) NSString* exterior_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* listingAreaCode_var;
	
	@property (readwrite,retain) NSString* listingAreaCode_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* property_Inclusions_var;
	
	@property (readwrite,retain) NSString* property_Inclusions_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* city_var;
	
	@property (readwrite,retain) NSString* city_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* bathsHalf_var;
	
	@property (readwrite,retain) NSString* bathsHalf_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* tub_var;
	
	@property (readwrite,retain) NSString* tub_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* listTeamAgentDREs_var;
	
	@property (readwrite,retain) NSString* listTeamAgentDREs_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* cooling_var;
	
	@property (readwrite,retain) NSString* cooling_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* remarks_var;
	
	@property (readwrite,retain) NSString* remarks_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* pool_var;
	
	@property (readwrite,retain) NSString* pool_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* energySavingFeatures_var;
	
	@property (readwrite,retain) NSString* energySavingFeatures_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* listingType_var;
	
	@property (readwrite,retain) NSString* listingType_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* community_CommunityName_var;
	
	@property (readwrite,retain) NSString* community_CommunityName_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* laundryDescription_var;
	
	@property (readwrite,retain) NSString* laundryDescription_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* hasPool_var;
	
	@property (readwrite,retain) NSString* hasPool_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* electric_var;
	
	@property (readwrite,retain) NSString* electric_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* listingLicenseNumber_var;
	
	@property (readwrite,retain) NSString* listingLicenseNumber_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* fullAddress_var;
	
	@property (readwrite,retain) NSString* fullAddress_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* middleOrJuniorSchool_var;
	
	@property (readwrite,retain) NSString* middleOrJuniorSchool_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* unitDescription_var;
	
	@property (readwrite,retain) NSString* unitDescription_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* showerTub_var;
	
	@property (readwrite,retain) NSString* showerTub_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* roof_var;
	
	@property (readwrite,retain) NSString* roof_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* lotDescription_var;
	
	@property (readwrite,retain) NSString* lotDescription_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* garageDescription_var;
	
	@property (readwrite,retain) NSString* garageDescription_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* state_var;
	
	@property (readwrite,retain) NSString* state_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* disclosures_var;
	
	@property (readwrite,retain) NSString* disclosures_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* modificationTimestamp_var;
	
	@property (readwrite,retain) NSString* modificationTimestamp_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* property_HotTub_var;
	
	@property (readwrite,retain) NSString* property_HotTub_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* newListingID_var;
	
	@property (readwrite,retain) NSString* newListingID_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* bathroomFeatures_var;
	
	@property (readwrite,retain) NSString* bathroomFeatures_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* subDivision_var;
	
	@property (readwrite,retain) NSString* subDivision_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* bedrooms_var;
	
	@property (readwrite,retain) NSString* bedrooms_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* closePrice_var;
	
	@property (readwrite,retain) NSString* closePrice_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSNumber* latitude_var;
	
	@property (readwrite,retain) NSString* latitude_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* photoModificationTimestamp_var;
	
	@property (readwrite,retain) NSString* photoModificationTimestamp_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* horseProp_var;
	
	@property (readwrite,retain) NSString* horseProp_var_XMLNAME;
	   @property (nonatomic,readwrite,retain) NSString* numberUnits_var;
	
	@property (readwrite,retain) NSString* numberUnits_var_XMLNAME;



- (id)initWithXML:(CXMLNode*)xml;
@end