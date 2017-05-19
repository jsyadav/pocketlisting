//
//  MGlobalCorePaths.m
//  MLauncher
//
//  Created by Developer mTgr8 on 10/31/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MGlobalCorePaths.h"

static NSBundle* globalBundle = nil;


///////////////////////////////////////////////////////////////////////////////////////////////////
BOOL TTIsBundleURL(NSString* URL) {
    return [URL hasPrefix:@"bundle://"];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
BOOL TTIsDocumentsURL(NSString* URL) {
    return [URL hasPrefix:@"documents://"];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
void TTSetDefaultBundle(NSBundle* bundle) {
    [bundle retain];
    [globalBundle release];
    globalBundle = bundle;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
NSBundle* TTGetDefaultBundle() {
    return (nil != globalBundle) ? globalBundle : [NSBundle mainBundle];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
NSString* TTPathForBundleResource(NSString* relativePath) {
    NSString* resourcePath = [TTGetDefaultBundle() resourcePath];
    return [resourcePath stringByAppendingPathComponent:relativePath];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
NSString* TTPathForDocumentsResource(NSString* relativePath) {
    static NSString* documentsPath = nil;
    if (nil == documentsPath) {
        NSArray* dirs = NSSearchPathForDirectoriesInDomains(
                                                            NSDocumentDirectory, NSUserDomainMask, YES);
        documentsPath = [[dirs objectAtIndex:0] retain];
    }
    return [documentsPath stringByAppendingPathComponent:relativePath];
}
