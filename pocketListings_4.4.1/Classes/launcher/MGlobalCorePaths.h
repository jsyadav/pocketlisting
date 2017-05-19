//
//  MGlobalCorePaths.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/31/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * @return YES if the URL begins with "bundle://"
 */
BOOL TTIsBundleURL(NSString* URL);

/**
 * @return YES if the URL begins with "documents://"
 */
BOOL TTIsDocumentsURL(NSString* URL);

/**
 * Used by TTPathForBundleResource to construct the bundle path.
 *
 * Retains the given bundle.
 *
 * @default nil (See TTGetDefaultBundle for what this means)
 */
void TTSetDefaultBundle(NSBundle* bundle);

/**
 * Retrieves the default bundle.
 *
 * If the default bundle is nil, returns [NSBundle mainBundle].
 *
 * @see TTSetDefaultBundle
 */
NSBundle* TTGetDefaultBundle();

/**
 * @return The main bundle path concatenated with the given relative path.
 */
NSString* TTPathForBundleResource(NSString* relativePath);

/**
 * @return The documents path concatenated with the given relative path.
 */
NSString* TTPathForDocumentsResource(NSString* relativePath);

