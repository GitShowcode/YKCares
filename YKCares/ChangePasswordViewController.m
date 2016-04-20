//
//  ChangePasswordViewController.m
//  YKCares
//
//  Created by jiapeixin on 16/4/13.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController ()
{
    UIView *setView1;
    UIView *setView2;
    UIView *setView3;

    UITextField *oldpasswordTF;
    UITextField *passwordTF1;
    UITextField *passwordTF2;

    UIButton *doneButton;
    float fontsize;
    
}
@end

@implementation ChangePasswordViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title=@"修改密码";
    self.view.backgroundColor=[UIColor whiteColor];
    fontsize=14;
    
    
    [self _initview];
    [self adddismissTF];
    
    doneButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [doneButton setTitle:@"修改密码" forState:JNormal];
    doneButton.frame=CGRectMake(SCREEN_WIDTH/2.0-100, 50*4+30, 200, 40);
    doneButton.backgroundColor=RGB(246, 199, 78);
    doneButton.layer.cornerRadius=20;
    [doneButton setTitleColor:[UIColor whiteColor] forState:JNormal];
    [self.view addSubview:doneButton];
    [doneButton addTarget:self action:@selector(changepassword) forControlEvents:JAction];
    //246 199 78
}
-(void)changepassword{
    [self dismissTF];
    
}
-(void)dismissTF{
    [oldpasswordTF resignFirstResponder];
    [passwordTF1 resignFirstResponder];
    [passwordTF2 resignFirstResponder];

}

-(void)_initview{
    float newheight = 50;
    
    setView1=[UIView new];
    [self.view addSubview:setView1];
    setView1.frame=CGRectMake(0, 64, SCREEN_WIDTH, newheight);
    [setView1 addSubview:[self getLineview:CGRectMake(30, newheight-.5, SCREEN_WIDTH-60, .5) andcolor:colorRGBA3]];
    
    
    setView2=[UIView new];
    setView2.frame=CGRectMake(0, 64+newheight, SCREEN_WIDTH, newheight);
    [setView2 addSubview:[self getLineview:CGRectMake(30, newheight-.5, SCREEN_WIDTH-60, .5) andcolor:colorRGBA3]];

    [self.view addSubview:setView2];
    
    setView3=[UIView new];
    setView3.frame=CGRectMake(0, 64+newheight+newheight, SCREEN_WIDTH, newheight);
    [setView3 addSubview:[self getLineview:CGRectMake(30, newheight-.5, SCREEN_WIDTH-60, .5) andcolor:colorRGBA3]];

    [self.view addSubview:setView3];
    
    
    float newX = 42+48;
    
    oldpasswordTF=[UITextField new];
    [setView1 addSubview:oldpasswordTF];
    passwordTF1=[UITextField new];
    [setView2 addSubview:passwordTF1];

    
    passwordTF2=[UITextField new];
    [setView3 addSubview:passwordTF2];
    
    
    
    oldpasswordTF.frame=CGRectMake(newX+30, 10, SCREEN_WIDTH-newX-60, 30);
    passwordTF1.frame=CGRectMake(newX+30, 10, SCREEN_WIDTH-newX-60, 30);
    passwordTF2.frame=CGRectMake(newX+30, 10, SCREEN_WIDTH-newX-60, 30);
    
    
    oldpasswordTF.placeholder=@"输入原密码..";
    passwordTF1.placeholder=@"输入新密码..";
    passwordTF2.placeholder=@"再输入新密码..";

    oldpasswordTF.font=Fontsize(fontsize);
    passwordTF1.font=Fontsize(fontsize);
    passwordTF2.font=Fontsize(fontsize);

//    float zzz=[self getWW:@"旧密码" andfontsize:14];
    
    
    UILabel *label1=[UILabel new];
    label1.text=@"旧密码";
    [setView1 addSubview:label1];
    
    
    UILabel *label2=[UILabel new];
    label2.text=@"新密码";
    [setView2 addSubview:label2];
    
    
    
    UILabel *label3=[UILabel new];
    label3.text=@"新密码";
    [setView3 addSubview:label3];
    
    label1.frame=CGRectMake(30, 10, 42, 30);
    label1.textAlignment=NSTextAlignmentCenter;
    label1.font=Fontsize(fontsize);
    
    label2.frame=CGRectMake(30, 10, 42, 30);
    label2.textAlignment=NSTextAlignmentCenter;
    label2.font=Fontsize(fontsize);
    
    label3.frame=CGRectMake(30, 10, 42, 30);
    label3.textAlignment=NSTextAlignmentCenter;
    label3.font=Fontsize(fontsize);
    
    
}
-(UIView *)getLineview:(CGRect)arect andcolor:(UIColor *)acolor{
    UIView *aview=[UIView new];
    aview.frame=arect;
    aview.backgroundColor=acolor;
    return aview;
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
