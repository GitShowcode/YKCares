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
{
    Alert *alert;
    
}
@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
   
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    
    [super viewWillAppear:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  

    self.view.backgroundColor=[[UIColor cyanColor] colorWithAlphaComponent:.5];
    
    
    
    
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(375/2.0-50, 100, 100, 30);
    [btn setTitle:@"test" forState:JNormal];
    [btn setBackgroundColor:[UIColor redColor]];
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
