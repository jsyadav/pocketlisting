//
//  PageViewController.m
//  PagingScrollView
//
//  Created by Matt Gallagher on 24/01/09.
//  Copyright 2009 Matt Gallagher. All rights reserved.
//
//  Permission is given to use this source code file, free of charge, in any
//  project, commercial or otherwise, entirely at your risk, with the condition
//  that any redistribution (in part or whole) of source code must retain
//  this copyright and permission notice. Attribution in compiled projects is
//  appreciated but not required.
//

#import "PageViewController.h"
//#import "DataSource.h"
#import <QuartzCore/QuartzCore.h>
#import "pocketListingsAppDelegate.h"

const CGFloat TEXT_VIEW_PADDING = 50.0;

@implementation PageViewController

@synthesize pageIndex;

- (void)setPageIndex:(NSInteger)newPageIndex
{
	appDelegate = (pocketListingsAppDelegate *)[[UIApplication sharedApplication] delegate];
	
	pageIndex = newPageIndex;
	
	if (pageIndex >= 0 && pageIndex < appDelegate.arrPropertyImg.count)
	{
		//NSDictionary *pageData =
//			[[DataSource sharedDataSource] dataForPage:pageIndex];
//		label.text = [pageData objectForKey:@"pageName"];
//		textView.text = [pageData objectForKey:@"pageText"];
		

			imgView.image = [UIImage imageWithData:[appDelegate.arrPropertyImg objectAtIndex:pageIndex]];

		

		
		
		CGRect absoluteRect = [self.view.window
			convertRect:imgView.bounds
			fromView:imgView];
		if (!self.view.window ||
			!CGRectIntersectsRect(
				CGRectInset(absoluteRect, TEXT_VIEW_PADDING, TEXT_VIEW_PADDING),
				[self.view.window bounds]))
		{
			textViewNeedsUpdate = YES;
		}
	}
	else
	{
		imgView.image = [UIImage imageNamed:@"imagenotavail.png"];
	}
}

- (void)updateTextViews:(BOOL)force
{
	if (force ||
		(textViewNeedsUpdate &&
		self.view.window &&
		CGRectIntersectsRect(
			[self.view.window
				convertRect:CGRectInset(imgView.bounds, TEXT_VIEW_PADDING, TEXT_VIEW_PADDING)
				fromView:imgView],
			[self.view.window bounds])))
	{
		for (UIView *childView in imgView.subviews)
		{
			[childView setNeedsDisplay];
		}
		textViewNeedsUpdate = NO;
	}
}

@end

