//
//  RemoteDoctorViewController.h
//  YKCares
//
//  Created by jiapeixin on 16/4/13.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "BaseViewController.h"
#import "RemoteDobj.h"
@interface RemoteDoctorViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)NSMutableArray *mydatas;

@end
