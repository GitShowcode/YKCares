//
//  UIDTOKEN.h
//  YKCares
//
//  Created by jiapeixin on 16/4/19.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "YKCaresObj.h"

@interface UIDTOKEN : YKCaresObj
+(UIDTOKEN *)getuidtoken;
@property (nonatomic,strong)NSString *userimgurl;
@property (nonatomic,strong)NSString *username;

@end
