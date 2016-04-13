//
//  BaseViewController.h
//  YKCares
//
//  Created by jiapeixin on 16/4/6.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YKcaresHeader.h"
#import "YKCaresNoViewController.h"
#import "MBProgressHUD.h"
#import "Alert.h"
#import "BTLabel.h"
@interface BaseViewController : UIViewController
{
    MBProgressHUD *myHUD;
    Alert *myalert;
   
    UIImageView *navBarHairlineImageView;
        
    
    
}
-(void)setpopnewanimation;
-(void)setpushnewanimation;


-(void)hudloadtext:(NSString *)mystring;
-(void)huddismiss;


-(void)hudsuccess:(NSString *)mystring andtimer:(long)timer;
-(void)huderror:(NSString *)mystring andtimer:(long)timer;
-(void)hudwarning:(NSString *)mystring andtimer:(long)timer;

-(void)alertsuccess:(NSString *)mystring andtimer:(long)timer;
-(void)alerterror:(NSString *)mystring andtimer:(long)timer;
-(void)alertwarning:(NSString *)mystring andtimer:(long)timer;


-(void)ykcares;
@end
