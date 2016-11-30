# WM_Calendar 非常适合自己定义使用
使用方法：
  /**
     日历的实现方法竖排日历支持单选和多选
     */
    WM_CalendarView *calendarViewiew = [[WM_CalendarView alloc]initWithFrame:self.view.frame minDate:[NSDate date] selectDate:nil needDays:60];
    [self.view addSubview:calendarViewiew];
    
    [calendarViewiew sigleClick:^(WM_CalendarDayModel *model) {
        NSLog(@"%@",model.date);
    }];
    
//    如果多选的话不要实现此方法sigleClick
//    直接调取calendarViewiew.calendarMonth数组里面遍历(model中isSelectDay为yes的数组)取出你想要的值，不在做实例
