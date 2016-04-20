//
//  InvitationViewController.m
//  YKCares
//
//  Created by jiapeixin on 16/4/13.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "InvitationViewController.h"

@interface InvitationViewController ()

@end

@implementation InvitationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"我的邀请码";
    
    self.mytableview=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.mytableview.dataSource=self;
    self.mytableview.delegate=self;
    self.mytableview.separatorColor=[UIColor clearColor];
    [self.view addSubview:self.mytableview];

    self.mydatas=[NSMutableArray arrayWithCapacity:10];
    {
    InviationObj *obj=[[InviationObj alloc] init];
    obj.username=@"130****1111";
    obj.resulttype=@"3";// 1  2  3
    obj.activatecode=@"100001";
    obj.activatestatus=@"3";//123
    [self.mydatas addObject:obj];
    }
    
    {
        InviationObj *obj=[[InviationObj alloc] init];
        obj.username=@"130****2222";
        obj.resulttype=@"2";// 1  2  3
        obj.activatecode=@"100002";
        obj.activatestatus=@"2";//123
        [self.mydatas addObject:obj];
    }
    
    
    {
        InviationObj *obj=[[InviationObj alloc] init];
        obj.username=@"130****3333";
        obj.resulttype=@"1";// 1  2  3
        obj.activatecode=@"100003";
        obj.activatestatus=@"1";//123
        [self.mydatas addObject:obj];
    }
}
- (void)didReceiveMemoryWarning {
 
    [super didReceiveMemoryWarning];

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid = @"invitation";
    InvitationTableViewCell  *cell =[tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell==nil) {
        cell=[[InvitationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    InviationObj *obj=self.mydatas[indexPath.row];
    if ([obj.resulttype intValue]==3) {
        cell.typeView.backgroundColor=RGB(62, 81, 117);
        cell.bgview.backgroundColor=RGB(248, 251, 255);
    }
    else{
        cell.typeView.backgroundColor=RGB(248, 213, 102);
        cell.bgview.backgroundColor=RGB(255, 254, 250);

    }
    
    
    return cell;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.mydatas.count;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 94+18;
    
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
