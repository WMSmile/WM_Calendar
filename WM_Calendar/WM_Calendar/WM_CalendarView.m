//
//  WM_CalendarView.m
//  WM_Calendar
//
//  Created by Mac on 16/3/29.
//  Copyright © 2016年 WuMeng. All rights reserved.
//

#import "WM_CalendarView.h"
@interface WM_CalendarView()<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property(nonatomic ,strong) UICollectionView* collectionView;//网格视图
@property(nonatomic ,assign) void(^singleClick)(WM_CalendarDayModel *);//网格视图



@end


static NSString *MonthHeader = @"MonthHeaderView";
static NSString *DayCell = @"DayCell";

@implementation WM_CalendarView

- (instancetype)initWithFrame:(CGRect)frame minDate:(NSDate *)date  selectDate:(NSDate *)selectdate needDays:(int)days_number
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initDataminDate:date selectDate:selectdate needDays:days_number];
        [self initView];
    }
    return self;
}

- (void)initView{
    
    WM_CalendarMonthCollectionViewLayout *layout = [WM_CalendarMonthCollectionViewLayout new];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout]; //初始化网格视图大小
    
    [self.collectionView registerClass:[WM_CalendarDayCollectionViewCell class] forCellWithReuseIdentifier:DayCell];//cell重用设置ID
    
    [self.collectionView registerClass:[WM_CalendarMonthHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:MonthHeader];
    
//    self.collectionView.bounces = NO;//将网格视图的下拉效果关闭
    
    self.collectionView.delegate = self;//实现网格视图的delegate
    
    self.collectionView.dataSource = self;//实现网格视图的dataSource
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.collectionView];
    
}



-(void)initDataminDate:(NSDate *)date  selectDate:(NSDate *)selectdate needDays:(int)days_number
{

    NSCalendar *calendar = [CalendarManger sharedManager].calendar;
    self.calendarMonth = [WM_CalendarDayModel reloadCalendarView:date selectDate:selectdate needDays:days_number byCalendar:calendar];//每个月份的数组
    
}



#pragma mark -- UICollectionViewDataSource

//定义展示的Section的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.calendarMonth.count;
}


//定义展示的UICollectionViewCell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSMutableArray *monthArray = [self.calendarMonth objectAtIndex:section];
    
    return monthArray.count;
}


//每个UICollectionView展示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WM_CalendarDayCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DayCell forIndexPath:indexPath];
    
    NSMutableArray *monthArray = [self.calendarMonth objectAtIndex:indexPath.section];
    
    WM_CalendarDayModel *model = [monthArray objectAtIndex:indexPath.row];
    
    cell.model = model;
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader){
        
        NSMutableArray *month_Array = [self.calendarMonth objectAtIndex:indexPath.section];
        WM_CalendarDayModel *model = [month_Array objectAtIndex:15];
        
        WM_CalendarMonthHeaderView *monthHeader = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:MonthHeader forIndexPath:indexPath];
        monthHeader.masterLabel.text = [NSString stringWithFormat:@"%lu年 %lu月",(unsigned long)model.year,(unsigned long)model.month];//@"日期";
        monthHeader.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8f];
        reusableview = monthHeader;
    }
    return reusableview;
    
}
#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSMutableArray *month_Array = [self.calendarMonth objectAtIndex:indexPath.section];
    WM_CalendarDayModel *model = [month_Array objectAtIndex:indexPath.row];
    
    model.isSelectedDay=!model.isSelectedDay;
    [self.collectionView reloadData];
    
    if (self.singleClick) {
        self.singleClick(model);
    }
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return YES;
}


- (void)sigleClick:(void(^)(WM_CalendarDayModel *model))finish
{
    self.singleClick = finish;
}


@end
