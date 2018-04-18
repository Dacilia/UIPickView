//
//  MainController.m
//  UIPickView
//
//  Created by 李达志 on 2018/4/17.
//  Copyright © 2018年 LDZ. All rights reserved.
//

#import "MainController.h"
#import "DmPickerView.h"
#import "AppMacros.h"
#import "PickViewController.h"
@interface MainController ()
@property (nonatomic,strong) DmPickerView * dmPickerView;
@end

@implementation MainController
    //UIDatePickerModeTime 显示的是上午/下午 +时间+分钟
    //UIDatePickerModeDate 显示的是年月日
    //UIDatePickerModeDateAndTime 显示的是月日+星期几+上午/下午 +小时+分钟
    //UIDatePickerModeCountDownTimer显示：0houurs+分 min
- (void)viewDidLoad {
    [super viewDidLoad];


}
//picker只有一行
- (IBAction)oneComponentRow:(id)sender {
    PickViewController*vc=[[PickViewController alloc]init];
    vc.type=PickViewType_OneComponentType;
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)UIDatePickerModeDate:(id)sender {
    PickViewController*vc=[[PickViewController alloc]init];
    vc.type=PickViewType_UIDatePickerModeDate;
    [self presentViewController:vc animated:YES completion:nil];
}
- (IBAction)UIDatePickerModeDateAndTime:(id)sender {
    PickViewController*vc=[[PickViewController alloc]init];
    vc.type=PickViewType_UIDatePickerModeDateAndTime;
    [self presentViewController:vc animated:YES completion:nil];

}

- (IBAction)UIDatePickerModeCountDownTimer:(id)sender {
    PickViewController*vc=[[PickViewController alloc]init];
    vc.type=PickViewType_UIDatePickerModeCountDownTimer;
    [self presentViewController:vc animated:YES completion:nil];

}
- (IBAction)UIDatePickerModeTime:(id)sender {
    PickViewController*vc=[[PickViewController alloc]init];
    vc.type=PickViewType_UIDatePickerModeTime;
    [self presentViewController:vc animated:YES completion:nil];

    
}


@end
