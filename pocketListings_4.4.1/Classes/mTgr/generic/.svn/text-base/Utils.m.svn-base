//
//  Utils.m
//  retsClient
//
//  Created by Indroniel Deb Roy on 8/9/09.
//  Copyright 2009 mtgr8 Systems Inc.. All rights reserved.
//

#import "Utils.h"
#import "XMLUtil.h"


@implementation Utils

+(NSString *) urlencode: (NSString *) url
{
    NSArray *escapeChars = [NSArray arrayWithObjects:@";" , @"/" , @"?" , @":" ,
							@"@" , @"&" , @"=" , @"+" ,
							@"$" , @"," , @"[" , @"]",
							@"#", @"!", @"'", @"(", 
							@")", @"*",@"|",@" ",@"-",nil];
	
    NSArray *replaceChars = [NSArray arrayWithObjects:@"%3B" , @"%2F" , @"%3F" ,
							 @"%3A" , @"%40" , @"%26" ,
							 @"%3D" , @"%2B" , @"%24" ,
							 @"%2C" , @"%5B" , @"%5D", 
							 @"%23", @"%21", @"%27",
							 @"%28", @"%29", @"%2A", @"%7C",@"%20",@"%2D",nil];
	
    int len = [escapeChars count];
	
    NSMutableString *temp = [url mutableCopy];
	
    int i;
    for(i = 0; i < len; i++)
    {
		
        [temp replaceOccurrencesOfString: [escapeChars objectAtIndex:i]
							  withString:[replaceChars objectAtIndex:i]
								 options:NSLiteralSearch
								   range:NSMakeRange(0, [temp length])];
    }
	
    NSString *out = [NSString stringWithString: temp];
	[temp release];
    return out;
}

+ (void)showErrorAlert:(NSString*)msg
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alertView show];
	UIImage *theImage = [UIImage imageNamed:@"black-bg-small_new.png"];
	CGSize theSize = [alertView frame].size;
	UIGraphicsBeginImageContext(theSize);    
	[theImage drawInRect:CGRectMake(0, 0, theSize.width, theSize.height)];    
	//theImage = UIGraphicsGetImageFromCurrentImageContext();    
	UIGraphicsEndImageContext();
	//[alertView setBackgroundColor:[UIColor colorWithPatternImage:theImage]];
	//[[alertView layer] setContents:[theImage CGImage]];
	
	[alertView release];
}


+(NSString*) formatMinMaxPrice:(NSString*)aStr{
    NSString* resStr=nil;
    // alloc formatter
    NSNumberFormatter *currencyStyle = [[NSNumberFormatter alloc] init];
    
    // set options.
    [currencyStyle setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [currencyStyle setNumberStyle:kCFNumberFormatterCurrencyStyle];
    [currencyStyle setMaximumFractionDigits:0];
    
    int index = [aStr rangeOfString:@":"].location;
    if(index != NSNotFound){
        NSString* minStr = [aStr substringToIndex:index];
        NSNumber *minNum = [XMLUtil getNumberFromString:minStr];
        NSString* fminStr;
        if( minNum ){
            fminStr = [currencyStyle stringFromNumber:minNum]; 
        }
        
        if( aStr.length == index+1+1){
            resStr = [NSString stringWithFormat:@"%@-",fminStr];
        }else{
            NSString *fmaxStr;
            NSString* maxStr =[aStr substringFromIndex:index+1];
            NSNumber *maxNum = [XMLUtil getNumberFromString:maxStr];
            if( maxNum ){
                fmaxStr = [currencyStyle stringFromNumber:maxNum];
            }
            resStr = [NSString stringWithFormat:@"%@-%@",fminStr,fmaxStr];
        }
        
    }else{
        index = [aStr rangeOfString:@"+"].location;
        if(index != NSNotFound){
            NSString* minStr = [aStr substringToIndex:index];
            NSNumber* minNum = [XMLUtil getNumberFromString:minStr];
            NSString* fminStr;
            if( minNum ){
                fminStr = [currencyStyle stringFromNumber:minNum];                
            }
            resStr = [NSString stringWithFormat:@"%@+",fminStr];
        }else{
            index = [aStr rangeOfString:@"-"].location;
            if(index != NSNotFound){
                NSString* maxStr = [aStr substringToIndex:index];
                NSString* fmaxStr;
                NSNumber* maxNum = [XMLUtil getNumberFromString:maxStr];
                if( maxNum ){
                    fmaxStr = [currencyStyle stringFromNumber:maxNum];
                }
                resStr = [NSString stringWithFormat:@"%@-",fmaxStr];
            }
        }
    }
    
    [currencyStyle release];
    return resStr!=nil?resStr:aStr;
}

+(NSString*)formatMinMaxStr:(NSString*)aStr{
    NSString* resStr=nil;
    int index = [aStr rangeOfString:@":"].location;
    if(index != NSNotFound){
        NSString* minStr = [aStr substringToIndex:index];
        float minNum = [[XMLUtil getNumberFromString:minStr] floatValue];
        NSString* fminStr;
        if( minNum ){
            if( minNum < 1){
                fminStr = @"1";
            }else if( minNum > 1 && minNum < 2){
                fminStr = @"2";
            }else if( minNum > 2 && minNum < 3){
                fminStr = @"3";
            }else if( minNum > 3 && minNum < 4){
                fminStr = @"4";
            }else if(minNum > 4 && minNum< 5){
                fminStr = @"5";
            }else if( minNum > 5 && minNum < 6){
                fminStr = @"6";
            }
            
        }
        if( aStr.length == index+1+1){
            resStr = [NSString stringWithFormat:@"%@-",fminStr];
        }else{
            NSString *fmaxStr;
            NSString* maxStr =[aStr substringFromIndex:index+1];
            float maxNum = [maxStr floatValue];
            if( maxNum ){
                if( maxNum > 1 && maxNum < 2){
                    fmaxStr = @"1"; 
                }else if( maxNum > 2 && maxNum < 3){
                    fmaxStr = @"2"; 
                }else if( maxNum > 3 && maxNum < 4){
                    fmaxStr = @"3"; 
                }else if( maxNum > 4 && maxNum < 5){
                    fmaxStr = @"4"; 
                }else if( maxNum > 5 && maxNum < 6){
                    fmaxStr = @"5"; 
                }else if( maxNum > 6){
                    fmaxStr = @"6+"; 
                }
            }
            resStr = [NSString stringWithFormat:@"%@-%@",fminStr,fmaxStr];
        }
    }else{
        index = [aStr rangeOfString:@"+"].location;
        if(index != NSNotFound){
            NSString* minStr = [aStr substringToIndex:index];
            float minNum = [[XMLUtil getNumberFromString:minStr] floatValue];
            NSString* fminStr;
            if( minNum ){
                if( minNum < 1){
                    fminStr = @"1";
                }else if( minNum > 1 && minNum < 2){
                    fminStr = @"2";
                }else if( minNum > 2 && minNum < 3){
                    fminStr = @"3";
                }else if( minNum > 3 && minNum < 4){
                    fminStr = @"4";
                }else if(minNum > 4 && minNum< 5){
                    fminStr = @"5";
                }else if( minNum > 5 && minNum < 6){
                    fminStr = @"6";
                }
                
            }
            resStr = [NSString stringWithFormat:@"%@+",fminStr];
        }else{
            index = [aStr rangeOfString:@"-"].location;
            if(index != NSNotFound){
                NSString* maxStr = [aStr substringToIndex:index];
                NSString* fmaxStr;
                float maxNum = [[XMLUtil getNumberFromString:maxStr] floatValue];
                if( maxNum ){
                    if( maxNum > 1 && maxNum < 2){
                        fmaxStr = @"1"; 
                    }else if( maxNum > 2 && maxNum < 3){
                        fmaxStr = @"2"; 
                    }else if( maxNum > 3 && maxNum < 4){
                        fmaxStr = @"3"; 
                    }else if( maxNum > 4 && maxNum < 5){
                        fmaxStr = @"4"; 
                    }else if( maxNum > 5 && maxNum < 6){
                        fmaxStr = @"5"; 
                    }else if( maxNum > 6){
                        fmaxStr = @"6"; 
                    }
                }
                resStr = [NSString stringWithFormat:@"%@-",fmaxStr];
            }
        }
        
        
    }
    
    return resStr!=nil?resStr:aStr;
}



@end
