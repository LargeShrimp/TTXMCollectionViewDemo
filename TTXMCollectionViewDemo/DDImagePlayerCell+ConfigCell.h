//
//  DDImagePlayerCell+ConfigCell.h
//  TTXMCollectionViewDemo
//
//  Created by taitanxiami on 16/1/25.
//  Copyright © 2016年 taitanxiami. All rights reserved.
//

#import "DDImagePlayerCell.h"
#import "GGBannerView.h"
@interface DDImagePlayerCell (ConfigCell)
<GGBannerViewDelegate>


- (void) configCellWithImages:(NSArray *)images;

@end
