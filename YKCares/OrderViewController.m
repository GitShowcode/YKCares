//
//  OrderViewController.m
//  YKCares
//
//  Created by jiapeixin on 16/4/13.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "OrderViewController.h"

@interface OrderViewController ()
{
    UIView *setView1;
    UIView *setView2;
    UIView *setView3;

    UITextField *planTF;
    UITextField *remarkTF1;
    UIButton *doneButton;

    UITextField *hospitalTF;

    
    
    
}
@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"预约服务";

    [self _initview];
    
}
-(void)_initview{
    float newheight = 50;
    
    setView1=[UIView new];
    [self.view addSubview:setView1];
    setView1.frame=CGRectMake(0, 64, SCREEN_WIDTH, newheight);
    [setView1 addSubview:[self getLineview:CGRectMake(30, newheight-.5, SCREEN_WIDTH-60, .5) andcolor:colorRGBA3]];
    
    
    setView2=[UIView new];
    setView2.frame=CGRectMake(0, 64+newheight, SCREEN_WIDTH, newheight);
    [setView2 addSubview:[self getLineview:CGRectMake(30, newheight-.5, SCREEN_WIDTH-60, .5) andcolor:colorRGBA3]];
    [self.view addSubview:setView2];
    
    setView3=[UIView new];
    setView3.frame=CGRectMake(0, 64+newheight+newheight, SCREEN_WIDTH, newheight);
    [setView3 addSubview:[self getLineview:CGRectMake(30, newheight-.5, SCREEN_WIDTH-60, .5) andcolor:colorRGBA3]];
    
    [self.view addSubview:setView3];
    
    
    UILabel *label1=[UILabel new];
    label1.text=@"任务编号";
    [setView1 addSubview:label1];
    
    
    UILabel *label2=[UILabel new];
    label2.text=@"医院";
    [setView2 addSubview:label2];
    
    
    float fontsize=14;
    
    UILabel *label3=[UILabel new];
    label3.text=@"备注";
    [setView3 addSubview:label3];
    
    label1.frame=CGRectMake(30, 10, 56, 30);
    label1.textAlignment=NSTextAlignmentCenter;
    label1.font=Fontsize(fontsize);
    
    label2.frame=CGRectMake(30, 10, 28, 30);
    label2.textAlignment=NSTextAlignmentCenter;
    label2.font=Fontsize(fontsize);
    
    label3.frame=CGRectMake(30, 10, 28, 30);
    label3.textAlignment=NSTextAlignmentCenter;
    label3.font=Fontsize(fontsize);
    float newX=42+48;
    
    planTF=[UITextField new];
    [setView1 addSubview:planTF];
    hospitalTF=[UITextField new];
    [setView2 addSubview:hospitalTF];
    remarkTF1=[UITextField new];
    [setView3 addSubview:remarkTF1];
    
    planTF.frame=CGRectMake(newX+30, 10, SCREEN_WIDTH-newX-60, 30);
    hospitalTF.frame=CGRectMake(newX+30, 10, SCREEN_WIDTH-newX-60, 30);
    remarkTF1.frame=CGRectMake(newX+30, 10, SCREEN_WIDTH-newX-60, 30);
    planTF.text=@"保健指导";
    hospitalTF.text=@"301医院";
    
    planTF.userInteractionEnabled=NO;
    hospitalTF.userInteractionEnabled=NO;
    
    remarkTF1.placeholder=@"备注";

    planTF.font=Fontsize(fontsize);
    hospitalTF.font=Fontsize(fontsize);
    remarkTF1.font=Fontsize(fontsize);

    doneButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [doneButton setTitle:@"预约服务" forState:JNormal];
    doneButton.frame=CGRectMake(SCREEN_WIDTH/2.0-100, 50*4+30, 200, 40);
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
