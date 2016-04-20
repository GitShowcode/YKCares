//
//  MainViewController.m
//  YKCares
//
//  Created by jiapeixin on 16/4/12.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "MainViewController.h"

#import "HealthCheckViewController.h"
#import "RemoteDoctorViewController.h"
#import "FamousViewController.h"

#import "LoginViewController.h"
#import "DoctorViewController.h"
#import "TestOneViewController.h"
static BOOL newopen;

@interface MainViewController ()
{
    UIView *mainBgview;
    CAShapeLayer *_shapeLayer;
    CCRadarView *radarView;
    
    
}
@end

@implementation MainViewController
-(void)viewWillAppear:(BOOL)animated{
    self.myblock(1);
   // navBarHairlineImageView.hidden = YES;

    [radarView removeFromSuperview];

    
    
    radarView=[[CCRadarView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2.0-60, 10, 120, 120) andThumbnail:@"21-093116_953.jpg"];
    [mainBgview addSubview:radarView];
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [radarView addSubview:btn];
    btn.frame=CGRectMake(0, 0, 120, 120);
    btn.backgroundColor=[UIColor clearColor];
    [btn addTarget:self action:@selector(newmethod) forControlEvents:JAction];


    [super viewWillAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated{
    self.myblock(0);
//    navBarHairlineImageView.hidden = NO;

    [super viewWillDisappear:animated];
}
/*
 
 -(void)viewWillAppear:(BOOL)animated{
 [super viewWillAppear:animated];
 
 }
 -(void)viewWillDisappear:(BOOL)animated{
 
 [super viewWillDisappear:animated];
 
 }
 */
-(void)testone{
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=RGB(51, 54, 68);
    self.title=@"首页";
    
    [self _initview];
    //44 30
    UIBarButtonItem *item=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"菜单"] style:UIBarButtonItemStylePlain target:self action:@selector(newtestone)];
    [self.navigationItem setLeftBarButtonItem:item];
    NSNotification *notification=[NSNotification notificationWithName:@"closeleft" object:self userInfo:nil];
    [[NSNotificationCenter defaultCenter]postNotification:notification];

    
}
-(void)_initview{
    
    // ip6 bg总 (484+320) /2 =302  --667
    
    // ip6p bg总 (484+320) /2 =302 --736
    
    // ip5 bg总 (484+320) /2 =302  --568
    
    //1.1
    
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
    
    
    float bgviewheight=ceilf(402*key);
    float bgviewwidth=SCREEN_WIDTH-30;
    float bgviewy=120+64;
    
    
    float bootomheight =bgviewheight*160.0/402;
    
    //月亮
    float mainmoon = 167;
    float minormoon = 100;
    float moonheight = ceilf((mainmoon+minormoon)*key);
    
 
    if (SCREEN_HEIGHT==480) {
        bgviewy=64+50;
        
    }
    
    
    mainBgview=[UIView new];
    [self.view addSubview:mainBgview];
    mainBgview.frame=CGRectMake(15, bgviewy, bgviewwidth, bgviewheight);
    mainBgview.backgroundColor=[UIColor whiteColor];
    _shapeLayer = [CAShapeLayer layer];
    UIBezierPath *tPath = [UIBezierPath bezierPath];
    [tPath moveToPoint:CGPointMake(0, 0)];                          // r1点
    [tPath addLineToPoint:CGPointMake(SCREEN_WIDTH-30, 0)];            // r2点
    [tPath addLineToPoint:CGPointMake(SCREEN_WIDTH-30,   ceilf(mainmoon*key))];  // r4点
    
    [tPath addQuadCurveToPoint:CGPointMake(0, ceilf(mainmoon*key))
                  controlPoint:CGPointMake((SCREEN_WIDTH-30)/2.0, moonheight)]; // r3,r4,r5确定的一个弧线
    
    _shapeLayer.path = tPath.CGPath;
    [tPath closePath];
    
    
    //渐变
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame=CGRectMake(0, 0, SCREEN_WIDTH-30, ceilf(mainmoon*key)+ceilf(minormoon/2*key));
    gradient.colors = [NSArray arrayWithObjects:
                       (id)[UIColor colorWithRed:255.0/255 green:213.0/255 blue:61.0/255 alpha:1].CGColor,
                       (id)[UIColor colorWithRed:255.0/255 green:196.0/255 blue:61.0/255 alpha:1].CGColor,nil];
    gradient.mask=_shapeLayer;
    [mainBgview.layer addSublayer:gradient];
    // 线
    UIView *lineview=[UIView new];
    lineview.frame=CGRectMake(15, bgviewheight-bootomheight, SCREEN_WIDTH-60, .5);
    lineview.backgroundColor=colorRGBA3;
    [mainBgview addSubview:lineview];
   
    BTLabel *otherlabel=[self createLabelWithFrame:CGRectMake(15, bgviewheight-bootomheight+15, 56, 16) Font:Fontsize(14) Text:@"其他服务" Textcolor:RGB(118, 118, 118) TextAlignment:0];
    otherlabel.verticalAlignment=BTVerticalAlignmentCenter;
    [mainBgview addSubview:otherlabel];
    
    
    
    BTLabel *mylabel=[self createLabelWithFrame:CGRectMake(SCREEN_WIDTH-56-15-30, 14, 56, 16) Font:Fontsize(14) Text:@"我的服务" Textcolor:RGB(118, 118, 118) TextAlignment:2];
    mylabel.verticalAlignment=BTVerticalAlignmentCenter;
    [mainBgview addSubview:mylabel];
    
    
    //60
    float ballwidth = ceilf(60*key);
    float ballspace = (SCREEN_WIDTH-ballwidth*3-30)*0.625/2.0;
    float newballspace =(SCREEN_WIDTH-ballwidth*3-30)*0.375/2.0;
    
    //120 --320
    //
    //40
    NSArray *arraytitles=@[@"名医诊疗",@"高端体检",@"远程诊疗"];
    NSArray *arrayimgs=@[@"首页－高端体检",@"首页－名医诊疗",@"首页－远程会诊"];

    //247 201 65
    for (int i=0; i<3; i++) {
        UIButton *ballView=[UIButton buttonWithType:UIButtonTypeCustom];
        ballView.layer.cornerRadius=ballwidth/2.0;
        ballView.frame=CGRectMake(newballspace+(ballwidth+ballspace)*i, bgviewheight-40-ballwidth, ballwidth, ballwidth);
        ballView.tag=i;
        [ballView addTarget:self action:@selector(pushaction:) forControlEvents:JAction];
//        ballView.backgroundColor=RGB(247, 201, 65);
        [ballView setBackgroundImage:IMAGE(arrayimgs[i]) forState:JNormal];
        [mainBgview addSubview:ballView];
        
        UILabel *alabel = [[UILabel alloc] init];
        [mainBgview addSubview:alabel];
        alabel.text=arraytitles[i];
        
        alabel.font=Fontsize(13);
        alabel.textColor=RGB(118, 118, 118);
        alabel.frame=CGRectMake(newballspace+(ballwidth+ballspace)*i, bgviewheight-40-ballwidth+10+ballwidth, ballwidth, 14);
        alabel.textAlignment=NSTextAlignmentCenter;
        
        
    }
    
}
-(void)newmethod{
    
    
    DoctorViewController *VC=[[DoctorViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
    
   
//    LoginViewController *VC=[[LoginViewController alloc] init];
//    
//    [self.navigationController pushViewController:VC animated:NO];
}

-(void)pushaction:(UIButton * )ibtn{
    UIViewController *VC;
    
    if (ibtn.tag==0) {
        VC=[[FamousViewController alloc] init];
    }
    else if (ibtn.tag==1){
        VC=[[HealthCheckViewController alloc] init];

    }
    else if (ibtn.tag==2){
        VC=[[RemoteDoctorViewController alloc] init];

    }
    [self.navigationController pushViewController:VC animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
-(void)newtestone{
    newopen=1;
    
    if (self.openblock) {

        self.openblock(newopen);
        
    }
    
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
