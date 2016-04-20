//
//  FeedbackViewController.m
//  YKCares
//
//  Created by jiapeixin on 16/4/13.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "FeedbackViewController.h"

@interface FeedbackViewController ()
{
    UIView *setView1;
    UIView *setView2;
    UITextField *planTF;
    UITextField *remarkTF1;
    UIButton *doneButton;
}
@end

@implementation FeedbackViewController

- (void)viewDidLoad {
    
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"意见反馈";
    
    [self _initview];
    [super viewDidLoad];
}

-(void)_initview{
    
    float newheight=50;
    
    setView1=[UIView new];
    [self.view addSubview:setView1];
    setView1.frame=CGRectMake(0, 64, SCREEN_WIDTH, newheight);
    [setView1 addSubview:[self getLineview:CGRectMake(30, newheight-.5, SCREEN_WIDTH-60, .5) andcolor:colorRGBA3]];
    
    
    setView2=[UIView new];
    setView2.frame=CGRectMake(0, 64+newheight, SCREEN_WIDTH, newheight);
    [setView2 addSubview:[self getLineview:CGRectMake(30, newheight-.5, SCREEN_WIDTH-60, .5) andcolor:colorRGBA3]];
    [self.view addSubview:setView2];
 
    
    UILabel *label1=[UILabel new];
    label1.text=@"投诉类型";
    [setView1 addSubview:label1];
    
    
    UILabel *label2=[UILabel new];
    label2.text=@"意见反馈";
    [setView2 addSubview:label2];
    
    
    float fontsize=14;
    
    
    
    
    label1.frame=CGRectMake(30, 10, 56, 30);
    label1.textAlignment=NSTextAlignmentCenter;
    label1.font=Fontsize(fontsize);
    
    label2.frame=CGRectMake(30, 10, 56, 30);
    label2.textAlignment=NSTextAlignmentCenter;
    label2.font=Fontsize(fontsize);
    float newX=56+48;
    
    
    planTF=[UITextField new];
    [setView1 addSubview:planTF];
    remarkTF1=[UITextField new];
    [setView2 addSubview:remarkTF1];
    planTF.frame=CGRectMake(newX+30, 10, SCREEN_WIDTH-newX-60, 30);
    remarkTF1.frame=CGRectMake(newX+30, 10, SCREEN_WIDTH-newX-60, 30);
    planTF.userInteractionEnabled=NO;
    planTF.font=Fontsize(fontsize);
    remarkTF1.font=Fontsize(fontsize);
    planTF.text=@"服务质量";
    remarkTF1.placeholder=@"我觉得...";
    
    
    doneButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [doneButton setTitle:@"确定" forState:JNormal];
    doneButton.frame=CGRectMake(SCREEN_WIDTH/2.0-100, 50*3+30, 200, 40);
    doneButton.backgroundColor=RGB(246, 199, 78);
    doneButton.layer.cornerRadius=20;
    [doneButton setTitleColor:[UIColor whiteColor] forState:JNormal];
    [self.view addSubview:doneButton];
    [doneButton addTarget:self action:@selector(donemethod) forControlEvents:JAction];

    
    
}
-(void)donemethod{
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
