//
//  TestViewController.m
//  YKCares
//
//  Created by jiapeixin on 16/4/7.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:1];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];

    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(375/2.0-50, 100, 100, 30);
    [btn setTitle:@"test" forState:JNormal];
    [btn setBackgroundColor:[UIColor blueColor]];
    [btn addTarget:self action:@selector(testmethod) forControlEvents:JAction];
    [self.view addSubview:btn];

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
