//
//  MainViewController.h
//  YKCares
//
//  Created by jiapeixin on 16/4/12.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "BaseViewController.h"
#import "CCRadarView.h"
#import "BTLabel.h"
typedef void (^ ChangePan) (BOOL isopen);
typedef void (^ OpenLeftVC) (BOOL isopen);

@interface MainViewController : BaseViewController
{

}
@property (nonatomic,copy)ChangePan myblock;
@property (nonatomic,copy)OpenLeftVC openblock;

@end
