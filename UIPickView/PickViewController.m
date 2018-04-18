//
//  PickViewController.m
//  UIPickView
//
//  Created by 李达志 on 2018/4/18.
//  Copyright © 2018年 LDZ. All rights reserved.
//

#import "PickViewController.h"
#import "DmPickerView.h"
#import "AppMacros.h"
@interface PickViewController ()

@end

@implementation PickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setuppikcview];
    UIButton*button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, 0, kScreenWidth, 50);
    button.backgroundColor=[UIColor orangeColor];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];

}
-(void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)setuppikcview{

    DmPickerViewType type;
    switch (self.type) {
        case PickViewType_UIDatePickerModeDate:
            type=DmPickerViewType_UIDatePickerModeDate;
            [self setupIosPickerDate:type];
            break;
        case PickViewType_UIDatePickerModeTime:
            type=DmPickerViewType_UIDatePickerModeTime;
            [self setupIosPickerDate:type];
            break;
        case PickViewType_UIDatePickerModeCountDownTimer:
            type=DmPickerViewType_UIDatePickerModeCountDownTimer;
            [self setupIosPickerDate:type];
            break;
        case PickViewType_UIDatePickerModeDateAndTime:
            type=DmPickerViewType_UIDatePickerModeDateAndTime;
            [self setupIosPickerDate:type];
            break;
        case PickViewType_OneComponentType:
            type=DmPickerViewType_OneComponentType;
            [self setUpPickerView:type];
            break;
        default:
            break;
    }


}
-(void)setupIosPickerDate:(DmPickerViewType)type{
    DmPickerView*pickView=[[DmPickerView alloc]initWithFrame:CGRectMake(0, 200, kScreenWidth, kScreenHeight-100) dmPickerViewType:type isClearLineView:YES];
    [self.view addSubview:pickView];
}
-(void)setUpPickerView:(DmPickerViewType)type{
    DmPickerView*pickview=[[DmPickerView alloc]initWithFrame:CGRectMake(0, 200, kScreenWidth, kScreenHeight-200) dmPickerViewType:DmPickerViewType_OneComponentType oneComponentItems:@[@"拼过",@"雪梨",@"香蕉",@"龙眼"] isClearLineView:NO];
    [self.view addSubview:pickview];
}
@end
