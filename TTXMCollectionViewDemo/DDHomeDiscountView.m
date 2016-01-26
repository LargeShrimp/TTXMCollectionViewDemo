//
//  DDHomeDiscountView.m
//  TTXMCollectionViewDemo
//
//  Created by taitanxiami on 16/1/26.
//  Copyright © 2016年 taitanxiami. All rights reserved.
//

#import "DDHomeDiscountView.h"
#import <Masonry.h>
#import "DDHomeDiscountCell.h"

static NSString *const DiscountCellIdenitify = @"discountCell";
#define ScreenWidth     [UIScreen mainScreen].bounds.size.width
#define ScreenHeight     [UIScreen mainScreen].bounds.size.heigh
#define RandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]


@interface DDHomeDiscountView ()
<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *images;

@end


@implementation DDHomeDiscountView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}
/**
 *  data init
 */
- (void)setup {
    
    [self addSubview:self.collectionView];
    __weak typeof(self)weakself = self;
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(weakself)weakselfs = weakself;
        make.edges.equalTo(weakselfs);
    }];
    
}
- (void)configDicountData:(NSArray *)arr {
    self.images = arr;
    
    [self.collectionView reloadData];
}

- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake((ScreenWidth - 30) /  2, (ScreenWidth - 30) /  2);
        layout.minimumInteritemSpacing = 10;
        layout.minimumLineSpacing      = 10;
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
//        layout.scrollDirection  = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate   = self;
        _collectionView.translatesAutoresizingMaskIntoConstraints = NO;
        [_collectionView registerNib:[UINib nibWithNibName:@"DDHomeDiscountCell" bundle:nil] forCellWithReuseIdentifier:DiscountCellIdenitify];
//        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.scrollEnabled = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DDHomeDiscountCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DiscountCellIdenitify forIndexPath:indexPath];
    cell.backgroundColor = RandomColor;
//    cell.titleLable.text = self.images[indexPath.row];
    cell.titleLable.text = [NSString stringWithFormat:@"idex = %ld",indexPath.row];
    return cell;
}


@end
