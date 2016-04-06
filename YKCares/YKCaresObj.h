//
//  YKCaresObj.h
//  YKCares
//
//  Created by jiapeixin on 16/4/6.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+OutNull.h"
#import "NSDictionary+JJson.h"
@interface YKCaresObj : NSObject

+(NSString *)getzeroisnull:(NSString *)str;
+(NSString *)getisnull:(NSString *)key andkeydic:(NSDictionary *)keydic;
+(YKCaresObj *)analysis:(NSDictionary *)keydic;


@end
