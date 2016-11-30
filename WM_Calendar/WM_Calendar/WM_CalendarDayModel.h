//
//  WM_CalendarDayModel.h
//  WM_Calendar
//
//  Created by Mac on 16/3/29.
//  Copyright © 2016年 WuMeng. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "NSDate+Calendar.h"
#import "CalendarManger.h"


typedef NS_ENUM(NSInteger, WM_CollectionViewCellDayType) {
    WM_CellDayTypeEmpty,   //不显示
    WM_CellDayTypePast,    //过去的日期
    WM_CellDayTypeFutur,   //将来的日期
    WM_CellDayTypeWeek,    //周末
};
@interface WM_CalendarDayModel : NSObject
@property (assign, nonatomic) WM_CollectionViewCellDayType style;//显示的样式

@property (nonatomic, assign) NSUInteger day;//天
@property (nonatomic, assign) NSUInteger month;//月
@property (nonatomic, assign) NSUInteger year;//年
@property (nonatomic, assign) NSUInteger week;//周

@property (nonatomic, assign) BOOL isSelectedDay;//是否被选中


@property (nonatomic, strong) NSString *Chinese_calendar;//农历
@property (nonatomic, strong) NSString *holiday;//节日


+ (WM_CalendarDayModel *)calendarDayWithYear:(NSUInteger)year month:(NSUInteger)month day:(NSUInteger)day;
- (NSDate *)date;//返回当前天的NSDate对象
- (NSString *)toString;//返回当前天的NSString对象
- (NSString *)getWeek; //返回星期
- (BOOL)isEqualTo:(WM_CalendarDayModel *)day;//判断是不是同一天


@end
/**
 *  ///////////////////////////////////////////////////////////////////////////////////////
 */
@interface WM_CalendarDayModel (Calendar)

/**
 *  数据的封装
 *
 *  @param date        当前的日期
 *  @param date1       选中的某一日
 *  @param days_number 显示多少天的数据
 *
 *  @return 一个数组包含WM_CalendarDayModel
 */
+ (NSMutableArray *)reloadCalendarView:(NSDate *)date  selectDate:(NSDate *)date1 needDays:(int)days_number byCalendar:(NSCalendar *)calendar;


@end












