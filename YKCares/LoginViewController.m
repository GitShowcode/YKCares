//
//  LoginViewController.m
//  YKCares
//
//  Created by jiapeixin on 16/4/13.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "LoginViewController.h"
#import "SigninViewController.h"
@interface LoginViewController ()
{
    UIScrollView *scrview;
    UIView *phoneView;
    UIView *passwordView;

    UIImageView *phoneIMG;
    UIImageView *passwordIMG;
    
    UITextField *phoneTF;
    UITextField *passwordTF;

    UILabel *signinLabel;
    
    
    UIButton *loginbtn;
    
    
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    
    self.title=@"登录";
    self.view.backgroundColor= RGB(51, 54, 69);
    //64 69 88

    scrview=[[UIScrollView alloc] init];
    scrview.backgroundColor=RGB(51, 54, 69);
    scrview.contentSize=CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
    scrview.frame=CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:scrview];
    
    
    [self adddismissTF];
    
    
    UIBarButtonItem *bar=[[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(newback)];
    self.navigationItem.leftBarButtonItem=bar;

    [self _initview];
    [super viewDidLoad];
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
    

    //78  56
    float newwidth=250*key;
    
    phoneView = [UIView new];
    //187.5-125
    phoneView.frame=CGRectMake((SCREEN_WIDTH-newwidth)/2.0, 100, 250, 50);
    phoneView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:phoneView];
   
    {
        phoneIMG=[UIImageView new];
        phoneIMG.image=IMAGE(@"电话-已");
        phoneIMG.frame=CGRectMake(0, 10, 25, 25);
        [phoneView addSubview:phoneIMG];
        phoneTF=[[UITextField alloc] init];
        phoneTF.frame=CGRectMake(25+15, 10, newwidth-25-30-25, 30);
        phoneTF.placeholder=@"手机号码";
        phoneTF.textColor=[UIColor whiteColor];
        phoneTF.keyboardType=UIKeyboardTypePhonePad;
        [phoneTF setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
        phoneTF.borderStyle=UITextBorderStyleNone;
        [phoneView addSubview:phoneTF];
        UIView *lineview=[UIView new];
        lineview.backgroundColor=RGB(64, 69, 88);
        lineview.frame=CGRectMake(0, 50-.5, newwidth, .5);
        [phoneView addSubview:lineview];
        
    }
    passwordView = [UIView new];
    passwordView.frame=CGRectMake((SCREEN_WIDTH-newwidth)/2.0, 100+20+50, 250, 50);
    passwordView.backgroundColor=[UIColor clearColor];

    [self.view addSubview:passwordView];
    {
       
        passwordIMG=[UIImageView new];
        passwordIMG.image=IMAGE(@"密码-副本");
        passwordIMG.frame=CGRectMake(0, 11, 25, 25);
        [passwordView addSubview:passwordIMG];
        passwordTF=[[UITextField alloc] init];
        passwordTF.frame=CGRectMake(25+15, 10, newwidth-25-30-25, 30);
        passwordTF.placeholder=@"密码";
        passwordTF.textColor=[UIColor whiteColor];
        passwordTF.keyboardType=UIKeyboardTypeASCIICapable;
        [passwordTF setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
        passwordTF.borderStyle=UITextBorderStyleNone;
        [passwordView addSubview:passwordTF];
        passwordTF.secureTextEntry=YES;
        UIView *lineview=[UIView new];
        lineview.backgroundColor=RGB(64, 69, 88);
        lineview.frame=CGRectMake(0, 50-.5, newwidth, .5);
        [passwordView addSubview:lineview];
    }
    
    loginbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    loginbtn.frame=CGRectMake(SCREEN_WIDTH/2.0-100, 300-50, 200, 40);
    [loginbtn setTitle:@"登录" forState:JNormal];
    loginbtn.layer.borderColor=colorRGBA3.CGColor;
    loginbtn.layer.borderWidth=.5;
    loginbtn.layer.cornerRadius=20;
    
    [loginbtn addTarget:self action:@selector(newlogin) forControlEvents:JAction];
    
    [self.view addSubview:loginbtn];
    
    
    signinLabel=[[UILabel alloc] init];
    signinLabel.frame=CGRectMake(SCREEN_WIDTH/2.0-100+200-180,300-50+30+30-10 , 180-5,20 );
    signinLabel.userInteractionEnabled=YES;
    signinLabel.textAlignment=NSTextAlignmentRight;
    signinLabel.font=Fontsize(13);
    [self.view addSubview:signinLabel];
    
    [signinLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gosignin)]];
    
    
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:@"没有账号  立即注册"];
    [AttributedStr addAttribute:NSForegroundColorAttributeName value:RGB(84, 93, 121) range:NSMakeRange(0, 9)];
   [AttributedStr addAttribute:NSForegroundColorAttributeName value:RGB(108, 122, 160) range:NSMakeRange(5, 5)];
    signinLabel.attributedText=AttributedStr;
    
    
    [self datasource];
    

    
}
-(void)datasource{
    
    
    phoneTF.text=[[NSUserDefaults standardUserDefaults] objectForKey:@"phonenumber"];
    passwordTF.text=[[NSUserDefaults standardUserDefaults] objectForKey:@"password"];

}
-(void)gosignin{
    
    SigninViewController *VC=[[SigninViewController alloc] init];
   
    [self.navigationController pushViewController:VC animated:YES];
    
    
    
}
-(void)newback{
    [self setpopnewanimation];
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dismissTF{
    [phoneTF resignFirstResponder];
    [passwordTF resignFirstResponder];
}


#pragma mark--登录
-(void)newlogin{
    
    NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
    NSString *api = [NSString stringWithFormat:@"login/iosLogin.do"];
    
    [[NSUserDefaults standardUserDefaults] setObject:@"18611631617" forKey:@"phonenumber"];
    [[NSUserDefaults standardUserDefaults] setObject:passwordTF.text forKey:@"password"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    
    [dic setObject:phoneTF.text forKey:@"phoneNumber"];
    [dic setObject:passwordTF.text forKey:@"password"];
    [dic setObject:@"暂无" forKey:@"iosPushToken"];
    
    
    
    
    __weak LoginViewController *myself=self;
    [myself setAFNetworkingForWS:api andparameters:dic success:^(NSURLSessionDataTask *task, id responseObject) {
        NSError *error;
        
        NSDictionary *source=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
        
        long res=[[source objectForKey:@"success"] boolValue];
        if (res==1) {
            NSDictionary *description=[source objectForKey:@"description"];
            
            [self hudsuccess:@"登录成功" andtimer:1];
            [self loginsuccess];
            //userImgUrl
            //userName
            [UIDTOKEN getuidtoken].userimgurl=[description objectForKey:@"userImgUrl"];
            [UIDTOKEN getuidtoken].username=[description objectForKey:@"userName"];

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

-(void)loginsuccess{
   
    [self setpopnewanimation];
    [self.navigationController popViewControllerAnimated:NO];

    
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
