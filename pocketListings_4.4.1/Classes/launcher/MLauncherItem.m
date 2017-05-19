//
//  MLauncherItem.m
//  MLauncher
//
//  Created by Developer mTgr8 on 10/28/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MLauncherItem.h"
#import "MCorePreprocessorMacros.h"

@implementation MLauncherItem

@synthesize launcher    = _launcher;
@synthesize title       = _title;
@synthesize image       = _image;
@synthesize URL         = _URL;
@synthesize style       = _style;
@synthesize badgeValue  = _badgeValue;
@synthesize canDelete   = _canDelete;
@synthesize userInfo    = _userInfo;

///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithTitle:(NSString*)title image:(NSString*)image URL:(NSString*)URL {
	self = [self initWithTitle:title image:image URL:URL canDelete:NO];
    if (self) {
    }
    
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithTitle:(NSString*)title image:(NSString*)image URL:(NSString*)URL
          canDelete:(BOOL)canDelete {
	self = [super init];
    if (self) {
        _canDelete = canDelete;
        
        self.title = title;
        self.image = image;
        self.URL = URL;
    }
    
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
    TT_RELEASE_SAFELY(_title);
    TT_RELEASE_SAFELY(_image);
    TT_RELEASE_SAFELY(_URL);
    TT_RELEASE_SAFELY(_style);
    TT_RELEASE_SAFELY(_userInfo);
    
    [super dealloc];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark NSCoding


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithCoder:(NSCoder*)decoder {
	self = [super init];
    if (self) {
        self.title = [decoder decodeObjectForKey:@"title"];
        self.image = [decoder decodeObjectForKey:@"image"];
        self.URL = [decoder decodeObjectForKey:@"URL"];
        self.style = [decoder decodeObjectForKey:@"style"];
        self.canDelete = [decoder decodeBoolForKey:@"canDelete"];
    }
    
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)encodeWithCoder:(NSCoder*)encoder {
    [encoder encodeObject:_title forKey:@"title"];
    [encoder encodeObject:_image forKey:@"image"];
    [encoder encodeObject:_URL forKey:@"URL"];
    [encoder encodeObject:_style forKey:@"style"];
    [encoder encodeBool:_canDelete forKey:@"canDelete"];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Public


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSInteger)badgeNumber {
    return [self.badgeValue integerValue];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setBadgeNumber:(NSInteger)badgeNumber {
    if (badgeNumber == 0) {
        [self setBadgeValue:nil];
        
    } else {
        [self setBadgeValue:[NSString stringWithFormat:@"%d",badgeNumber]];
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setBadgeValue:(NSString *)badgeValue {
    if (_badgeValue != badgeValue) {
        [_badgeValue release];
        _badgeValue = [badgeValue copy];
    }
    
    [_launcher performSelector:@selector(updateItemBadge:) withObject:self];
}

@end
