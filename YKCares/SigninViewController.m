//
//  SigninViewController.m
//  YKCares
//
//  Created by jiapeixin on 16/4/13.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "SigninViewController.h"

@interface SigninViewController ()
{
    
   
    UIView *phoneView;
    UIView *verificationView;
    UIView *nameView;
    UIView *passwordView;
    UIView *againpasswordView;
    UIView *invitationView;
    
    
    UITextField *phoneTF;
    UITextField *verificationTF;
    UITextField *nameTF;
    UITextField *passTF;
    UITextField *againpassTF;
    UITextField *invitationTF;
    
    
    
    UIButton *signinbtn;
    
    UIScrollView *mainScr;
    
    UIButton *getverification;
    
    
    
    NSString *verifyCode;
    NSString *inviteCode;
    NSString *phoneNumber;
    NSString *userName;
    NSString *password;
    NSString *confrimPassword;
    
    
    
}
@end

@implementation SigninViewController

- (void)viewDidLoad {
    
    self.title=@"注册";
    self.view.backgroundColor=[UIColor whiteColor];
    [self _initview];
    [self adddismissTF];
    
    [super viewDidLoad];
    
    
}
-(void)dismissTF{
    [phoneTF resignFirstResponder];
    [nameTF resignFirstResponder];
    [passTF resignFirstResponder];
    [againpassTF resignFirstResponder];
    [invitationTF resignFirstResponder];
    [verificationTF resignFirstResponder];
    
    
}
-(void)_initview{
    /*
     UIView *phoneView;
     UIView *verificationView;
     UIView *nameView;
     UIView *passwordView;
     UIView *againpasswordView;
     UIView *invitationView;
     */
    phoneView = [UIView new];
    [self.view addSubview:phoneView];
    
    verificationView = [UIView new];
    [self.view addSubview:verificationView];
    
    nameView = [UIView new];
    [self.view addSubview:nameView];
    
    passwordView = [UIView new];
    [self.view addSubview:passwordView];
    
    againpasswordView = [UIView new];
    [self.view addSubview:againpasswordView];

    invitationView = [UIView new];
    [self.view addSubview:invitationView];
    
    phoneView.tag=1001;
    verificationView.tag=1001;
    nameView.tag=1001;
    passwordView.tag=1001;
    againpasswordView.tag=1001;
    invitationView.tag=1001;

    
    mainScr= [[UIScrollView alloc] init];
    mainScr.frame=CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    mainScr.contentSize=CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT+1);
    [self.view addSubview:mainScr];
    
    
    float aspace=60;
    float bspace=10;
    
    float viewW = SCREEN_WIDTH-aspace*2;
    float oneviewY = 140;
    float viewH = 45;
    
    
    
    {
        phoneView=[UIView new];
        phoneView.frame=CGRectMake(aspace, oneviewY, viewW, viewH);
        [phoneView addSubview:[self getLineview:CGRectMake(0, 44.5, viewW, .5) andcolor:[UIColor redColor]]];
        [mainScr addSubview:phoneView];
   
        phoneTF=[[UITextField alloc] init];
        phoneTF.borderStyle=UITextBorderStyleRoundedRect;
        phoneTF.frame=CGRectMake(40, 5, 140, 35);
        phoneTF.placeholder=@"手机号";
        [phoneView addSubview:phoneTF];
        
        getverification=[UIButton buttonWithType:UIButtonTypeCustom];
        [getverification setTitleColor:[UIColor blackColor] forState:JNormal];
        getverification.titleLabel.font=Fontsize(12);
        getverification.frame=CGRectMake(40+140+10, 7.5, 60, 30);
        [getverification setTitle:@"发送验证码" forState:JNormal];
        [phoneView addSubview:getverification];
        
        [getverification addTarget:self action:@selector(showverification) forControlEvents:JAction];
        
    }
    
    {
        verificationView=[UIView new];
        verificationView.frame=CGRectMake(aspace, oneviewY+(viewH+bspace)*1, viewW, viewH);
        [verificationView addSubview:[self getLineview:CGRectMake(0, 44.5, viewW, .5) andcolor:[UIColor redColor]]];
        [mainScr addSubview:verificationView];
        
        
        verificationTF=[[UITextField alloc] init];
        verificationTF.borderStyle=UITextBorderStyleRoundedRect;
        verificationTF.frame=CGRectMake(40, 5, 140, 35);
        verificationTF.placeholder=@"验证码";
        [verificationView addSubview:verificationTF];

        
    }
    {
        nameView=[UIView new];
        nameView.frame=CGRectMake(aspace, oneviewY+(viewH+bspace)*2, viewW, viewH);
        [nameView addSubview:[self getLineview:CGRectMake(0, 44.5, viewW, .5) andcolor:[UIColor redColor]]];
        [mainScr addSubview:nameView];
        
        nameTF=[[UITextField alloc] init];
        nameTF.borderStyle=UITextBorderStyleRoundedRect;
        nameTF.frame=CGRectMake(40, 5, 140, 35);
        nameTF.placeholder=@"姓名";
        [nameView addSubview:nameTF];

    }
    {
        passwordView=[UIView new];
        passwordView.frame=CGRectMake(aspace, oneviewY+(viewH+bspace)*3, viewW, viewH);
        [passwordView addSubview:[self getLineview:CGRectMake(0, 44.5, viewW, .5) andcolor:[UIColor redColor]]];
        [mainScr addSubview:passwordView];
        
        passTF=[[UITextField alloc] init];
        passTF.borderStyle=UITextBorderStyleRoundedRect;
        passTF.frame=CGRectMake(40, 5, 140, 35);
        passTF.placeholder=@"密码";
        [passwordView addSubview:passTF];
    }
    {
        againpasswordView=[UIView new];
        againpasswordView.frame=CGRectMake(aspace, oneviewY+(viewH+bspace)*4, viewW, viewH);
        [againpasswordView addSubview:[self getLineview:CGRectMake(0, 44.5, viewW, .5) andcolor:[UIColor redColor]]];
        [mainScr addSubview:againpasswordView];
        
        againpassTF=[[UITextField alloc] init];
        againpassTF.borderStyle=UITextBorderStyleRoundedRect;
        againpassTF.frame=CGRectMake(40, 5, 140, 35);
        againpassTF.placeholder=@"确认密码";
        [againpasswordView addSubview:againpassTF];
    }
    {
        invitationView=[UIView new];
        invitationView.frame=CGRectMake(aspace, oneviewY+(viewH+bspace)*5, viewW, viewH);
        [invitationView addSubview:[self getLineview:CGRectMake(0, 44.5, viewW, .5) andcolor:[UIColor redColor]]];
        [mainScr addSubview:invitationView];
        
        invitationTF=[[UITextField alloc] init];
        invitationTF.borderStyle=UITextBorderStyleRoundedRect;
        invitationTF.frame=CGRectMake(40, 5, 140, 35);
        invitationTF.placeholder=@"邀请码";
        [invitationView addSubview:invitationTF];

    }
    signinbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    signinbtn.frame=CGRectMake(SCREEN_WIDTH/2.0-100, oneviewY+(viewH+bspace)*5+viewH+20, 200, 40);
    signinbtn.layer.cornerRadius=20;
    signinbtn.layer.borderColor=colorRGBA3.CGColor;
    signinbtn.layer.borderWidth=.5;
    [signinbtn setTitle:@"注册" forState:JNormal];
    [signinbtn setTitleColor:[UIColor blackColor] forState:JNormal];
    [signinbtn addTarget:self action:@selector(newsignin) forControlEvents:JAction];
    
    [mainScr addSubview:signinbtn];
    
    
    
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
//获取验证码
-(void)showverification{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
    [dic setObject:@"18611631617" forKey:@"phoneNumber"];
    NSString *api = [NSString stringWithFormat:@"generate/verifyCode.do"];
    
    __weak SigninViewController *myself=self;
    
    [myself setAFNetworkingForWS:api andparameters:dic success:^(NSURLSessionDataTask *task, id responseObject) {
        NSError *error;

        NSDictionary *source=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
        
        long res=[[source objectForKey:@"success"] intValue];
        if (res==1) {
            [self hudsuccess:@"发送成功" andtimer:1];
//            NSDictionary *description=[source objectForKey:@"description"];
//            verifyCode=verifyCode;
            
        }
        else{
            [self huderror:@"发送失败" andtimer:1];

        }
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self alerterror:error.description andtimer:1];
    }];
    
}


#pragma mark-自动登录
-(void)autosignin{
    NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
    NSString *api = [NSString stringWithFormat:@"login/iosLogin.do"];
   
    
    [dic setObject:phoneTF.text forKey:@"phoneNumber"];
    [dic setObject:passTF.text forKey:@"password"];
    [dic setObject:@"暂无" forKey:@"iosPushToken"];
    
    
    
    
    __weak SigninViewController *myself=self;
    [myself setAFNetworkingForWS:api andparameters:dic success:^(NSURLSessionDataTask *task, id responseObject) {
        NSError *error;
        
        NSDictionary *source=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
        
        long res=[[source objectForKey:@"success"] intValue];
        if (res==1) {
            [self hudsuccess:@"登录成功" andtimer:1];
            
            
            
        }
        else{
            NSDictionary *message=[source objectForKey:@"message"];
            NSString *msg=[message objectForKey:@"msg"];
            
            [self huderror:msg andtimer:1];
            
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self huderror:error.description andtimer:1];
        
    }];
    
    
}
#pragma mark-注册
-(void)newsignin{
    
    NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
    NSString *api = [NSString stringWithFormat:@"regist/iosRegist.do"];
    verifyCode=verificationTF.text;
    inviteCode=invitationTF.text;
    
    [dic setObject:verifyCode forKey:@"verifyCode"];
    [dic setObject:inviteCode forKey:@"inviteCode"];
    [dic setObject:phoneTF.text forKey:@"phoneNumber"];
    [dic setObject:nameTF.text forKey:@"userName"];
    [dic setObject:passTF.text forKey:@"password"];
    [dic setObject:againpassTF.text forKey:@"confrimPassword"];
    [dic setObject:@"nil" forKey:@"iosPushToken"];
    
    
    
    __weak SigninViewController *myself=self;
    
    [myself setAFNetworkingForWS:api andparameters:dic success:^(NSURLSessionDataTask *task, id responseObject) {
        NSError *error;
        
        NSDictionary *source=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
        
        long res=[[source objectForKey:@"success"] intValue];
        if (res==1) {
            [self hudsuccess:@"注册成功" andtimer:1];
        }
        else{
            NSDictionary *message=[source objectForKey:@"message"];
            NSString *msg=[message objectForKey:@"msg"];
            [self huderror:msg andtimer:1];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [self alerterror:error.description andtimer:1];
    }];
    
    
    
    
}
@end
