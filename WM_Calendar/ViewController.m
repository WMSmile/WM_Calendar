//
//  ViewController.m
//  WM_Calendar
//
//  Created by Mac on 16/3/29.
//  Copyright © 2016年 WuMeng. All rights reserved.
//

#import "ViewController.h"
#import "WM_CalendarView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /**
     日历的实现方法竖排日历支持单选和多选
     */
    WM_CalendarView *calendarViewiew = [[WM_CalendarView alloc]initWithFrame:self.view.frame minDate:[NSDate date] selectDate:nil needDays:60];
    [self.view addSubview:calendarViewiew];
    
    [calendarViewiew sigleClick:^(WM_CalendarDayModel *model) {
        NSLog(@"data==%@",model.date);
        NSLog(@"date--%@",[NSCalendar stringFromDate:model.date]);
    }];
    
//    如果多选的话不要实现此方法sigleClick
//    直接调取calendarViewiew.calendarMonth数组里面遍历(model中isSelectDay为yes的数组)取出你想要的值，不在做实例
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
