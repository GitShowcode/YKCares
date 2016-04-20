//
//  InvitationTableViewCell.m
//  YKCares
//
//  Created by jiapeixin on 16/4/14.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "InvitationTableViewCell.h"
#import "YKCaresNoViewController.h"
@implementation InvitationTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
    
        float key=1;
        if (SCREEN_WIDTH==320) {
            key=0.85;
        }
        else if (SCREEN_WIDTH==414){
            key=1.1;
        }
        else{
            key=1;
        }

        
        self.bgview=[UIView new];
        [self.contentView addSubview:self.bgview];
        self.bgview.frame=CGRectMake(25, 18, SCREEN_WIDTH-50, 94);
        self.bgview.layer.cornerRadius=5;
        self.bgview.layer.borderWidth=.5;
        self.bgview.layer.borderColor=colorRGBA3.CGColor;
        self.bgview.backgroundColor=RGB(255, 254, 250);
        [self.bgview setClipsToBounds:YES];
        
        
        
        self.mylabel=[self createLabelWithFrame:CGRectMake(15, 20, ceil(224*key)-20, 94-40) Font:Fontsize(15) Text:@"使用者  130****1234" Textcolor:[UIColor blackColor] TextAlignment:0];
        self.mylabel.verticalAlignment=BTVerticalAlignmentCenter;
        [self.bgview addSubview:self.mylabel];
        //224
        
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        
        self.getvip=[UIButton buttonWithType:UIButtonTypeCustom];
        self.getvip.titleLabel.font=Fontsize(15);
        self.getvip.frame=CGRectMake(ceil(224*key)-100-15, 94-15-30, 100, 30);
        [self.getvip setTitle:@"邀请注册" forState:JNormal];
        self.getvip.contentHorizontalAlignment=UIControlContentHorizontalAlignmentRight;
        self.getvip.contentVerticalAlignment=UIControlContentVerticalAlignmentBottom;
        [self.getvip setTitleColor:[UIColor blackColor] forState:JNormal];
        [self.bgview addSubview: self.getvip];

        
        [self.bgview addSubview:self.getvip];
        self.lineview=[UIView new];
        [self.bgview addSubview:self.lineview];
        self.lineview.frame=CGRectMake(ceil(224*key), 10, .5, 92-20);
        self.lineview.backgroundColor=colorRGBA3;
        
        self.typeLabel=[self createLabelWithFrame:CGRectMake(ceil(224*key), 0, SCREEN_WIDTH-50-(ceil(224*key)), 94) Font:Fontsize(15) Text:@"已激活\n300012" Textcolor:[UIColor blackColor] TextAlignment:1];
        self.typeLabel.verticalAlignment=BTVerticalAlignmentCenter;
        [self.bgview addSubview:self.typeLabel];
        
        self.typeView=[UIView new];
        [self.bgview addSubview:self.typeView];
        self.typeView.backgroundColor=[UIColor redColor];
        self.typeView.frame=CGRectMake(SCREEN_WIDTH-50-10, 94/2.0-10, 20, 20);
        self.typeView.layer.cornerRadius=10;
    
    }
    
    return self;
    
}

- (BTLabel*) createLabelWithFrame: (CGRect) frame Font:(UIFont *)font Text:(NSString *)text  Textcolor:(UIColor *)color TextAlignment:(NSTextAlignment )textAlignment{
    
    BTLabel *alabel=[[BTLabel alloc] initWithFrame:frame edgeInsets:UIEdgeInsetsZero];
    alabel.font=font;
    alabel.textColor=color;
    alabel.text=text;
    if (textAlignment==1) {
        //默认剧中
        alabel.textAlignment=NSTextAlignmentCenter;
        
    }
    else{
        alabel.textAlignment=textAlignment;
        
    }
    alabel.verticalAlignment = BTVerticalAlignmentTop;
    
    return alabel;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
