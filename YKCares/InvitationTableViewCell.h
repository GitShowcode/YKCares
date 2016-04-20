//
//  InvitationTableViewCell.h
//  YKCares
//
//  Created by jiapeixin on 16/4/14.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTLabel.h"

@interface InvitationTableViewCell : UITableViewCell


@property (nonatomic,strong)BTLabel *mylabel;
@property (nonatomic,strong)UIButton *getvip;
@property (nonatomic,strong)UIView *bgview;
@property (nonatomic,strong)UIView *lineview;
@property (nonatomic,strong)BTLabel *typeLabel;
@property (nonatomic,strong)UIView *typeView;



@end
