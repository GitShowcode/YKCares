//
//  HealthTableViewCell.h
//  YKCares
//
//  Created by jiapeixin on 16/4/15.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "BaseServeTableViewCell.h"
typedef void (^Changetype) (BOOL isopen,int type);

@interface HealthTableViewCell : BaseServeTableViewCell

@property (nonatomic,strong)UIView *bgview;
@property (nonatomic,strong)UILabel *newtitleLabel;
@property (nonatomic,strong)UILabel *bigcontentLabel;
@property (nonatomic,strong)UILabel *newcontentLabel;
@property (nonatomic,copy)Changetype myblock;
@property (nonatomic,strong)UIButton *switchbtn;


@end
