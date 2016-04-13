//
//  LoginViewController.m
//  YKCares
//
//  Created by jiapeixin on 16/4/13.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    
    self.title=@"登录";
    self.view.backgroundColor=[UIColor whiteColor];

    UIBarButtonItem *bar=[[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(newback)];
    self.navigationItem.leftBarButtonItem=bar;
    

    [super viewDidLoad];
}
-(void)newback{
    [self setpopnewanimation];
    [self.navigationController popViewControllerAnimated:NO];
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
