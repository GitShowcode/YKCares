//
//  HealthCheckViewController.m
//  YKCares
//
//  Created by jiapeixin on 16/4/13.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "HealthCheckViewController.h"
#import "HealthTableViewCell.h"
#import "DoctorViewController.h"
@interface HealthCheckViewController ()
{
    UIImageView *phoneView;
    
}
@end

@implementation HealthCheckViewController

- (void)viewDidLoad {
    self.title=@"高端体检";
    self.view.backgroundColor=[UIColor whiteColor];
   
    [self createTableviewOne];
    self.mytableviewone.separatorColor=[UIColor clearColor];
    UIImageView *imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"21472572_1369924818660.jpg"]];
    [self.mytableviewone setBackgroundView:imageView];
    [self datasoucre];

    
    [self createPhoneview];
    
    
    [super viewDidLoad];
}
-(void)createPhoneview{
    phoneView=[[UIImageView alloc] init];
    phoneView.frame=CGRectMake(SCREEN_WIDTH-60-20, SCREEN_HEIGHT-60-60, 60, 60);
    phoneView.backgroundColor=[[UIColor greenColor] colorWithAlphaComponent:.5];
    [self.view addSubview:phoneView];
    phoneView.layer.cornerRadius=30;
    phoneView.userInteractionEnabled=YES;
    [phoneView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushdoctor)]];
    
}
-(void)pushdoctor{
    DoctorViewController *VC=[[ DoctorViewController  alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
    
}
-(void)datasoucre{
    
    self.mydatas=[NSMutableArray arrayWithCapacity:10];
    NSArray *titles=@[@"方案设计",@"机构甄选",@"预约陪诊",@"绿色通道"];
    NSArray *contents=@[@"1.中颐至康组建专家团队，根据客户的症状、既往病史和家族史，结合客户的实际需求，为客户提供专业就医建议，选择合适的医院和专家。",@"2.中颐至康组建专家团队，根据客户的症状、既往病史和家族史，结合客户的实际需求，为客户提供专业就医建议，选择合适的医院和专家。",@"3.中颐至康组建专家团队，根据客户的症状、既往病史和家族史，结合客户的实际需求，为客户提供专业就医建议，选择合适的医院和专家。",@"4.中颐至康组建专家团队，根据客户的症状、既往病史和家族史，结合客户的实际需求，为客户提供专业就医建议，选择合适的医院和专家。"];
    
    for (int i=0; i<titles.count; i++) {
        HealthObj *obj=[[HealthObj alloc] init];
        obj.newtitle=titles[i];
        obj.newcontent=contents[i];
        
        [self.mydatas addObject:obj];
    }
    
    [self.mytableviewone reloadData];
    
    
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid = @"remotecell";
    
    HealthTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell==nil) {
        cell=[[HealthTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    HealthObj *obj=self.mydatas[indexPath.row];
    cell.newcontentLabel.text=obj.newcontent;
    cell.newtitleLabel.text=obj.newtitle;
    return cell;
    
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.mydatas.count;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 150;
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
