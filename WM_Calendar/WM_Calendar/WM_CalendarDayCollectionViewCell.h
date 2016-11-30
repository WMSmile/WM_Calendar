//
//  WM_CalendarDayCollectionViewCell.h
//  WM_Calendar
//
//  Created by Mac on 16/3/29.
//  Copyright © 2016年 WuMeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WM_CalendarDayModel.h"
#import "WM_CalendarHeader.h"

@interface WM_CalendarDayCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UILabel *dayTitleLB;//今天的日期或者是节日
@property (nonatomic, strong) UILabel *daySubTitleLB;//显示标签
@property (nonatomic, strong) UIImageView *selectedIV;//选中时的图片

@property (nonatomic, strong) WM_CalendarDayModel *model;

@end
