//
//  MLauncherView.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/28/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class MPageControl,MLauncherView,MLauncherItem,MLauncherItem,MLauncherButton,MLauncherHighlightView;

@protocol MLauncherViewDelegate <NSObject>

@optional

- (void)launcherView:(MLauncherView*)launcher didAddItem:(MLauncherItem*)item;

- (void)launcherView:(MLauncherView*)launcher didRemoveItem:(MLauncherItem*)item;

- (void)launcherView:(MLauncherView*)launcher didMoveItem:(MLauncherItem*)item;

- (void)launcherView:(MLauncherView*)launcher didSelectItem:(MLauncherItem*)item;

- (void)launcherViewDidEndDragging:(MLauncherView*)launcher;

- (void)launcherViewDidBeginEditing:(MLauncherView*)launcher;

- (void)launcherViewDidEndEditing:(MLauncherView*)launcher;
@required
- (void)launcherView:(MLauncherView*)launcher pageChanged:(MPageControl*)page;
@end

@interface MLauncherView : UIView <UIScrollViewDelegate> {
    NSMutableArray* _pages;
    
    NSInteger       _columnCount;
    NSInteger       _rowCount;
    
    NSString*       _prompt;
    
    NSMutableArray* _buttons;
    UIScrollView*   _scrollView;
    
    MPageControl*   _pager;
    
    NSTimer*        _editHoldTimer;
    NSTimer*        _springLoadTimer;
    
    MLauncherButton* _dragButton;
    UITouch*          _dragTouch;
    NSInteger         _positionOrigin;
    CGPoint           _dragOrigin;
    CGPoint           _touchOrigin;
    
    MLauncherHighlightView* _highlightView;
    
    BOOL _editing;
    BOOL _springing;
    BOOL _editable;
    
    id<MLauncherViewDelegate> _delegate;
}

@property (nonatomic, assign) id<MLauncherViewDelegate> delegate;

@property (nonatomic, copy) NSArray* pages;

@property (nonatomic) NSInteger columnCount;

@property (nonatomic, readonly) NSInteger rowCount;

@property (nonatomic, readonly) MPageControl* pager;

@property (nonatomic) NSInteger currentPageIndex;

@property (nonatomic, copy) NSString* prompt;

@property (nonatomic, readonly) BOOL editing;
@property (nonatomic, assign) BOOL editable;

- (void)addItem:(MLauncherItem*)item animated:(BOOL)animated;

- (void)removeItem:(MLauncherItem*)item animated:(BOOL)animated;

- (MLauncherItem*)itemWithURL:(NSString*)URL;

- (NSIndexPath*)indexPathOfItem:(MLauncherItem*)item;

- (void)scrollToItem:(MLauncherItem*)item animated:(BOOL)animated;

- (void)beginEditing;

- (void)endEditing;

/**
 * Dims the launcher view except for a transparent circle around the given item. The given text
 * will also be shown center-aligned below or above the circle, as appropriate. The item can be
 * tapped while the overlay is up; tapping anywhere else on the overlay simply dismisses the
 * overlay and does not pass the event through.
 */
- (void)beginHighlightItem:(MLauncherItem*)item withText:(NSString*)text;

/**
 * Removes the highlighting overlay introduced by -beginHighlightItem:withText:. This will be done
 * automatically if the user taps anywhere on the overlay except the transparent circle.
 */
- (void)endHighlightItem:(MLauncherItem*)item;

@end
