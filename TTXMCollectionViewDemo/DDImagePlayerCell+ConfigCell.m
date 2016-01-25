//
//  DDImagePlayerCell+ConfigCell.m
//  TTXMCollectionViewDemo
//
//  Created by taitanxiami on 16/1/25.
//  Copyright © 2016年 taitanxiami. All rights reserved.
//

#import "DDImagePlayerCell+ConfigCell.h"
#import <UIImageView+WebCache.h>
@implementation DDImagePlayerCell (ConfigCell)
- (void) configCellWithImages:(NSArray *)images {
    
    [self.imagePlayerView configBanner:images];
    self.imagePlayerView.delegate = self;
}


#pragma mark - GannerImageView delegate
- (void)imageView:(UIImageView *)imageView loadImageForUrl:(NSString *)url {
    [imageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil];
    
}
- (void)bannerView:(GGBannerView *)bannerView didSelectAtIndex:(NSUInteger)index {
    
}
@end
