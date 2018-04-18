//
//  PickViewController.h
//  UIPickView
//
//  Created by 李达志 on 2018/4/18.
//  Copyright © 2018年 LDZ. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,PickViewType) {
    PickViewType_UIDatePickerModeTime,
    PickViewType_UIDatePickerModeDate,
    PickViewType_UIDatePickerModeDateAndTime,
    PickViewType_UIDatePickerModeCountDownTimer,
    PickViewType_OneComponentType
};
@interface PickViewController : UIViewController
@property (nonatomic,assign) PickViewType type;
@end
