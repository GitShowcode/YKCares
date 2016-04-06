//
//  YKCaresObj.m
//  YKCares
//
//  Created by jiapeixin on 16/4/6.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "YKCaresObj.h"

@implementation YKCaresObj


+(NSString *)getisnull:(NSString *)key andkeydic:(NSDictionary *)keydic{
    
    id obj=[keydic objectForKeyforj:key];
    if (obj==nil ||obj==(NSString *)[NSNull null]||obj==(NSArray *)[NSNull null]||obj==NULL||[obj isEqualToString:@"<null>"]) {
        return @"null";
    }
    else{
        if ([obj isKindOfClass:[NSString class]]) {
            if ([obj isEqualToString:@""]) {
                return @"null";
            }
            else{
                return obj;
                
            }
        }
        else{
            return obj;
            
        }
        
        
    }
    return obj;
}
+(NSString *)getzeroisnull:(NSString *)str{
    if ([str isEqualToString:@"null"]) {
        return @"0";
    }
    return str;
}
+(YKCaresObj *)analysis:(NSDictionary *)keydic{
    return [YKCaresObj new];
}



@end
