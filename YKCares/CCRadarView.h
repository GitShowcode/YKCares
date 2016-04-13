//
//  CCRadarView.h
//  QQ侧拉栏的实现
//
//  Created by jiapeixin on 16/3/25.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCRadarView : UIView
{

}

-(instancetype)initWithFrame:(CGRect)frame andThumbnail:(NSString *)thumbnailUrl;
@property (nonatomic,strong)UIImage * thumbnailImage;
@property (nonatomic,weak)CALayer * animationLayer;

@end
