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
        UIImageView *headimg=[[UIImageView alloc] initWithFrame:CGRectMake(95, 40, 80, 80)];
        [headview addSubview:headimg];
        headimg.layer.cornerRadius=40;
        headimg.image=[UIImage imageNamed:@"健康方舟128_meitu_1.jpg"];
 
    }
    
    NSArray *array=@[@"我的医生",@"我的档案",@"我的邀请"];
   
    
    self.mydatas=[NSMutableArray arrayWithCapacity:10];
    for (int i=0; i<array.count; i++) {
        PersonObj *p=[[PersonObj alloc] init];
        p.mytitle=array[i];
        [self.mydatas addObject:p];
    }
    [self.mytableview reloadData];
    
    
    
    UIView *footview=[[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-100, 270, 100)];
    footview.backgroundColor=self.view.backgroundColor;
    [self.view addSubview:footview];
    
    UIButton *outbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    outbtn.frame=CGRectMake(270-80-15,100-30-15 ,80 , 30);
    [outbtn setTitle:@"退出登录" forState:JNormal];
    [outbtn setTitleColor:[UIColor grayColor] forState:JNormal];
    [footview addSubview:outbtn];
    
    
    
    UIButton *changebtn=[UIButton buttonWithType:UIButtonTypeCustom];
    changebtn.frame=CGRectMake(15,100-30-15 ,80 , 30);
    [changebtn setTitle:@"修改密码" forState:JNormal];
    [changebtn setTitleColor:[UIColor grayColor] forState:JNormal];
    [footview addSubview:changebtn];
    
    //270
    [outbtn addTarget:self action:@selector(outlogin) forControlEvents:JAction];
    
    [changebtn addTarget:self action:@selector(changepassword) forControlEvents:JAction];

}
-(void)outlogin{
    
    NSNotification *notification=[NSNotification notificationWithName:@"closeleft" object:self userInfo:nil];
    [[NSNotificationCenter defaultCenter]postNotification:notification];

    
    
   


     LoginViewController *VC=[[LoginViewController alloc] init];
     self.myblock(VC,1);
    
    
}
-(void)changepassword{
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
     static NSString *cellid=@"personcell";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        cell.backgroundColor=RGB(246, 246, 246);
        
        
        UIImageView *myimgview=[[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 30, 30)];
        [cell.contentView addSubview:myimgview];
        myimgview.tag=110;
        
        
        BTLabel *mylabel=[[BTLabel alloc] initWithFrame:CGRectMake(15+30+25, 15, 100, 30) edgeInsets:UIEdgeInsetsZero];
        mylabel.verticalAlignment=BTVerticalAlignmentCenter;
        mylabel.textAlignment=NSTextAlignmentLeft;
        mylabel.font=Fontsize(20);
        [cell.contentView addSubview:mylabel];
        mylabel.tag=119;
        
        
        
    }
    PersonObj *p=self.mydatas[indexPath.row];
    
    UIImageView *imgView=(UIImageView *)[cell.contentView viewWithTag:110];
    imgView.image=[UIImage imageNamed:@"健康方舟128_meitu_1.jpg"];
    
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

@end
