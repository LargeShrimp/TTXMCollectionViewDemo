//
//  DDHomeHeaderView.m
//  TTXMCollectionViewDemo
//
//  Created by taitanxiami on 16/1/25.
//  Copyright © 2016年 taitanxiami. All rights reserved.
//

#import "DDHomeHeaderView.h"
#import "DDHomeCategoryCell.h"
#import <Masonry.h>

#define ScreenWidth     [UIScreen mainScreen].bounds.size.width
#define ScreenHeight     [UIScreen mainScreen].bounds.size.heigh

static NSString *const CategoryCellIdentify = @"categoryCell";

@interface DDHomeHeaderView ()
<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *images;

@end
@implementation DDHomeHeaderView


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
    self.titles = titles;
    [self.collectionView reloadData];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(ScreenWidth /  4, ScreenWidth / 4);
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing      = 0;
        layout.scrollDirection  = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.translatesAutoresizingMaskIntoConstraints = NO;
        [_collectionView registerNib:[UINib nibWithNibName:@"DDHomeCategoryCell" bundle:nil] forCellWithReuseIdentifier:CategoryCellIdentify];
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
//        _collectionView.scrollEnabled = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
        DDHomeCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CategoryCellIdentify forIndexPath:indexPath];
        cell.cateNameLabel.text  = self.titles[indexPath.row];
        cell.cateImageView.image = [UIImage imageNamed:self.images[indexPath.row]];
        return cell;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

#pragma mark - layout delegate

@end
