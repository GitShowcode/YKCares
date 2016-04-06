//
//  NSString+OutNull.m
//  LiverDoctor
//
//  Created by jiapeixin on 15/8/10.
//  Copyright (c) 2015年 Gencare_Jia. All rights reserved.
//

#import "NSString+OutNull.h"

@implementation NSString (OutNull)
-(NSString *)getIsNullforstring{
    if ([self isEqualToString:@""] ||self==nil||self==NULL||self==(NSString *)[NSNull null]) {
       return @"暂无";
    }
    return self;
}

-(BOOL)getIsNullforbool{
    if ([self isEqualToString:@""] ||self==nil||self==NULL||self==(NSString *)[NSNull null]||[self isEqualToString:@"null"]) {
        return 0;
    }
    return 1;
}
-(BOOL)getIsNullforboolForprompted:(NSString *)astr{
    if ([self isEqualToString:@""] ||self==nil||self==NULL||self==(NSString *)[NSNull null]||[self isEqualToString:astr]) {
        return 0;
    }
    return 1;
}
@end
