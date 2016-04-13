//
//  NewTabbarView2.h
//  Careliver
//
//  Created by jiapeixin on 15/10/14.
//  Copyright © 2015年 Jpxin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTLabel.h"
#import "YKCaresNoViewController.h"

@interface NewTabbarView2 : UIView
@property (nonatomic,strong)UIImageView *showIMG;
@property (nonatomic,strong)BTLabel *mylabel;
@property (nonatomic,strong)UIButton *mybutton;

-(void)newsetshowIMG:(NSString *)imgname andforTitle:(NSString *)atitle andwidth:(CGFloat)awidth andheight:(CGFloat)aheiht andspace:(CGFloat)aspace;
@end
