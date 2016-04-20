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
#import "UIDTOKEN.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "SDImageCache.h"


@interface BaseViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    MBProgressHUD *myHUD;
    Alert *myalert;
   
    UIImageView *navBarHairlineImageView;
        
    
    
}
@property (nonatomic,strong)UITableView *mytableviewone;

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


-(void)dismissTF;
-(void)adddismissTF;

-(void)createTableviewOne;
-(void)ykcares;
-(void)setAFNetworkingForWS:(NSString *)api andparameters:(NSDictionary *)parameter success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

-(void)datasource;
-(float)getWW:(NSString *)text andfontsize:(float)newsize;
-(UIView *)getLineview:(CGRect)arect andcolor:(UIColor *)acolor;




@end
