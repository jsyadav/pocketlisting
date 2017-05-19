//
//  RootViewController.m
//  MLauncher
//
//  Created by Developer mTgr8 on 10/28/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "RootViewController.h"
#import "MLauncherView.h"
#import "MLauncherItem.h"

@implementation RootViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    _launcherView = [[MLauncherView alloc] initWithFrame:self.view.bounds];
    _launcherView.backgroundColor = [UIColor blackColor];
    _launcherView.delegate = self;
    _launcherView.columnCount = 4;
    _launcherView.pages = [NSArray arrayWithObjects:
                           [NSArray arrayWithObjects:
                            [[[MLauncherItem alloc] initWithTitle:@"Button 1"
                                                             image:@"bundle://Icon.png"
                                                               URL:nil canDelete:YES] autorelease],
                            [[[MLauncherItem alloc] initWithTitle:@"Button 2"
                                                             image:@"bundle://Icon.png"
                                                               URL:nil canDelete:YES] autorelease],
                            [[[MLauncherItem alloc] initWithTitle:@"Button 3"
                                                             image:@"bundle://Icon.png"
                                                               URL:@"fb://item3" canDelete:YES] autorelease],
                            [[[MLauncherItem alloc] initWithTitle:@"Button 4"
                                                             image:@"bundle://Icon.png"
                                                               URL:@"fb://item4" canDelete:YES] autorelease],
                            [[[MLauncherItem alloc] initWithTitle:@"Button 5"
                                                             image:@"bundle://Icon.png"
                                                               URL:@"fb://item5" canDelete:YES] autorelease],
                            [[[MLauncherItem alloc] initWithTitle:@"Button 6"
                                                             image:@"bundle://Icon.png"
                                                               URL:@"fb://item6" canDelete:YES] autorelease],
                            [[[MLauncherItem alloc] initWithTitle:@"Button 7"
                                                             image:@"bundle://Icon.png"
                                                               URL:@"fb://item7" canDelete:YES] autorelease],
                            nil],
                           [NSArray arrayWithObjects:
                            [[[MLauncherItem alloc] initWithTitle:@"Button 8"
                                                             image:@"https://mail.google.com/mail/images/2/5/logo4.png"
                                                               URL:nil canDelete:YES] autorelease],
                            [[[MLauncherItem alloc] initWithTitle:@"Button 9"
                                                             image:@"bundle://Icon.png"
                                                               URL:nil canDelete:YES] autorelease],
                            nil],
                           nil
                           ];
    [self.view addSubview:_launcherView];
    
    MLauncherItem* item = [_launcherView itemWithURL:@"fb://item3"];
    item.badgeNumber = 4;
    
    item = [_launcherView itemWithURL:@"fb://item4"];
    item.badgeNumber = 0;
    
    item = [_launcherView itemWithURL:@"fb://item5"];
    item.badgeValue = @"100!";
    
    item = [_launcherView itemWithURL:@"fb://item6"];
    item.badgeValue = @"Off";
    
    item = [_launcherView itemWithURL:@"fb://item7"];
    item.badgeNumber = 300;

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// TTLauncherViewDelegate

- (void)launcherView:(MLauncherView*)launcher didSelectItem:(MLauncherItem*)item {
}

- (void)launcherViewDidBeginEditing:(MLauncherView*)launcher {
    [self.navigationItem setRightBarButtonItem:[[[UIBarButtonItem alloc]
                                                 initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                 target:_launcherView action:@selector(endEditing)] autorelease] animated:YES];
}

- (void)launcherViewDidEndEditing:(MLauncherView*)launcher {
    [self.navigationItem setRightBarButtonItem:nil animated:YES];
}

- (void)dealloc
{
    [super dealloc];
}

@end
