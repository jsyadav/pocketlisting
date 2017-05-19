//
//  XMLAble.h
//  pocketListings
//
//  Created by Developer mTgr8 on 8/14/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol XMLAble <NSObject>
- (NSString *)serializedElementString:(NSMutableDictionary *)nameSpaces;
- (NSString *)serializedAttributeString;
- (NSString *)serializeToXMLString:(NSString *)elemName nameSpaces:(NSMutableDictionary *)nameSpaces;
- (NSString *)getDefaultElementName;
- (NSString *)getURI;

@end
