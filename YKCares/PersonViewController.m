//
//  PersonViewController.m
//  YKCares
//
//  Created by jiapeixin on 16/4/12.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "PersonViewController.h"

#import "DoctorViewController.h"
#import "ArchivesViewController.h"
#import "InvitationViewController.h"
#import "ChangePasswordViewController.h"
#import "LoginViewController.h"
@interface PersonViewController ()
{
    NSString *userimgurl;
    UIImageView *headimg;
    
}
@end

@implementation PersonViewController
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
}
-(void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //51 54 68
    self.view.backgroundColor=RGB(246, 246, 246);

    
    self.navigationController.navigationBarHidden=YES;
    self.edgesForExtendedLayout=NO;
    
    
    self.mytableview=[[UITableView alloc] initWithFrame:CGRectMake(0, 20, 270, SCREEN_HEIGHT-20) style:UITableViewStylePlain];
    self.mytableview.dataSource=self;
    self.mytableview.delegate=self;
    self.mytableview.backgroundColor=RGB(246, 246, 246);
    self.mytableview.separatorColor=[UIColor clearColor];
    [self.view addSubview:self.mytableview];
    
    
    UIView *headview=[UIView new];
    headview.frame=CGRectMake(0, 0, 270, 160);
    headview.backgroundColor=RGB(246, 246, 246);
    [self.mytableview setTableHeaderView:headview];
    
    {
        headimg =[[UIImageView alloc] initWithFrame:CGRectMake(95, 40, 80, 80)];
        [headview addSubview:headimg];
        headimg.layer.cornerRadius=40;
        headimg.image=[UIImage imageNamed:@"健康方舟128_meitu_1.jpg"];
        headimg.userInteractionEnabled=YES;
        [headimg addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeHeadIMG)]];
       
        
    }
    
    NSArray *array=@[@"我的医生",@"我的档案",@"我的邀请"];
    NSArray *arrayimgs=@[@"医生",@"档案",@"我的邀请"];

    
    self.mydatas=[NSMutableArray arrayWithCapacity:10];
    for (int i=0; i<array.count; i++) {
        PersonObj *p=[[PersonObj alloc] init];
        p.mytitle=array[i];
        p.iconname=arrayimgs[i];
        
        [self.mydatas addObject:p];
    }
    [self.mytableview reloadData];
    
    
    
    UIView *footview=[[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-100, 270, 100)];
    footview.backgroundColor=self.view.backgroundColor;
    [self.view addSubview:footview];
    
    //29 31
    
    UIButton *outbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    outbtn.frame=CGRectMake(270-48-15,100-30+2.5 ,48 , 12);
    [outbtn setTitle:@"退出登录" forState:JNormal];
    [outbtn setTitleColor:[UIColor grayColor] forState:JNormal];
    [footview addSubview:outbtn];
    outbtn.titleLabel.font=Fontsize(12);

    
    UIImageView *IMG2=[[UIImageView alloc] init];
    IMG2.image=IMAGE(@"退出-副本@2x");
    IMG2.frame=CGRectMake(270-48-15-13.5-5, 100-30, 13.5, 15.5);
    
    [footview addSubview:IMG2];

    
    
    UIButton *changebtn=[UIButton buttonWithType:UIButtonTypeCustom];
    changebtn.frame=CGRectMake(35,100-30+2.5 ,48 , 12);
    [changebtn setTitle:@"修改密码" forState:JNormal];
    [changebtn setTitleColor:[UIColor grayColor] forState:JNormal];
    changebtn.titleLabel.font=Fontsize(12);
    [footview addSubview:changebtn];
    
    //270
    [outbtn addTarget:self action:@selector(outlogin) forControlEvents:JAction];
    
    [changebtn addTarget:self action:@selector(changepassword) forControlEvents:JAction];
    
    
    UIImageView *IMG1=[[UIImageView alloc] init];
    IMG1.image=IMAGE(@"修改密码");
    IMG1.frame=CGRectMake(15, 100-30, 13.5, 15.5);
    
    [footview addSubview:IMG1];
    
    [self autologin];
    

}
-(void)outlogin{
    
    NSNotification *notification=[NSNotification notificationWithName:@"closeleft" object:self userInfo:nil];
    [[NSNotificationCenter defaultCenter]postNotification:notification];
     LoginViewController *VC=[[LoginViewController alloc] init];
     self.myblock(VC,1);
    
    
}
-(void)changepassword{
    NSNotification *notification=[NSNotification notificationWithName:@"closeleft" object:self userInfo:nil];
    [[NSNotificationCenter defaultCenter]postNotification:notification];
    ChangePasswordViewController *VC=[[ChangePasswordViewController alloc] init];
    self.myblock(VC,0);
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
     static NSString *cellid=@"personcell";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.backgroundColor=RGB(246, 246, 246);
        
        
        UIImageView *myimgview=[[UIImageView alloc] initWithFrame:CGRectMake(45, 11, 38, 38)];
        [cell.contentView addSubview:myimgview];
        myimgview.tag=110;
        
        
        BTLabel *mylabel=[[BTLabel alloc] initWithFrame:CGRectMake(15+30+25+30, 15, 100, 30) edgeInsets:UIEdgeInsetsZero];
        mylabel.verticalAlignment=BTVerticalAlignmentCenter;
        mylabel.textAlignment=NSTextAlignmentLeft;
        mylabel.font=Fontsize(15);
        [cell.contentView addSubview:mylabel];
        mylabel.tag=119;
        
        UIView *lineview=[UIView new];
        lineview.frame=CGRectMake(45, 59.5, 180, .5);
        lineview.backgroundColor=colorRGBA3;
        [cell.contentView addSubview:lineview];
        
        
        
    }
    PersonObj *p=self.mydatas[indexPath.row];
    
    UIImageView *imgView=(UIImageView *)[cell.contentView viewWithTag:110];
    imgView.image=[UIImage imageNamed:p.iconname];
    
    BTLabel *mylabel=(BTLabel *)[cell.contentView viewWithTag:119];
    mylabel.text=p.mytitle;
    
    
    return cell;
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
    return self.mydatas.count;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    //[self closeLeftView];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    NSNotification *notification=[NSNotification notificationWithName:@"closeleft" object:self userInfo:nil];
    [[NSNotificationCenter defaultCenter]postNotification:notification];
    
   
    

    UIViewController *VC;
    
    if (indexPath.row==0) {
      
        VC=[[DoctorViewController alloc] init];
    }
    else if (indexPath.row==1)
    {
        VC=[[ArchivesViewController alloc] init];
    }
    else if (indexPath.row==2){
   
        VC=[[InvitationViewController alloc] init];
    }
    
    self.myblock(VC,0);
    
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

-(void)changeHeadIMG{
    
    NSString *api=[NSString stringWithFormat:@"%@user/uploadUserImg.do",Baseurl];
    NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
    
    [dic setObject:@"18611631617" forKey:@"phoneNumber"];
    [dic setObject:@"app" forKey:@"client"];
    
    __weak PersonViewController *myself=self;

    UIImage *image=[UIImage imageNamed:@"21-093116_953.jpg"];
    
    NSData *data=UIImageJPEGRepresentation(image, 1);
   
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval=15;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer=[AFHTTPRequestSerializer serializer];
    
    [manager POST:api parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:data name:@"head1.jpg" fileName:@"head2.jpg" mimeType:@"jpg"];

    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error;
        NSDictionary *source=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
        long res= [[source objectForKey:@"success"] boolValue];
        NSDictionary *message=[source objectForKey:@"message"];
      
        
        NSString *msg=[message objectForKey:@"msg"];
        
        if (res==true) {
            NSString *loginStatus=[source objectForKey:@"loginStatus"];
            if ([loginStatus intValue]==999) {
                [self huderror:@"用户已过期" andtimer:1];
                
            }
            else{
            userimgurl=[source objectForKey:@"userImgUrl"];
            [self hudsuccess:@"修改成功" andtimer:1];
            }
        }
        else{
            [self huderror:msg andtimer:1];

        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self alerterror:@"上传失败" andtimer:1];
        
    }];
    

}
-(void)autologin{
   
    
   
    
    if (![[[NSUserDefaults standardUserDefaults]objectForKey:@"phonenumber"] getIsNullforbool]) {
        
    }
    else{
        NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
        NSString *api = [NSString stringWithFormat:@"login/iosLogin.do"];
    [dic setObject:[[NSUserDefaults standardUserDefaults]objectForKey:@"phonenumber"] forKey:@"phoneNumber"];
    [dic setObject:[[NSUserDefaults standardUserDefaults]objectForKey:@"password"] forKey:@"password"];
    [dic setObject:@"暂无" forKey:@"iosPushToken"];
    
    
    
    
    __weak PersonViewController *myself=self;
    [myself setAFNetworkingForWS:api andparameters:dic success:^(NSURLSessionDataTask *task, id responseObject) {
        NSError *error;
        
        NSDictionary *source=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
        
        long res=[[source objectForKey:@"success"] boolValue];
        if (res==1) {
            NSDictionary *description=[source objectForKey:@"description"];
            
            [self hudsuccess:@"登录成功" andtimer:1];
            //userImgUrl
            //userName
            [UIDTOKEN getuidtoken].userimgurl=[description objectForKey:@"userImgUrl"];
            [UIDTOKEN getuidtoken].username=[description objectForKey:@"userName"];
            
            [self reloadview];
            
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
    
    

}

-(void)reloadview{
    
    [headimg sd_setImageWithURL:[NSURL URLWithString:[UIDTOKEN getuidtoken].userimgurl] placeholderImage:[UIImage imageNamed:@"健康方舟128_meitu_1.jpg"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
}
@end
