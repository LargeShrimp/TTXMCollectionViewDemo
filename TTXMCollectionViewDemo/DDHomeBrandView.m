//
//  DDHomeBrandView.m
//  TTXMCollectionViewDemo
//
//  Created by taitanxiami on 16/1/26.
//  Copyright © 2016年 taitanxiami. All rights reserved.
//

#import "DDHomeBrandView.h"
#import <Masonry.h>
#import "DDBrandCell.h"
#import "DDHomeBrandHeaderView.h"
static NSString *const BrandCellIdentify = @"brandCell";
static NSString *const BRANDHEADERVIEWIDENIFY = @"headerView";

#define ScreenWidth     [UIScreen mainScreen].bounds.size.width
#define ScreenHeight     [UIScreen mainScreen].bounds.size.heigh
@interface DDHomeBrandView ()
<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation DDHomeBrandView
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
- (void)configCellWithTitle:(NSArray *)titles images:(NSArray *)images {
    
    self.images = images;
    [self.collectionView reloadData];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake((ScreenWidth - 35) /  4, (ScreenWidth - 35) / 4 * 0.74);
        layout.minimumInteritemSpacing = 5;
        layout.minimumLineSpacing      = 5;
        layout.sectionInset = UIEdgeInsetsMake(4, 10, 4, 10);
//        layout.scrollDirection  = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.translatesAutoresizingMaskIntoConstraints = NO;
        [_collectionView registerNib:[UINib nibWithNibName:@"DDBrandCell" bundle:nil] forCellWithReuseIdentifier:BrandCellIdentify];
        [_collectionView registerNib:[UINib nibWithNibName:@"DDHomeBrandHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:BRANDHEADERVIEWIDENIFY];
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
            _collectionView.scrollEnabled = NO;
        _collectionView.backgroundColor = [UIColor colorWithWhite:0.811 alpha:1.000];
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
//    return self.images.count;
    
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DDBrandCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:BrandCellIdentify forIndexPath:indexPath];
    return cell;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}
#if 1
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        DDHomeBrandHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:BRANDHEADERVIEWIDENIFY forIndexPath:indexPath];
        
        return headerView;
    }else
    {
        return nil;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGSizeMake(ScreenWidth, 44);
    }else {
        return CGSizeZero;
    }
}

#endif
@end
