//
//  InviationObj.h
//  YKCares
//
//  Created by jiapeixin on 16/4/14.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "YKCaresObj.h"

@interface InviationObj : YKCaresObj
@property (nonatomic,strong)NSString *username;
@property (nonatomic,strong)NSString *resulttype;//获取结果 123
@property (nonatomic,strong)NSString *activatecode;//邀请码 100002
@property (nonatomic,strong)NSString *activatestatus;//邀请码注册结果123

@end
