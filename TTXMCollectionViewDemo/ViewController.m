//
//  ViewController.m
//  TTXMCollectionViewDemo
//
//  Created by taitanxiami on 16/1/25.
//  Copyright © 2016年 taitanxiami. All rights reserved.
//

#import "ViewController.h"
#import "DDHomeFirstCell.h"
#import <Masonry.h>

#import "DDImagePlayerCell.h"
#import "DDImagePlayerCell+ConfigCell.h"
#import <UIImageView+WebCache.h>
#import "DDHomeThemeCell.h"
#import "DDHomeThemeCell+ConfigThemeCell.h"
#import "DDDiscountCell.h"
#import "DDHomeBrandCell.h"
#import <MJRefresh.h>
#import "DDDiscountCell+ConfigDiscountCell.h"

#define ScreenWidth     [UIScreen mainScreen].bounds.size.width
#define ScreenHeight     [UIScreen mainScreen].bounds.size.heigh

#define RandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

static NSString *const FIRSTCELLIDENTIFY    = @"firstCell";
static NSString *const ImagePlayerCell      = @"imagePlayerCell";
static NSString *const THEMECELLIDENTIFY    = @"homeThemeCell";
static NSString *const BRANDCELLIDENTIFY    = @"homeBrandCell";
static NSString *const DISCOUNTCELLIDENTIFY = @"homeDisocuntCell";

@interface ViewController ()
<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dicountData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
      [self loadCollectionView];
    
    self.dicountData = [NSMutableArray array];
    [self.dicountData addObject:@"ss.png"];
    [self.dicountData addObject:@"ss.png"];
    
    __weak typeof(self) weakself = self;
    
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        
        [weakself.dicountData addObject:@"ss.png"];
        [weakself.dicountData addObject:@"ss.png"];
        [weakself.dicountData addObject:@"ss.png"];
        [weakself.dicountData addObject:@"ss.png"];

        NSIndexPath *indexpath = [NSIndexPath indexPathForRow:0 inSection:4];
        [weakself.collectionView reloadItemsAtIndexPaths:@[indexpath]];
        
//        [weakself.collectionView reloadData];
        [weakself.collectionView.mj_footer endRefreshing];

//        [weakself.collectionView layoutIfNeeded];
    }];
    
//    footer.refreshingTitleHidden = YES;
    [footer setTitle:@"" forState:MJRefreshStateIdle];
//    [footer setTitle:@"Loading more ..." forState:MJRefreshStateRefreshing];
//    [footer setTitle:@"No more data" forState:MJRefreshStateNoMoreData];

//    footer.stateLabel.hidden = YES;
    self.collectionView.mj_footer = footer;
    
}

- (void)loadCollectionView {
    self.collectionView.dataSource = self;
    self.collectionView.delegate   = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];    
    [self.collectionView registerNib:[UINib nibWithNibName:@"DDHomeFirstCell" bundle:nil] forCellWithReuseIdentifier:FIRSTCELLIDENTIFY];
    [self.collectionView registerNib:[UINib nibWithNibName:@"DDImagePlayerCell" bundle:nil] forCellWithReuseIdentifier:ImagePlayerCell];
    [self.collectionView registerNib:[UINib nibWithNibName:@"DDHomeThemeCell" bundle:nil] forCellWithReuseIdentifier:THEMECELLIDENTIFY];
    [self.collectionView registerNib:[UINib nibWithNibName:@"DDHomeBrandCell" bundle:nil] forCellWithReuseIdentifier:BRANDCELLIDENTIFY];
    [self.collectionView registerNib:[UINib nibWithNibName:@"DDDiscountCell" bundle:nil] forCellWithReuseIdentifier:DISCOUNTCELLIDENTIFY];


}
#pragma mark - lazy load
-(UICollectionView *)collectionView {
    
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
         layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;

        _collectionView.backgroundColor = [UIColor colorWithWhite:0.840 alpha:1.000];
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
       return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ( indexPath.section == 0 ) {
        
        DDHomeFirstCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:FIRSTCELLIDENTIFY forIndexPath:indexPath];
        return cell;
    }else if ( indexPath.section == 1 ) {
        
        DDImagePlayerCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ImagePlayerCell forIndexPath:indexPath];
        
        [cell configCellWithImages:@[@"http://www.intel.cn/content/dam/staging/image/Kim/standards_consumer_320x160.jpg"]];
        return cell;
    }else if (indexPath.section == 2 ) {
        DDHomeThemeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:THEMECELLIDENTIFY forIndexPath:indexPath];
        
        [cell configThemeCellWithData:@[@"百货专区", @"食品专区", @"粮油专区", @"米面专区"]];
        return cell;
    }else if (indexPath.section == 3) {
        
        DDHomeBrandCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:BRANDCELLIDENTIFY forIndexPath:indexPath];
        return cell;
    }else {
        DDDiscountCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DISCOUNTCELLIDENTIFY forIndexPath:indexPath];
        
        [cell configDiscountCell:self.dicountData];
        return cell;
    }
    return nil;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 5;
}


#pragma mark - layout delegate 
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case 0:
        {
            return CGSizeMake(ScreenWidth, ScreenWidth / 4 + 20 );
        }
            break;
        case 1:
        {
            if (indexPath.row == 0) {
                
                return CGSizeMake(ScreenWidth , ScreenWidth / 2);
            }else if (indexPath.row == 1) {
                
                return CGSizeMake(ScreenWidth / 4, ScreenWidth / 4);
            }else {
                return CGSizeMake(ScreenWidth / 4, ScreenWidth / 4);
            }
        }
            
        case 2:
        {
                return CGSizeMake(ScreenWidth , ScreenWidth / 2);
        }
            
        case 3:
        {
            return CGSizeMake(ScreenWidth, (ScreenWidth - 35) / 4 * 0.74 * 3 + 60);
        }
            
        case 4:
        {
            NSInteger count =  ((self.dicountData.count / 2 + self.dicountData.count % 2));
            return CGSizeMake(ScreenWidth,  (count+1) * 10 + count * (ScreenWidth - 30) / 2);
        }

        default:
            break;
    }
    return CGSizeZero;
}

#pragma mark - warning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
