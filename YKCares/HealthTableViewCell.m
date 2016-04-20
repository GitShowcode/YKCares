//
//  HealthTableViewCell.m
//  YKCares
//
//  Created by jiapeixin on 16/4/15.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "HealthTableViewCell.h"
#import "YKCaresNoViewController.h"
@implementation HealthTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor=[UIColor clearColor];
        self.bgview=[UIView new];
        self.bgview.frame=CGRectMake(0,15, SCREEN_WIDTH, 120);
        self.bgview.backgroundColor=[RGB(51, 51, 57) colorWithAlphaComponent:.6];
        [self.contentView addSubview:self.bgview];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        
        
        self.newtitleLabel=[UILabel new];
        [self.bgview addSubview:self.newtitleLabel];
        self.newtitleLabel.frame=CGRectMake(0, 60-15, SCREEN_WIDTH-0, 30);
        self.newtitleLabel.font=[UIFont boldSystemFontOfSize:15];
        self.newtitleLabel.textColor=[UIColor whiteColor];
        
        self.newtitleLabel.textAlignment=NSTextAlignmentCenter;
        
        
        self.bigcontentLabel=[UILabel new];
        [self.bgview addSubview:self.bigcontentLabel];
        self.bigcontentLabel.frame=CGRectMake(0, 60, SCREEN_WIDTH, 0);
        [self.bigcontentLabel setClipsToBounds:YES];
        self.bigcontentLabel.backgroundColor=[UIColor whiteColor];
        self.bigcontentLabel.textColor=[UIColor blackColor];
        
        
        
        self.newcontentLabel=[UILabel new];
        [self.bigcontentLabel addSubview:self.newcontentLabel];
        self.newcontentLabel.frame=CGRectMake(15, 0, SCREEN_WIDTH-30, 90);
        self.newcontentLabel.backgroundColor=[UIColor whiteColor];
        self.newcontentLabel.textColor=[UIColor blackColor];
        self.newcontentLabel.font=Fontsize(13);
        self.newcontentLabel.userInteractionEnabled=YES;
        self.newcontentLabel.numberOfLines=0;
        
        self.switchbtn=[UIButton buttonWithType:UIButtonTypeCustom];
        [self.bgview addSubview:self.switchbtn];
        self.switchbtn.frame=CGRectMake(0, 0, self.bgview.frame.size.width, self.bgview.frame.size.height);
        [self.switchbtn addTarget:self action:@selector(show) forControlEvents:JAction];
        self.switchbtn.tag=110;
        
        
    }
    
    return self;
    
}
-(void)show{
    
    if (self.switchbtn.tag==110) {
        [UIView animateWithDuration:.3 animations:^{
            self.newtitleLabel.frame=CGRectMake(0, 0, SCREEN_WIDTH, 30);
            
        }];
        
        [UIView animateWithDuration:.40 animations:^{
            self.bigcontentLabel.frame=CGRectMake(0, 30, SCREEN_WIDTH, 90);
            
        } completion:^(BOOL finished) {
            self.switchbtn.tag=119;
        }];
        
    }
    else{
        [UIView animateWithDuration:0.3 animations:^{
            self.newtitleLabel.frame=CGRectMake(0, 60-15, SCREEN_WIDTH, 30);
            
        }];
        
        [UIView animateWithDuration:.4 animations:^{
            self.bigcontentLabel.transform=CGAffineTransformScale(self.bigcontentLabel.transform, 1, 0.01);
            
        } completion:^(BOOL finished) {
            self.bigcontentLabel.transform=CGAffineTransformScale(self.bigcontentLabel.transform, 1, 100);
            self.bigcontentLabel.frame=CGRectMake(0, 60, SCREEN_WIDTH, 0);
            
            self.switchbtn.tag=110;
            
            
        }];
    }
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
