//
//  MURLRequestCachePolicy.h
//  MLauncher
//
//  Created by Developer mTgr8 on 10/29/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    MURLRequestCachePolicyNone    = 0,
    MURLRequestCachePolicyMemory  = 1,
    MURLRequestCachePolicyDisk    = 2,
    MURLRequestCachePolicyNetwork = 4,
    MURLRequestCachePolicyNoCache = 8,
    MURLRequestCachePolicyEtag    = 16 | MURLRequestCachePolicyDisk,
    MURLRequestCachePolicyLocal
    = (MURLRequestCachePolicyMemory | MURLRequestCachePolicyDisk),
    MURLRequestCachePolicyDefault
    = (MURLRequestCachePolicyMemory | MURLRequestCachePolicyDisk
       | MURLRequestCachePolicyNetwork),
} MURLRequestCachePolicy;
