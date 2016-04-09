//
//  TestViewController.m
//  YKCares
//
//  Created by jiapeixin on 16/4/7.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "TestViewController.h"
#import "MBProgressHUD.h"

@interface TestViewController ()
{
    MBProgressHUD *hud;
    
}
@end

@implementation TestViewController
-(void)viewWillAppear:(BOOL)animated{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];

    [super viewWillAppear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[[UIColor purpleColor] colorWithAlphaComponent:1];

    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(375/2.0-50, 100, 100, 30);
    [btn setTitle:@"test" forState:JNormal];
    [btn setBackgroundColor:[UIColor blueColor]];
    [btn addTarget:self action:@selector(testmethod) forControlEvents:JAction];
    [self.view addSubview:btn];
    
    
    UIButton *btn2=[UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame=CGRectMake(375/2.0-50, 100+100, 100, 30);
    [btn2 setTitle:@"test2" forState:JNormal];
    [btn2 setBackgroundColor:[UIColor redColor]];
    [btn2 addTarget:self action:@selector(testmethod2) forControlEvents:JAction];
    
    [self.view addSubview:btn2];
 

}

-(void)testmethod2{
    
    
 //   [self hudwarning:@"发送失败" andtimer:1];
    [self huderror:@"发送失败" andtimer:1];
 //   [self hudsuccess:@"发送成功" andtimer:1];
    
    
    [self alertsuccess:@"错误" andtimer:1];
    
    
    
}
-(void)testmethod{
   
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
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
