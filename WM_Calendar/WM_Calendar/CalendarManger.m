//
//  CalendarManger.m
//  WM_Calendar
//
//  Created by KarnetMac on 16/11/30.
//  Copyright © 2016年 WuMeng. All rights reserved.
//

#import "CalendarManger.h"

@implementation CalendarManger

static CalendarManger *managerInstance = nil;

+ (CalendarManger *)sharedManager
{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        managerInstance = [[self alloc] init];
        managerInstance.calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    });
    return managerInstance;
}

@end
