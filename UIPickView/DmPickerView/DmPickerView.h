//
//  DmPickerView.h
//  UIPickView
//
//  Created by 李达志 on 2018/4/17.
//  Copyright © 2018年 LDZ. All rights reserved.
//  简单的PickerView 集成

#import <UIKit/UIKit.h>
@protocol DmPickerViewDelegate<NSObject>


@end
typedef NS_ENUM(NSInteger,DmPickerViewType){
    DmPickerViewType_UIDatePickerModeTime,//苹果原生的UIDatePicker 显示的是上午/下午 +时间+分钟
    DmPickerViewType_UIDatePickerModeDate,//苹果原生的UIDatePicker 显示的是年月日
    DmPickerViewType_UIDatePickerModeDateAndTime,//苹果原生的UIDatePicker 显示的是月日+星期几+上午/下午 +小时+分钟
    DmPickerViewType_UIDatePickerModeCountDownTimer,//苹果原生的UIDatePicker 显示：0houurs+分 min
    DmPickerViewType_OneComponentType
};


@interface DmPickerView : UIView
/** 设置pickView的背景颜色 */
@property (nonatomic,strong) UIColor * pickViewBackgroundColor;


/**
 创建的是苹果原生的时间日期选择器

 @param frame DmPickerView
 @param dmPickerViewType 苹果原生的日期选择器类型
 @param isClearLineView 是否清除LineView的颜色
 @return self
 */
-(instancetype)initWithFrame:(CGRect)frame dmPickerViewType:(DmPickerViewType)dmPickerViewType isClearLineView:(BOOL)isClearLineView;


-(instancetype)initWithFrame:(CGRect)frame dmPickerViewType:(DmPickerViewType)dmPickerViewType oneComponentItems:(NSArray <NSString*> *)oneComponentItems isClearLineView:(BOOL)isClearLineView;

@end
