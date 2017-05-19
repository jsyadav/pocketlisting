//
//  LauncherViewController.m
//  MLauncher
//
//  Created by Developer mTgr8 on 10/31/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "LauncherViewController.h"
#import "MLauncherView.h"
#import "MLauncherItem.h"
#import "MGlobalNavigatorMetrics.h"

@implementation LauncherViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect frame = MNavigationFrame();
    self.view = [[[UIView alloc] initWithFrame:frame] autorelease];
    self.view.autoresizesSubviews = YES;
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    self.view.backgroundColor = TTSTYLEVAR(backgroundColor);
    
    _launcherView = [[MLauncherView alloc] initWithFrame:self.view.bounds];
    _launcherView.backgroundColor = [UIColor blackColor];
    _launcherView.delegate = self;
    _launcherView.columnCount = 4;
    _launcherView.pages = [NSArray arrayWithObjects:
                           [NSArray arrayWithObjects:
                            [[[MLauncherItem alloc] initWithTitle:@"Button 1"
                                                            image:@"https://mail.google.com/mail/images/2/5/logo4.png"
                                                              URL:nil canDelete:YES] autorelease],
//                            [[[MLauncherItem alloc] initWithTitle:@"Button 2"
//                                                            image:@"bundle://Icon.png"
//                                                              URL:nil canDelete:YES] autorelease],
//                            [[[MLauncherItem alloc] initWithTitle:@"Button 3"
//                                                            image:@"bundle://Icon.png"
//                                                              URL:@"fb://item3" canDelete:YES] autorelease],
//                            [[[MLauncherItem alloc] initWithTitle:@"Button 4"
//                                                            image:@"bundle://Icon.png"
//                                                              URL:@"fb://item4" canDelete:YES] autorelease],
//                            [[[MLauncherItem alloc] initWithTitle:@"Button 5"
//                                                            image:@"bundle://Icon.png"
//                                                              URL:@"fb://item5" canDelete:YES] autorelease],
//                            [[[MLauncherItem alloc] initWithTitle:@"Button 6"
//                                                            image:@"bundle://Icon.png"
//                                                              URL:@"fb://item6" canDelete:YES] autorelease],
//                            [[[MLauncherItem alloc] initWithTitle:@"Button 7"
//                                                            image:@"bundle://Icon.png"
//                                                              URL:@"fb://item7" canDelete:YES] autorelease],
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


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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


@end
