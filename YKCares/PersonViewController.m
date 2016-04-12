//
//  PersonViewController.m
//  YKCares
//
//  Created by jiapeixin on 16/4/12.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "PersonViewController.h"

@interface PersonViewController ()

@end

@implementation PersonViewController

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
    
    NSArray *array=@[@"我的一生",@"我的档案",@"我的邀请"];
   
    
    self.mydatas=[NSMutableArray arrayWithCapacity:10];
    for (int i=0; i<array.count; i++) {
        PersonObj *p=[[PersonObj alloc] init];
        p.mytitle=array[i];
        [self.mydatas addObject:p];
    }
    [self.mytableview reloadData];
    
    //270
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
    
   
    
    TestViewController *VC=[[TestViewController  alloc] init];
    
    self.myblock(VC);
    
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
