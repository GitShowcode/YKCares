//
//  InvitationViewController.h
//  YKCares
//
//  Created by jiapeixin on 16/4/13.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "BaseViewController.h"
#import "InvitationTableViewCell.h"
#import "InviationObj.h"
@interface InvitationViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *mytableview;
@property (nonatomic,strong)NSMutableArray *mydatas;

@end
