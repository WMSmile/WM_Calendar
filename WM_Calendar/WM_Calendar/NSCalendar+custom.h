//
//  NSCalendar+custom.h
//  WM_Calendar
//
//  Created by KarnetMac on 16/11/30.
//  Copyright © 2016年 WuMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCalendar (custom)
/*计算这个月有多少天*/
- (NSUInteger)numberOfDaysInCurrentMonthByDate:(NSDate *)date;

//获取这个月有多少周
- (NSUInteger)numberOfWeeksInCurrentMonthByDate:(NSDate *)date;

/*计算这个月的第一天是礼拜几*/
- (NSUInteger)weeklyOrdinalityByDate:(NSDate *)date;

//计算这个月最开始的一天
- (NSDate *)firstDayOfCurrentMonthByDate:(NSDate *)date;

//计算这个月最后的一天
- (NSDate *)lastDayOfCurrentMonthByDate:(NSDate *)date;

//上一个月
- (NSDate *)dayInThePreviousMonthByDate:(NSDate *)date;
//下一个月
- (NSDate *)dayInTheFollowingMonthByDate:(NSDate *)date;


//获取当前日期之后的几个月
- (NSDate *)dayInTheFollowingMonth:(int)month Date:(NSDate *)date;

//获取当前日期之后的几个天
- (NSDate *)dayInTheFollowingDay:(int)day Date:(NSDate *)date;

//获取年月日对象
- (NSDateComponents *)YMDComponentsByDate:(NSDate *)date;


//-----------------------------------------
//
//NSString转NSDate
+ (NSDate *)dateFromString:(NSString *)dateString;

//NSDate转NSString
+ (NSString *)stringFromDate:(NSDate *)date;


- (int)getDayNumbertoDay:(NSDate *)today beforDay:(NSDate *)beforday;
//通过数字返回星期几
+(NSString *)getWeekStringFromInteger:(int)week;


//周日是“1”，周一是“2”...
-(int)getWeekIntValueWithDateByDate:(NSDate *)date;




//判断日期是今天,明天,后天,周几
-(NSString *)compareIfTodayByDate:(NSDate *)date;
@end
