//
//  WM_CalendarView.h
//  WM_Calendar
//
//  Created by Mac on 16/3/29.
//  Copyright © 2016年 WuMeng. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "WM_CalendarDayModel.h"
#import "WM_CalendarDayCollectionViewCell.h"
#import "WM_CalendarMonthCollectionViewLayout.h"
#import "WM_CalendarMonthHeaderView.h"
#import "CalendarManger.h"
#import "NSCalendar+custom.h"


@interface WM_CalendarView : UIView
@property(nonatomic ,strong) NSMutableArray *calendarMonth;//每个月份的中的daymodel容器数组

- (instancetype)initWithFrame:(CGRect)frame minDate:(NSDate *)date  selectDate:(NSDate *)selectdate needDays:(int)days_number;

/**
 *  单次点击的事件（如果多选，那就不要实现此方法）
 *
 *  @param finish <#finish description#>
 */
- (void)sigleClick:(void(^)(WM_CalendarDayModel *model))finish;

@end
