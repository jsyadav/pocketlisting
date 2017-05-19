//
//  SchoolAnnotation.m
//  pocketListings
//
//  Created by Developer mTgr8 on 9/12/11.
//  Copyright 2011 mTgr8 Inc. All rights reserved.
//

#import "SchoolAnnotation.h"

@implementation SchoolAnnotation
@synthesize coordinate,details;

- (id) initWithCoordinate:(CLLocationCoordinate2D)aCoordinate details:(NSDictionary*)details{
    coordinate = aCoordinate;
    self.details = details;
    return self;
}

- (NSString *) title {
//    NSLog(details);
    return [NSString stringWithFormat:@"%@",[details objectForKey:@"schoolname"]];
}

- (NSString *) subtitle{
    NSString* schooldistrictname = [self getValue:@"schooldistrictname" formatString:@"%@\n"];
    
    NSString* gradeLevel = [self getValue:@"gradesserved" formatString:@"Grades:%@"];
    NSString* schooltype = [self getValue:@"schooltype" formatString:@" | %@\n"];
    
    NSString* apiScore =[self getInnerValue:@"APIGrowth" key:@"total" formatString:@"API = %@"]; 
    NSString* apiYear = [self getValue:@"APIGrowthYear" formatString:@" ( %@ )\n"]; 
    
    NSString* ayp = [self getValue:@"AYPResult" formatString:@"AYP = %@"];
    NSString* aypYear = [self getValue:@"AYPResultYear" formatString:@" ( %@ )\n"];
    
    NSDecimalNumber* dis = [details objectForKey:@"distance"];
    //NSString* distance = [self getValue:@"distance" formatString:@"%.2f miles"];
    NSString* distance = [NSString stringWithFormat:@"%.2f miles",[dis doubleValue]];
    
    return [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@",schooldistrictname,gradeLevel,schooltype,apiScore,apiYear,ayp,aypYear,distance];
}

-(NSString*) getValue:(NSString*)key formatString:(NSString*)formatString{
    id ret = [details objectForKey:key];
    if( ret == [NSNull null]){        
        return @"";
    }else if([ret isKindOfClass:[NSString class]]){
        if([ret length] == 0){
            return @"";
        }
    }
    return [NSString stringWithFormat:formatString,ret];
}

-(NSString*) getInnerValue:(NSString*)outkey key:(NSString*)key formatString:(NSString*)formatString{
    id ret = [[details objectForKey:outkey] objectForKey:key];
    if( ret == [NSNull null]){        
        return @"";
    }else if([ret isKindOfClass:[NSString class]]){
        if([ret length] == 0){
            return @"";
        }
    }
    return [NSString stringWithFormat:formatString,ret];
}

@end

@implementation PublicSchoolAnnotation

@end

@implementation PrivateSchoolAnnotation

@end
