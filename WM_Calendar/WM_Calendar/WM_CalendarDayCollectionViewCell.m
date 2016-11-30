//
//  WM_CalendarDayCollectionViewCell.m
//  WM_Calendar
//
//  Created by Mac on 16/3/29.
//  Copyright © 2016年 WuMeng. All rights reserved.
//

#import "WM_CalendarDayCollectionViewCell.h"

@implementation WM_CalendarDayCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView{
    
    //选中时显示的图片
    self.selectedIV = [[UIImageView alloc]initWithFrame:CGRectMake(5, 15, self.bounds.size.width-10, self.bounds.size.width-10)];
//    _selectedIV.image = [UIImage imageNamed:@"chack.png"];
    _selectedIV.backgroundColor = COLOR_NONESUNDAY;
    
    [self addSubview:_selectedIV];
    
    //日期
    self.dayTitleLB = [[UILabel alloc]initWithFrame:CGRectMake(0, 15, self.bounds.size.width, self.bounds.size.width-10)];
    _dayTitleLB.textAlignment = NSTextAlignmentCenter;
    _dayTitleLB.font = [UIFont systemFontOfSize:14*APP_SCALE_W_5s_WM];
    [self addSubview:_dayTitleLB];
    
    //农历
    self.daySubTitleLB = [[UILabel alloc]initWithFrame:CGRectMake(0, self.bounds.size.height-15, self.bounds.size.width, 13)];
    _daySubTitleLB.textColor = [UIColor lightGrayColor];
    _daySubTitleLB.font = [UIFont boldSystemFontOfSize:10*APP_SCALE_W_5s_WM];
    _daySubTitleLB.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_daySubTitleLB];
    
    
}


- (void)setModel:(WM_CalendarDayModel *)model
{
    
    
    switch (model.style) {
        case WM_CellDayTypeEmpty://不显示
            [self hidden_YES];
            break;
            
        case WM_CellDayTypePast://过去的日期
            [self hidden_NO];
            
            if (model.holiday) {
                _dayTitleLB.text = model.holiday;
            }else{
                _dayTitleLB.text = [NSString stringWithFormat:@"%lu",(unsigned long)model.day];
            }
            
            _dayTitleLB.textColor = [UIColor lightGrayColor];
            _daySubTitleLB.text = model.Chinese_calendar;
            _selectedIV.hidden = YES;
            break;
            
        case WM_CellDayTypeFutur://将来的日期
            [self hidden_NO];
            
            if (model.holiday) {
                _dayTitleLB.text = model.holiday;
                _dayTitleLB.textColor = [UIColor orangeColor];
            }else{
                _dayTitleLB.text = [NSString stringWithFormat:@"%lu",(unsigned long)model.day];
                _dayTitleLB.textColor = COLOR_NONESUNDAY;
            }
            
            _daySubTitleLB.text = model.Chinese_calendar;
            _selectedIV.hidden = YES;
            break;
            
        case WM_CellDayTypeWeek://周末
            [self hidden_NO];
            
            if (model.holiday) {
                _dayTitleLB.text = model.holiday;
                _dayTitleLB.textColor = [UIColor orangeColor];
            }else{
                _dayTitleLB.text = [NSString stringWithFormat:@"%lu",(unsigned long)model.day];
                _dayTitleLB.textColor = COLOR_SUNDAY;
            }
            
            _daySubTitleLB.text = model.Chinese_calendar;
            _selectedIV.hidden = YES;
            break;
            
//        case WM_CellDayTypeClick://被点击的日期
//            [self hidden_NO];
//            _dayTitleLB.text = [NSString stringWithFormat:@"%lu",(unsigned long)model.day];
//            _dayTitleLB.textColor = [UIColor whiteColor];
//            _daySubTitleLB.text = model.Chinese_calendar;
//            _selectedIV.hidden = NO;
//            
//            break;
            
        default:
            
            break;
    }
    if (model.isSelectedDay) {
        [self hidden_NO];
        _dayTitleLB.text = [NSString stringWithFormat:@"%lu",(unsigned long)model.day];
        _dayTitleLB.textColor = [UIColor whiteColor];
        _daySubTitleLB.text = model.Chinese_calendar;
        _selectedIV.hidden = NO;
    }
  
    
}



- (void)hidden_YES{
    
    _dayTitleLB.hidden = YES;
    _daySubTitleLB.hidden = YES;
    _selectedIV.hidden = YES;
    
}


- (void)hidden_NO{
    
    _dayTitleLB.hidden = NO;
    _daySubTitleLB.hidden = NO;
    
}
@end
