//
//  NewTabbarView2.m
//  Careliver
//
//  Created by jiapeixin on 15/10/14.
//  Copyright © 2015年 Jpxin. All rights reserved.
//

#import "NewTabbarView2.h"

@implementation NewTabbarView2
- (BTLabel*) createLabelWithFrame: (CGRect) frame Font:(UIFont *)font Text:(NSString *)text  Textcolor:(UIColor *)color TextAlignment:(NSTextAlignment )textAlignment{
    
    BTLabel *alabel=[[BTLabel alloc] initWithFrame:frame edgeInsets:UIEdgeInsetsZero];
    alabel.font=font;
    alabel.textColor=color;
    alabel.text=text;
    if (textAlignment==1) {
        //默认剧中
        alabel.textAlignment=NSTextAlignmentCenter;
        
    }
    else{
        alabel.textAlignment=textAlignment;
        
    }
    alabel.verticalAlignment = BTVerticalAlignmentTop;
    
    return alabel;
}

-(float)getWW:(NSString *)text andfontsize:(float)newsize{
    NSDictionary* attrs =@{NSFontAttributeName:[UIFont systemFontOfSize:newsize]};
    NSAttributedString *newatt=[[NSAttributedString alloc] initWithString:text attributes:attrs];
    CGRect rect=[newatt boundingRectWithSize:CGSizeMake(MAXFLOAT, newsize+1) options:NSStringDrawingTruncatesLastVisibleLine context:nil];
    CGSize titleSize=rect.size;
    return titleSize.width;
    
}
-(void)newsetshowIMG:(NSString *)imgname andforTitle:(NSString *)atitle andwidth:(CGFloat)awidth andheight:(CGFloat)aheiht andspace:(CGFloat)aspace{
    
    
    float sizeX=20;
    
    self.showIMG=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, sizeX, sizeX)];
    self.showIMG.image=IMAGE(imgname);
    [self addSubview:self.showIMG];
    
    self.mylabel=[self createLabelWithFrame:CGRectMake(0, 0, 0, 0) Font:Fontsize(11) Text:atitle Textcolor:[UIColor blackColor] TextAlignment:0];
    [self addSubview:self.mylabel];
    
    float ww=[self getWW:atitle andfontsize:11];
    ww=ceilf(ww);
    
    //x
    
    self.showIMG.frame=CGRectMake((awidth-28)/2, 50-5-11-5-sizeX, 28, sizeX);
    self.mylabel.frame=CGRectMake((awidth-ww)/2, 50-5-11-2, ww, 20);
    
    
  //  self.mylabel.frame=CGRectMake(newX+aspace+sizeX, (aheiht - 15)/2.0-2, ww, 20);
    
    self.mybutton=[UIButton buttonWithType:UIButtonTypeCustom];
    self.mybutton.frame=CGRectMake(0, 0, awidth, aheiht);
    [self addSubview:self.mybutton];
    self.mybutton.adjustsImageWhenDisabled=NO;
    self.mybutton.adjustsImageWhenHighlighted=NO;
    
    
    
    
}

@end
