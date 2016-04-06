//
//  NSString+OutNull.h
//  LiverDoctor
//
//  Created by jiapeixin on 15/8/10.
//  Copyright (c) 2015年 Gencare_Jia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (OutNull)

-(NSString *)getIsNullforstring;
-(BOOL )getIsNullforbool;
-(BOOL)getIsNullforboolForprompted:(NSString *)astr;

@end
