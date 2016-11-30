//
//  CalendarManger.h
//  WM_Calendar
//
//  Created by KarnetMac on 16/11/30.
//  Copyright © 2016年 WuMeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalendarManger : NSObject
@property(nonatomic,strong)NSCalendar *calendar;
+ (CalendarManger *)sharedManager;

@end
