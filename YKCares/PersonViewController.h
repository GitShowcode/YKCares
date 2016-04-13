//
//  PersonViewController.h
//  YKCares
//
//  Created by jiapeixin on 16/4/12.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "BaseViewController.h"
#import "PersonObj.h"
#import "TestViewController.h"

typedef void (^PushVC) (UIViewController *VC,int type);

@interface PersonViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *mytableview;
@property (nonatomic,strong)NSMutableArray *mydatas;
@property (nonatomic,copy)PushVC myblock;




@end
