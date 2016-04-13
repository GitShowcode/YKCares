//
//  BaseViewController.m
//  YKCares
//
//  Created by jiapeixin on 16/4/6.
//  Copyright © 2016年 Gencare_Jia. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
-(void)ykcares{
    
    
    
}
-(void)setpopnewanimation{
    CATransition *transition = [CATransition animation];transition.duration = 0.5f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromBottom;
    transition.delegate = self;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
}
-(void)setpushnewanimation{
    
    CATransition *transition = [CATransition animation];
    
    transition.duration = 0.5f;
    transition.timingFunction =
    [CAMediaTimingFunction functionWithName:
     kCAMediaTimingFunctionDefault];
    transition.type = kCATransitionMoveIn;
    transition.subtype = kCATransitionFromTop;
    transition.delegate = self;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    
}

/*--------------hud--------------**/

-(void)hudloadtext:(NSString *)mystring{
    [self inithud];
    myHUD.mode=MBProgressHUDModeIndeterminate;
    myHUD.labelText=mystring;
    myHUD.animationType=MBProgressHUDAnimationZoomOut;
    
}
-(void)hudsuccess:(NSString *)mystring andtimer:(long)timer{
   
    [self basehudshow:mystring andtimer:timer andimgname:@"Ok_78.904109589041px_1183433_easyicon.net"];
}
-(void)huderror:(NSString *)mystring andtimer:(long)timer{
    
    [self basehudshow:mystring andtimer:timer andimgname:@"Delete_72px_1183403_easyicon.net"];

}
-(void)hudwarning:(NSString *)mystring andtimer:(long)timer{
    
    [self basehudshow:mystring andtimer:timer andimgname:@"Warning_71.654676258993px_1183460_easyicon.net"];
}

-(void)basehudshow:(NSString *)mystring andtimer:(long)timer andimgname:(NSString *)aname{

    [self inithud];
  
    myHUD.mode=MBProgressHUDModeCustomView;
    myHUD.labelText=mystring;
    UIImageView *contView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 36, 36)];
    contView.image=IMAGE(aname);
    myHUD.customView=contView;
    myHUD.animationType=MBProgressHUDAnimationZoomOut;
    [myHUD hide:YES afterDelay:timer];

}

-(void)alertsuccess:(NSString *)mystring andtimer:(long)timer{
  
    [self alertbase:mystring andtimer:timer andtype:AlertTypeSuccess];
    
}
-(void)alerterror:(NSString *)mystring andtimer:(long)timer{
   
    [self alertbase:mystring andtimer:timer andtype:AlertTypeError];
}
-(void)alertwarning:(NSString *)mystring andtimer:(long)timer{
   
    [self alertbase:mystring andtimer:timer andtype:AlertTypeWarning];
}

-(void)alertbase:(NSString *)mystring andtimer:(long)timer andtype:(NSUInteger)i{
    
    myalert= [[Alert alloc] initWithTitle:mystring duration:timer completion:^{
    }];
    [myalert setIncomingTransition:AlertIncomingTransitionTypeInYoFace];
    [myalert setOutgoingTransition:AlertOutgoingTransitionTypeSlideToTop];
    [myalert setShowStatusBar:NO];
    [myalert setAlertType:i]; //Yellow
    [myalert showAlert];
    
}
-(void)huddismiss{
    [myHUD hide:YES];
}
-(void)inithud{
    myHUD=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
