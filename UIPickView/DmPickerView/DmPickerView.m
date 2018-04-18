//
//  DmPickerView.m
//  UIPickView
//
//  Created by 李达志 on 2018/4/17.
//  Copyright © 2018年 LDZ. All rights reserved.
//

#import "DmPickerView.h"
#import "AppMacros.h"
@interface DmPickerView ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic,assign) BOOL isClearLineView;
/** 原生的时间选择器 */
@property (nonatomic,strong) UIDatePicker * datePicker;
/** 简单的pickView实现 */
@property (nonatomic,strong) UIPickerView * pickerView;
/** 只是一列时候的数组 */
@property (nonatomic,strong) NSArray * oneComponentItems;
@end
@implementation DmPickerView
-(instancetype)initWithFrame:(CGRect)frame dmPickerViewType:(DmPickerViewType)dmPickerViewType isClearLineView:(BOOL)isClearLineView{

    if (self=[super initWithFrame:frame]) {
         self.isClearLineView=isClearLineView;
        switch (dmPickerViewType) {

            case DmPickerViewType_UIDatePickerModeDate:
                self.datePicker.datePickerMode=UIDatePickerModeDate;
                [self addSubview:self.datePicker];
                break;
            case DmPickerViewType_UIDatePickerModeTime:
                 self.datePicker.datePickerMode=UIDatePickerModeTime;
                [self addSubview:self.datePicker];
                break;
            case DmPickerViewType_UIDatePickerModeDateAndTime:
                 self.datePicker.datePickerMode=UIDatePickerModeDateAndTime;
                [self addSubview:self.datePicker];
                break;
            case DmPickerViewType_UIDatePickerModeCountDownTimer:
                 self.datePicker.datePickerMode=UIDatePickerModeCountDownTimer;
                [self addSubview:self.datePicker];
                break;
            case DmPickerViewType_OneComponentType:
                [self addSubview:self.pickerView];
                break;
            default:
                break;
        }

    }
    [self clearSeparatorWithView:self.datePicker];
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame dmPickerViewType:(DmPickerViewType)dmPickerViewType oneComponentItems:(NSArray<NSString *> *)oneComponentItems isClearLineView:(BOOL)isClearLineView{
    self.isClearLineView=isClearLineView;
    self.oneComponentItems=oneComponentItems;
    return [self initWithFrame:frame dmPickerViewType:dmPickerViewType isClearLineView:isClearLineView];

}
-(UIDatePicker *)datePicker{
    if (!_datePicker) {
        _datePicker=[[UIDatePicker alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
        _datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
        [_datePicker addTarget:self action:@selector(chageAction) forControlEvents:UIControlEventValueChanged];
        //UIDatePicker 的中间分割线还不清楚为什么无法去除

    }return _datePicker;
}
-(UIPickerView *)pickerView{
    if (!_pickerView) {
        _pickerView=[[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
        _pickerView.delegate=self;
        _pickerView.dataSource=self;
        //设置选中那一行
//        [_pickerView selectRow:3 inComponent:0 animated:YES];
    }return _pickerView;
}
-(void)chageAction{
    NSLog(@"%@",self.datePicker.date);
    NSDate *date = self.datePicker.date;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
    NSString  *string = [[NSString alloc]init];
    string = [dateFormatter stringFromDate:date];
    NSLog(@"string=%@",string);
}
#pragma mark UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.oneComponentItems.count;

}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return 50;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 50;
}
//返回每一行的内容
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.oneComponentItems objectAtIndex:row ];
}
//- (nullable NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component NS_AVAILABLE_IOS(6_0) __TVOS_PROHIBITED; // attributed title is favored if both methods are implemented
//改变显示内容的View
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view {
    if (self.isClearLineView) {
        [self clearSpearatorLine:pickerView];
    }
    UILabel * label=[[UILabel alloc]init];
    label.textAlignment=NSTextAlignmentCenter;
    label.backgroundColor=[UIColor orangeColor];
    label.text=[self.oneComponentItems objectAtIndex:row];
    return label;
}
//当前选中的是是那一组那一行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"%@",[self.oneComponentItems objectAtIndex:row]);
}
- (void)clearSpearatorLine:(UIView*)view
{
    [view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

        if (obj.frame.size.height < 1)
            {
            [obj setBackgroundColor:[UIColor clearColor]];
            }
    }];
}
- (void)clearSeparatorWithView:(UIView * )view
{
    if(view.subviews != 0  )
        {
        if(view.bounds.size.height < 5)
            {
            view.backgroundColor = [UIColor clearColor];
            }

        [view.subviews enumerateObjectsUsingBlock:^( UIView *  obj, NSUInteger idx, BOOL *  stop) {
            [self clearSeparatorWithView:obj];
        }];
        }

}
@end
