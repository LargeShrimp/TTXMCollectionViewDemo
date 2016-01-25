//
//  DDHomeFirstCell.m
//  TTXMCollectionViewDemo
//
//  Created by taitanxiami on 16/1/25.
//  Copyright © 2016年 taitanxiami. All rights reserved.
//

#import "DDHomeFirstCell.h"
#import "DDHomeHeaderView.h"
@implementation DDHomeFirstCell

- (void)awakeFromNib {
    
    [self.headerView configCellWithTitle:@[@"爆品推荐", @"限时抢购", @"促销专区", @"签到有礼"] images:@[@"discount-icon", @"Limited-Time-icon", @"Promotions-icon", @"Registration-icon"]];
}

@end
