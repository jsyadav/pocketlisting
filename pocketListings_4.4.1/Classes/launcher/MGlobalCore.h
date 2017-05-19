//
//  MGlobalCore.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/31/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MURLCache.h"

/**
 * Creates a mutable array which does not retain references to the objects it contains.
 *
 * Typically used with arrays of delegates.
 */
NSMutableArray* TTCreateNonRetainingArray();

/**
 * Creates a mutable dictionary which does not retain references to the values it contains.
 *
 * Typically used with dictionaries of delegates.
 */
NSMutableDictionary* TTCreateNonRetainingDictionary();

/**
 * Tests if an object is an array which is not empty.
 */
BOOL TTIsArrayWithItems(id object);

/**
 * Tests if an object is a set which is not empty.
 */
BOOL TTIsSetWithItems(id object);

/**
 * Tests if an object is a string which is not empty.
 */
BOOL TTIsStringWithAnyText(id object);

/**
 * Swap the two method implementations on the given class.
 * Uses method_exchangeImplementations to accomplish this.
 */
void TTSwapMethods(Class cls, SEL originalSel, SEL newSel);


/**
 * Increment the number of active network requests.
 *
 * The status bar activity indicator will be spinning while there are active requests.
 *
 * @threadsafe
 */
void TTNetworkRequestStarted();

/**
 * Decrement the number of active network requests.
 *
 * The status bar activity indicator will be spinning while there are active requests.
 *
 * @threadsafe
 */
void TTNetworkRequestStopped();

///////////////////////////////////////////////////////////////////////////////////////////////////
// Images

#define TTIMAGE(_URL) [[MURLCache sharedCache] imageForURL:_URL]

