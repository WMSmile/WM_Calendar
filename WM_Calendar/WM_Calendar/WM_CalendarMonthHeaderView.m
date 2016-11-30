//
//  WM_CalendarMonthHeaderView.m
//  WM_Calendar
//
//  Created by Mac on 16/3/29.
//  Copyright © 2016年 WuMeng. All rights reserved.
//

#import "WM_CalendarMonthHeaderView.h"
@interface WM_CalendarMonthHeaderView()
@property (strong, nonatomic) UILabel *day1OfTheWeekLabel;
@property (strong, nonatomic) UILabel *day2OfTheWeekLabel;
@property (strong, nonatomic) UILabel *day3OfTheWeekLabel;
@property (strong, nonatomic) UILabel *day4OfTheWeekLabel;
@property (strong, nonatomic) UILabel *day5OfTheWeekLabel;
@property (strong, nonatomic) UILabel *day6OfTheWeekLabel;
@property (strong, nonatomic) UILabel *day7OfTheWeekLabel;

@end
#define CATDayLabelWidth  40.0f*APP_SCALE_W_5s_WM
#define CATDayLabelHeight 20.0f*APP_SCALE_W_5s_WM

@implementation WM_CalendarMonthHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}

- (void)setup
{
    
    self.clipsToBounds = YES;
    
    //月份
    UILabel *masterLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30.f*APP_SCALE_W_5s_WM)];
    [masterLabel setBackgroundColor:[UIColor clearColor]];
    [masterLabel setTextAlignment:NSTextAlignmentCenter];
    [masterLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:17.0f*APP_SCALE_W_5s_WM]];
    self.masterLabel = masterLabel;
    self.masterLabel.textColor = COLOR_NONESUNDAY;
    [self addSubview:self.masterLabel];
    
    CGFloat xOffset = 5.0f*APP_SCALE_W_5s_WM;
    CGFloat yOffset = 45.0f*APP_SCALE_W_5s_WM;
    
    //一，二，三，四，五，六，日
    UILabel *dayOfTheWeekLabel = [[UILabel alloc]initWithFrame:CGRectMake(xOffset,yOffset, CATDayLabelWidth, CATDayLabelHeight)];
    [dayOfTheWeekLabel setBackgroundColor:[UIColor clearColor]];
    [dayOfTheWeekLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.0f*APP_SCALE_W_5s_WM]];
    self.day1OfTheWeekLabel = dayOfTheWeekLabel;
    self.day1OfTheWeekLabel.textAlignment = NSTextAlignmentCenter;
    self.day1OfTheWeekLabel.textColor = COLOR_SUNDAY;
    [self addSubview:self.day1OfTheWeekLabel];
    
    xOffset += CATDayLabelWidth + 5.0f*APP_SCALE_W_5s_WM;
    dayOfTheWeekLabel = [[UILabel alloc]initWithFrame:CGRectMake(xOffset,yOffset, CATDayLabelWidth, CATDayLabelHeight)];
    [dayOfTheWeekLabel setBackgroundColor:[UIColor clearColor]];
    [dayOfTheWeekLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.0f*APP_SCALE_W_5s_WM]];
    self.day2OfTheWeekLabel = dayOfTheWeekLabel;
    self.day2OfTheWeekLabel.textAlignment=NSTextAlignmentCenter;
    self.day2OfTheWeekLabel.textColor = COLOR_NONESUNDAY;
    [self addSubview:self.day2OfTheWeekLabel];
    
    xOffset += CATDayLabelWidth + 5.0f*APP_SCALE_W_5s_WM;
    dayOfTheWeekLabel = [[UILabel alloc]initWithFrame:CGRectMake(xOffset,yOffset, CATDayLabelWidth, CATDayLabelHeight)];
    [dayOfTheWeekLabel setBackgroundColor:[UIColor clearColor]];
    [dayOfTheWeekLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.0f*APP_SCALE_W_5s_WM]];
    self.day3OfTheWeekLabel = dayOfTheWeekLabel;
    self.day3OfTheWeekLabel.textAlignment=NSTextAlignmentCenter;
    self.day3OfTheWeekLabel.textColor = COLOR_NONESUNDAY;
    [self addSubview:self.day3OfTheWeekLabel];
    
    xOffset += CATDayLabelWidth + 5.0f*APP_SCALE_W_5s_WM;
    dayOfTheWeekLabel = [[UILabel alloc]initWithFrame:CGRectMake(xOffset,yOffset, CATDayLabelWidth, CATDayLabelHeight)];
    [dayOfTheWeekLabel setBackgroundColor:[UIColor clearColor]];
    [dayOfTheWeekLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.0f*APP_SCALE_W_5s_WM]];
    self.day4OfTheWeekLabel = dayOfTheWeekLabel;
    self.day4OfTheWeekLabel.textAlignment=NSTextAlignmentCenter;
    self.day4OfTheWeekLabel.textColor = COLOR_NONESUNDAY;
    [self addSubview:self.day4OfTheWeekLabel];
    
    xOffset += CATDayLabelWidth + 5.0f*APP_SCALE_W_5s_WM;
    dayOfTheWeekLabel = [[UILabel alloc]initWithFrame:CGRectMake(xOffset,yOffset, CATDayLabelWidth, CATDayLabelHeight)];
    [dayOfTheWeekLabel setBackgroundColor:[UIColor clearColor]];
    [dayOfTheWeekLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.0f*APP_SCALE_W_5s_WM]];
    self.day5OfTheWeekLabel = dayOfTheWeekLabel;
    self.day5OfTheWeekLabel.textAlignment=NSTextAlignmentCenter;
    self.day5OfTheWeekLabel.textColor = COLOR_NONESUNDAY;
    [self addSubview:self.day5OfTheWeekLabel];
    
    xOffset += CATDayLabelWidth + 5.0f*APP_SCALE_W_5s_WM;
    dayOfTheWeekLabel = [[UILabel alloc]initWithFrame:CGRectMake(xOffset,yOffset, CATDayLabelWidth, CATDayLabelHeight)];
    [dayOfTheWeekLabel setBackgroundColor:[UIColor clearColor]];
    [dayOfTheWeekLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.0f*APP_SCALE_W_5s_WM]];
    self.day6OfTheWeekLabel = dayOfTheWeekLabel;
    self.day6OfTheWeekLabel.textAlignment=NSTextAlignmentCenter;
    self.day6OfTheWeekLabel.textColor = COLOR_NONESUNDAY;
    [self addSubview:self.day6OfTheWeekLabel];
    
    xOffset += CATDayLabelWidth + 5.0f*APP_SCALE_W_5s_WM;
    dayOfTheWeekLabel = [[UILabel alloc]initWithFrame:CGRectMake(xOffset,yOffset, CATDayLabelWidth, CATDayLabelHeight)];
    [dayOfTheWeekLabel setBackgroundColor:[UIColor clearColor]];
    [dayOfTheWeekLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.0f*APP_SCALE_W_5s_WM]];
    self.day7OfTheWeekLabel = dayOfTheWeekLabel;
    self.day7OfTheWeekLabel.textAlignment=NSTextAlignmentCenter;
    self.day7OfTheWeekLabel.textColor = COLOR_SUNDAY;
    [self addSubview:self.day7OfTheWeekLabel];
    
    [self updateWithDayNames:@[@"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六"]];
    
}


//设置 @"日", @"一", @"二", @"三", @"四", @"五", @"六"
- (void)updateWithDayNames:(NSArray *)dayNames
{
    for (int i = 0 ; i < dayNames.count; i++) {
        switch (i) {
            case 0:
                self.day1OfTheWeekLabel.text = dayNames[i];
                break;
                
            case 1:
                self.day2OfTheWeekLabel.text = dayNames[i];
                break;
                
            case 2:
                self.day3OfTheWeekLabel.text = dayNames[i];
                break;
                
            case 3:
                self.day4OfTheWeekLabel.text = dayNames[i];
                break;
                
            case 4:
                self.day5OfTheWeekLabel.text = dayNames[i];
                break;
                
            case 5:
                self.day6OfTheWeekLabel.text = dayNames[i];
                break;
                
            case 6:
                self.day7OfTheWeekLabel.text = dayNames[i];
                break;
                
            default:
                break;
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
