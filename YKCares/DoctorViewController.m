//
//  DoctorViewController.m
//  YKCares
//
//  Created by jiapeixin on 16/4/13.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "DoctorViewController.h"
#import "FeedbackViewController.h"
#import "OrderViewController.h"

@interface DoctorViewController ()

@end

@implementation DoctorViewController

- (void)viewDidLoad {
   
    self.title=@"我的医生";
    self.view.backgroundColor=[UIColor whiteColor];
    
    [super viewDidLoad];

    [self _initview];
}
-(void)_initview{
    float key=1;
    if (SCREEN_WIDTH==320) {
        key=0.8;
    }
    else if (SCREEN_WIDTH==414){
        key=1.1;
    }
    else{
        key=1;
    }
    //60
    float ballwidth = ceilf(60*key);
    float ballspace = (SCREEN_WIDTH-ballwidth*3)/4.0;
    //40
    //247 201 65
    for (int i=0; i<3; i++) {
        UIButton *ballView=[UIButton buttonWithType:UIButtonTypeCustom];
        ballView.layer.cornerRadius=ballwidth/2.0;
        ballView.frame=CGRectMake(ballspace+(ballwidth+ballspace)*i, SCREEN_HEIGHT-40-ballwidth, ballwidth, ballwidth);
        ballView.tag=i;
        [ballView addTarget:self action:@selector(pushaction:) forControlEvents:JAction];
        
        ballView.backgroundColor=RGB(247, 201, 65);
        [self.view addSubview:ballView];
        
        
        
    }

    
    
}
-(void)pushaction:(UIButton *)ibtn{
    
    if (ibtn.tag==0) {
        //回电
    }
    else if (ibtn.tag==1){
        //预约
        OrderViewController *VC=[[OrderViewController alloc] init];
        [self.navigationController pushViewController:VC animated:YES];
        
    }
    else if (ibtn.tag==2){
        //
       FeedbackViewController  *VC=[[FeedbackViewController alloc] init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    
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
