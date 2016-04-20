//
//  UIDTOKEN.m
//  YKCares
//
//  Created by jiapeixin on 16/4/19.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "UIDTOKEN.h"

@implementation UIDTOKEN
static UIDTOKEN *myuidtoken;

+(UIDTOKEN *)getuidtoken{
    if (myuidtoken==nil) {
        myuidtoken=[[UIDTOKEN alloc] init];
        
    }
    return myuidtoken;
}

@end
