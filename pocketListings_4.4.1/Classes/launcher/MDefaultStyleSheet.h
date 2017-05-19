//
//  MDefaultStyleSheet.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/29/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MStyleSheet.h"

@class MStyle,MShape;

@interface MDefaultStyleSheet : MStyleSheet

// Common styles
@property (nonatomic, readonly) UIColor*  textColor;
@property (nonatomic, readonly) UIColor*  highlightedTextColor;
@property (nonatomic, readonly) UIColor*  backgroundTextColor;
@property (nonatomic, readonly) UIFont*   font;
@property (nonatomic, readonly) UIColor*  backgroundColor;
@property (nonatomic, readonly) UIColor*  navigationBarTintColor;
@property (nonatomic, readonly) UIColor*  toolbarTintColor;
@property (nonatomic, readonly) UIColor*  searchBarTintColor;

// Tables
@property (nonatomic, readonly) UIColor*  tablePlainBackgroundColor;
@property (nonatomic, readonly) UIColor*  tablePlainCellSeparatorColor;
@property (nonatomic, readonly) UITableViewCellSeparatorStyle tablePlainCellSeparatorStyle;
@property (nonatomic, readonly) UIColor*  tableGroupedBackgroundColor;
@property (nonatomic, readonly) UIColor*  tableGroupedCellSeparatorColor;
@property (nonatomic, readonly) UITableViewCellSeparatorStyle tableGroupedCellSeparatorStyle;
@property (nonatomic, readonly) UIColor*  searchTableBackgroundColor;
@property (nonatomic, readonly) UIColor*  searchTableSeparatorColor;

// Table Headers
@property (nonatomic, readonly) UIColor*  tableHeaderTextColor;
@property (nonatomic, readonly) UIColor*  tableHeaderShadowColor;
@property (nonatomic, readonly) CGSize    tableHeaderShadowOffset;
@property (nonatomic, readonly) UIColor*  tableHeaderTintColor;

// Photo Captions
@property (nonatomic, readonly) UIColor*  photoCaptionTextColor;
@property (nonatomic, readonly) UIColor*  photoCaptionTextShadowColor;
@property (nonatomic, readonly) CGSize    photoCaptionTextShadowOffset;

@property (nonatomic, readonly) UIColor*  timestampTextColor;
@property (nonatomic, readonly) UIColor*  linkTextColor;
@property (nonatomic, readonly) UIColor*  moreLinkTextColor;

@property (nonatomic, readonly) UIColor* screenBackgroundColor;

@property (nonatomic, readonly) UIColor* tableActivityTextColor;
@property (nonatomic, readonly) UIColor* tableErrorTextColor;
@property (nonatomic, readonly) UIColor* tableSubTextColor;
@property (nonatomic, readonly) UIColor* tableTitleTextColor;

@property (nonatomic, readonly) UIColor* tabTintColor;
@property (nonatomic, readonly) UIColor* tabBarTintColor;

@property (nonatomic, readonly) UIColor* messageFieldTextColor;
@property (nonatomic, readonly) UIColor* messageFieldSeparatorColor;

@property (nonatomic, readonly) UIColor* thumbnailBackgroundColor;

@property (nonatomic, readonly) UIColor* postButtonColor;

@property (nonatomic, readonly) UIFont* buttonFont;
@property (nonatomic, readonly) UIFont* tableFont;
@property (nonatomic, readonly) UIFont* tableSmallFont;
@property (nonatomic, readonly) UIFont* tableTitleFont;
@property (nonatomic, readonly) UIFont* tableTimestampFont;
@property (nonatomic, readonly) UIFont* tableButtonFont;
@property (nonatomic, readonly) UIFont* tableSummaryFont;
@property (nonatomic, readonly) UIFont* tableHeaderPlainFont;
@property (nonatomic, readonly) UIFont* tableHeaderGroupedFont;
@property (nonatomic, readonly) CGFloat tableBannerViewHeight;
@property (nonatomic, readonly) UIFont* photoCaptionFont;
@property (nonatomic, readonly) UIFont* messageFont;
@property (nonatomic, readonly) UIFont* errorTitleFont;
@property (nonatomic, readonly) UIFont* errorSubtitleFont;
@property (nonatomic, readonly) UIFont* activityLabelFont;
@property (nonatomic, readonly) UIFont* activityBannerFont;

@property (nonatomic, readonly) UITableViewCellSelectionStyle tableSelectionStyle;

- (MStyle*)selectionFillStyle:(MStyle*)next;

- (MStyle*)toolbarButtonForState:(UIControlState)state shape:(MShape*)shape
                        tintColor:(UIColor*)tintColor font:(UIFont*)font;

- (MStyle*)pageDotWithColor:(UIColor*)color;

@end
