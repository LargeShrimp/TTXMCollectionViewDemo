//
//  DDHomeThemeCell+ConfigThemeCell.m
//  TTXMCollectionViewDemo
//
//  Created by taitanxiami on 16/1/25.
//  Copyright © 2016年 taitanxiami. All rights reserved.
//

#import "DDHomeThemeCell+ConfigThemeCell.h"

@implementation DDHomeThemeCell (ConfigThemeCell)

- (void)configThemeCellWithData:(NSArray *)titles {
    
    [self.themeView configCellWithThemeData:titles];
}

@end
