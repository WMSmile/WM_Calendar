//
//  NSCalendar+custom.m
//  WM_Calendar
//
//  Created by KarnetMac on 16/11/30.
//  Copyright © 2016年 WuMeng. All rights reserved.
//

#import "NSCalendar+custom.h"

@implementation NSCalendar (custom)
/*计算这个月有多少天*/
- (NSUInteger)numberOfDaysInCurrentMonthByDate:(NSDate *)date
{
    // 频繁调用 [NSCalendar currentCalendar] 可能存在性能问题

    return [self rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date].length;

}


//获取这个月有多少周
- (NSUInteger)numberOfWeeksInCurrentMonthByDate:(NSDate *)date
{
    NSUInteger weekday = [self weeklyOrdinalityByDate: [self firstDayOfCurrentMonthByDate:date] ];
    NSUInteger days = [self numberOfDaysInCurrentMonthByDate:date];
    NSUInteger weeks = 0;
    
    if (weekday > 1) {
        weeks += 1, days -= (7 - weekday + 1);
    }
    
    weeks += days / 7;
    weeks += (days % 7 > 0) ? 1 : 0;
    
    return weeks;
}



/*计算这个月的第一天是礼拜几*/
- (NSUInteger)weeklyOrdinalityByDate:(NSDate *)date
{

    return [self ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitWeekOfYear forDate:date];
}



//计算这个月最开始的一天
- (NSDate *)firstDayOfCurrentMonthByDate:(NSDate *)date
{
    NSDate *startDate = nil;
    BOOL ok = [self rangeOfUnit:NSCalendarUnitMonth startDate:&startDate interval:NULL forDate:date];
    NSAssert1(ok, @"Failed to calculate the first day of the month based on %@", self);
    return startDate;
}


- (NSDate *)lastDayOfCurrentMonthByDate:(NSDate *)date
{
    
    NSCalendarUnit calendarUnit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *dateComponents = [self components:calendarUnit fromDate:date];
    dateComponents.day = [self numberOfDaysInCurrentMonthByDate:date];
    return [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
}

//上一个月
- (NSDate *)dayInThePreviousMonthByDate:(NSDate *)date
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = -1;
    return [self dateByAddingComponents:dateComponents toDate:date options:0];
}

//下一个月
- (NSDate *)dayInTheFollowingMonthByDate:(NSDate *)date
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = 1;
    return [self dateByAddingComponents:dateComponents toDate:date options:0];
}


//获取当前日期之后的几个月
- (NSDate *)dayInTheFollowingMonth:(int)month Date:(NSDate *)date
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = month;
    return [self dateByAddingComponents:dateComponents toDate:date options:0];
}

//获取当前日期之后的几个天
- (NSDate *)dayInTheFollowingDay:(int)day Date:(NSDate *)date
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.day = day;
    return [self dateByAddingComponents:dateComponents toDate:date options:0];
}

//获取年月日对象
- (NSDateComponents *)YMDComponentsByDate:(NSDate *)date
{
    return [self components:(NSCalendarUnitYear|NSCalendarUnitMonth |NSCalendarUnitDay | NSCalendarUnitWeekday) fromDate:date];
}


//-----------------------------------------
//
//NSString转NSDate
+ (NSDate *)dateFromString:(NSString *)dateString
{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    //    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    [dateFormatter setDateFormat: @"yyyy-MM-dd"];
    
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    
    return destDate;
    
}



//NSDate转NSString
+ (NSString *)stringFromDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    //    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
//    //目标时区
//    NSTimeZone * destinationTimeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
//    [dateFormatter setTimeZone:destinationTimeZone];
    
    NSString *destDateString = [dateFormatter stringFromDate:date];
    
    return destDateString;
}


- (int)getDayNumbertoDay:(NSDate *)today beforDay:(NSDate *)beforday
{
    
    NSDateComponents *components = [self components:NSCalendarUnitDay fromDate:today toDate:beforday options:0];
    NSInteger day = [components day];//两个日历之间相差多少月//    NSInteger days = [components day];//两个之间相差几天
    return (int)day;
}
//通过数字返回星期几
+(NSString *)getWeekStringFromInteger:(int)week
{
    NSString *str_week;
    
    switch (week) {
        case 1:
            str_week = @"周日";
            break;
        case 2:
            str_week = @"周一";
            break;
        case 3:
            str_week = @"周二";
            break;
        case 4:
            str_week = @"周三";
            break;
        case 5:
            str_week = @"周四";
            break;
        case 6:
            str_week = @"周五";
            break;
        case 7:
            str_week = @"周六";
            break;
    }
    return str_week;
}


//周日是“1”，周一是“2”...
-(int)getWeekIntValueWithDateByDate:(NSDate *)date

{
    int weekIntValue;
    
    NSDateComponents *comps= [self components:(NSCalendarUnitYear|NSCalendarUnitMonth |NSCalendarUnitDay | NSCalendarUnitWeekday) fromDate:date];
    return weekIntValue = (int)[comps weekday];
}




//判断日期是今天,明天,后天,周几
-(NSString *)compareIfTodayByDate:(NSDate *)date

{
    NSDate *todate = [NSDate date];//今天
    NSDateComponents *comps_today= [self components:(NSCalendarUnitYear|NSCalendarUnitMonth |NSCalendarUnitDay | NSCalendarUnitWeekday) fromDate:todate];
    
    
    NSDateComponents *comps_other= [self components:(NSCalendarUnitYear|NSCalendarUnitMonth |NSCalendarUnitDay | NSCalendarUnitWeekday) fromDate:date];
    
    
    //获取星期对应的数字
    int weekIntValue = [self getWeekIntValueWithDateByDate:date];
    
    if (comps_today.year == comps_other.year &&
        comps_today.month == comps_other.month &&
        comps_today.day == comps_other.day) {
        return @"今天";
        
    }else if (comps_today.year == comps_other.year &&
              comps_today.month == comps_other.month &&
              (comps_today.day - comps_other.day) == -1){
        return @"明天";
        
    }else if (comps_today.year == comps_other.year &&
              comps_today.month == comps_other.month &&
              (comps_today.day - comps_other.day) == -2){
        return @"后天";
        
    }else{
        //直接返回当时日期的字符串(这里让它返回空)
        return [NSCalendar getWeekStringFromInteger:weekIntValue];//周几
    }
}




@end
