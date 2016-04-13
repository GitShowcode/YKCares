//
//  TestOneViewController.h
//  YKCares
//
//  Created by jiapeixin on 16/4/12.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "BaseViewController.h"

@interface TestOneViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *mytableview;

@end
