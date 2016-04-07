//
//  ViewController.m
//  YKCares
//
//  Created by jiapeixin on 16/4/6.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  
    
    self.view.backgroundColor=[[UIColor cyanColor] colorWithAlphaComponent:.5];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    
    
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(375/2.0-50, 100, 100, 30);
    [btn setTitle:@"test" forState:JNormal];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(testmethod) forControlEvents:JAction];
    
    [self.view addSubview:btn];
    
  
    
    
}
-(void)testmethod{
    TestViewController *VC=[[TestViewController alloc] init];
    
    [self presentViewController:VC animated:YES completion:^{
        
    }];
    

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
