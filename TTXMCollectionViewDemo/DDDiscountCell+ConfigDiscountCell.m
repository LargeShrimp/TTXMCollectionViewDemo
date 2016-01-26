//
//  DDDiscountCell+ConfigDiscountCell.m
//  TTXMCollectionViewDemo
//
//  Created by taitanxiami on 16/1/26.
//  Copyright © 2016年 taitanxiami. All rights reserved.
//

#import "DDDiscountCell+ConfigDiscountCell.h"
#import "DDHomeDiscountView.h"
@implementation DDDiscountCell (ConfigDiscountCell)

- (void)configDiscountCell:(NSArray *)arr {
    
    [self.discountView configDicountData:arr];
}

@end
