//
//  MGlobalCore.m
//  MLauncher
//
//  Created by Developer mTgr8 on 10/31/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "MGlobalCore.h"

#import <objc/runtime.h>
#import <pthread.h>

static int              gNetworkTaskCount = 0;
static pthread_mutex_t  gMutex = PTHREAD_MUTEX_INITIALIZER;


// No-ops for non-retaining objects.
static const void* TTRetainNoOp(CFAllocatorRef allocator, const void *value) { return value; }
static void TTReleaseNoOp(CFAllocatorRef allocator, const void *value) { }


///////////////////////////////////////////////////////////////////////////////////////////////////
NSMutableArray* TTCreateNonRetainingArray() {
    CFArrayCallBacks callbacks = kCFTypeArrayCallBacks;
    callbacks.retain = TTRetainNoOp;
    callbacks.release = TTReleaseNoOp;
    return (NSMutableArray*)CFArrayCreateMutable(nil, 0, &callbacks);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
NSMutableDictionary* TTCreateNonRetainingDictionary() {
    CFDictionaryKeyCallBacks keyCallbacks = kCFTypeDictionaryKeyCallBacks;
    CFDictionaryValueCallBacks callbacks = kCFTypeDictionaryValueCallBacks;
    callbacks.retain = TTRetainNoOp;
    callbacks.release = TTReleaseNoOp;
    return (NSMutableDictionary*)CFDictionaryCreateMutable(nil, 0, &keyCallbacks, &callbacks);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
BOOL TTIsArrayWithItems(id object) {
    return [object isKindOfClass:[NSArray class]] && [(NSArray*)object count] > 0;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
BOOL TTIsSetWithItems(id object) {
    return [object isKindOfClass:[NSSet class]] && [(NSSet*)object count] > 0;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
BOOL TTIsStringWithAnyText(id object) {
    return [object isKindOfClass:[NSString class]] && [(NSString*)object length] > 0;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
void TTSwapMethods(Class cls, SEL originalSel, SEL newSel) {
    Method originalMethod = class_getInstanceMethod(cls, originalSel);
    Method newMethod = class_getInstanceMethod(cls, newSel);
    method_exchangeImplementations(originalMethod, newMethod);
}



///////////////////////////////////////////////////////////////////////////////////////////////////
void TTNetworkRequestStarted() {
    pthread_mutex_lock(&gMutex);
    
    if (0 == gNetworkTaskCount) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    }
    gNetworkTaskCount++;
    
    pthread_mutex_unlock(&gMutex);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
void TTNetworkRequestStopped() {
    pthread_mutex_lock(&gMutex);
    
    --gNetworkTaskCount;
    // If this asserts, you don't have enough stop requests to match your start requests.
    gNetworkTaskCount = MAX(0, gNetworkTaskCount);
    
    if (gNetworkTaskCount == 0) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }
    
    pthread_mutex_unlock(&gMutex);
}

