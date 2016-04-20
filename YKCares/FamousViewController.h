//
//  FamousViewController.h
//  YKCares
//
//  Created by jiapeixin on 16/4/13.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "BaseViewController.h"
#import "FamousTableVell.h"
#import "FamousObj.h"

@interface FamousViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,strong)NSMutableArray *mydatas;


@end
