//
//  DDHomeThemeView.m
//  TTXMCollectionViewDemo
//
//  Created by taitanxiami on 16/1/25.
//  Copyright © 2016年 taitanxiami. All rights reserved.
//

#import "DDHomeThemeView.h"
#import <Masonry.h>
#import "DDThemeCell.h"
#import "CustomCollectionViewLayout.h"

static NSString *const ThemeCellIdentify = @"themeCell";
#define ScreenWidth     [UIScreen mainScreen].bounds.size.width
#define ScreenHeight     [UIScreen mainScreen].bounds.size.heigh
#define RandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

@interface DDHomeThemeView ()
<UICollectionViewDelegate, UICollectionViewDataSource,CustomCollectionViewLayoutDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *themeData;

@property (strong, nonatomic) NSMutableArray *itemHeights;

@end
@implementation DDHomeThemeView
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
    _itemHeights = [[NSMutableArray alloc] init];
    
        CGFloat itemHeight = ScreenWidth / 2;
    [_itemHeights addObject:@(itemHeight)];
    itemHeight = ScreenWidth / 4;
    [_itemHeights addObject:@(itemHeight)];
    itemHeight = ScreenWidth / 4;
    [_itemHeights addObject:@(itemHeight)];
    itemHeight = ScreenWidth / 4;
    [_itemHeights addObject:@(itemHeight)];
}
- (void) configCellWithThemeData:(NSArray *)arr {
    
    self.themeData = arr;    
    [self.collectionView reloadData];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        CustomCollectionViewLayout *layout = [[CustomCollectionViewLayout alloc] init];
        layout.layoutDelegate = self;

        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.translatesAutoresizingMaskIntoConstraints = NO;
        [_collectionView registerNib:[UINib nibWithNibName:@"DDThemeCell" bundle:nil] forCellWithReuseIdentifier:ThemeCellIdentify];
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        //        _collectionView.scrollEnabled = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DDThemeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ThemeCellIdentify forIndexPath:indexPath];
    cell.themeTitleLabel.text = self.themeData[indexPath.row];
    
    cell.backgroundColor = RandomColor;
    return cell;
}

#pragma mark - UICollectionViewDelegate

#pragma mark - CustomCollectionViewLayoutDelegate

- (CGSize)collectionView:(UICollectionView *)collectionView collectionViewLayout:(CustomCollectionViewLayout *)collectionViewLayout sizeOfItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat itemheight = [_itemHeights[indexPath.row] floatValue];
    NSLog(@"itemheight = %f",itemheight);
    switch (indexPath.row) {
        case 0:
        {
            return CGSizeMake(SCREEN_WIDTH / 2 , itemheight);
            
        }
            break;
        case 1:
        {
            return CGSizeMake(SCREEN_WIDTH / 2 , itemheight);
            
        }
            break;
        case 2:
        {
            return CGSizeMake(SCREEN_WIDTH / 4 , itemheight);
            
        }
            break;
        case 3:
        {
            return CGSizeMake(SCREEN_WIDTH / 4 , itemheight);
            
        }
            break;
            
        default:
            break;
    }
    
    return CGSizeZero;
}
@end
