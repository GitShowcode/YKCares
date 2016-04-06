//
//  NSDictionary+JJson.m
//  Careliver
//
//  Created by jiapeixin on 15/8/24.
//  Copyright (c) 2015年 Jpxin. All rights reserved.
//

#import "NSDictionary+JJson.h"

@implementation NSDictionary (JJson)
-(NSString *)objectForKeyforj:(id)aKey{
    NSString *str;
    str=[NSString stringWithFormat:@"%@",[self objectForKey:aKey]];
    
    if ([str isEqualToString:@""]||[str isEqualToString:@"<null>"]) {
        str=@"null";
    }
    return str;
}

@end
