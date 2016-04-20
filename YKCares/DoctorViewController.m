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
#import "HySideScrollingImagePicker.h"
#import <AssetsLibrary/AssetsLibrary.h>
@interface DoctorViewController ()
{
    CAShapeLayer *_shapeLayer;

}
@end

@implementation DoctorViewController

- (void)viewDidLoad {
   
    self.title=@"我的医生";
    self.view.backgroundColor=[UIColor whiteColor];
    
    [super viewDidLoad];
    [self _initview];
    [self newinitview];

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
    float ballwidth = ceilf(69*key);
    float ballspace = (SCREEN_WIDTH-ballwidth*3)/4.0;
    //40
    //247 201 65
    
    NSArray *arrayimgs=@[@"立即回电",@"预约",@"投诉建议"];
    NSArray *arraytitles=@[@"回电",@"预约",@"建议"];

    
    for (int i=0; i<3; i++) {
        UIButton *ballView=[UIButton buttonWithType:UIButtonTypeCustom];
        ballView.layer.cornerRadius=ballwidth/2.0;
        ballView.frame=CGRectMake(ballspace+(ballwidth+ballspace)*i, SCREEN_HEIGHT-40-ballwidth-20, ballwidth, ballwidth);
        ballView.tag=i;
        [ballView addTarget:self action:@selector(pushaction:) forControlEvents:JAction];
        [ballView setBackgroundImage:[UIImage imageNamed:arrayimgs[i]] forState:JNormal];
        ballView.backgroundColor=RGB(247, 201, 65);
        [self.view addSubview:ballView];
        
        
        UILabel *alabel = [[UILabel alloc] init];
        [self.view addSubview:alabel];
        alabel.text=arraytitles[i];
        
        alabel.font=Fontsize(13);
        alabel.textColor=RGB(118, 118, 118);
        alabel.frame=CGRectMake(ballspace+(ballwidth+ballspace)*i, SCREEN_HEIGHT-40-ballwidth-20+ballwidth+10, ballwidth, 15);
        alabel.textAlignment=NSTextAlignmentCenter;

        
    }

    
    
}
-(void)pushaction:(UIButton *)ibtn{
    
    if (ibtn.tag==0) {
        //回电
        [self callme];
        
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
-(void)callme{
    HyActionSheet *sheet=[[HyActionSheet alloc] initWithCancelStr:@"取消" otherButtonTitles:@[@"指定时间",@"10分钟后",@"半小时以后",@"1小时以后"] AttachTitle:@"回电时间"];
    
    [self.navigationController.view addSubview:sheet];
    [sheet ChangeTitleColor:[UIColor redColor] AndIndex:1];
    
    sheet.ButtonIndex=^(NSInteger Buttonindex){
        if (Buttonindex==1) {
        
        }
        else{
            if (Buttonindex==0) {
                
            }
            else{
              [self hudsuccess:@"已经通知" andtimer:1];
            }
        }
    };

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)newinitview{
    
    //476 = 238
    //644 = 322
    
    
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
    
    float mainmoon = 322;
    float minormoon = 84*2;
    float moonheight = ceilf((mainmoon+minormoon)*key);
    _shapeLayer = [CAShapeLayer layer];
    UIBezierPath *tPath = [UIBezierPath bezierPath];
    [tPath moveToPoint:CGPointMake(0, 0)];                          // r1点
    [tPath addLineToPoint:CGPointMake(SCREEN_WIDTH, 0)];            // r2点
    [tPath addLineToPoint:CGPointMake(SCREEN_WIDTH,   ceilf(mainmoon*key))];  // r4点
    
    [tPath addQuadCurveToPoint:CGPointMake(0, ceilf(mainmoon*key))
                  controlPoint:CGPointMake((SCREEN_WIDTH)/2.0, moonheight)]; // r3,r4,r5确定的一个弧线
    
    _shapeLayer.path = tPath.CGPath;
    [tPath closePath];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame=CGRectMake(0, 0, SCREEN_WIDTH, ceilf(mainmoon*key)+ceilf(minormoon/2*key));
    gradient.colors = [NSArray arrayWithObjects:
                       (id)[UIColor colorWithRed:255.0/255 green:213.0/255 blue:61.0/255 alpha:1].CGColor,
                       (id)[UIColor colorWithRed:255.0/255 green:196.0/255 blue:61.0/255 alpha:1].CGColor,nil];
    gradient.mask=_shapeLayer;
    [self.view.layer addSublayer:gradient];
    
    
    UIImageView *headView=[[UIImageView alloc] init];
    [self.view addSubview:headView];
    headView.frame=CGRectMake(SCREEN_WIDTH/2.0-60, 238/2.0-60+64, 120, 120);
    headView.layer.cornerRadius=60;
    [headView setClipsToBounds:YES];
    headView.image=[UIImage imageNamed:@"21-093116_953.jpg"];
    

    
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
