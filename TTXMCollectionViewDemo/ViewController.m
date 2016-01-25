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
#import "DDThemeCell.h"
#import "DDImagePlayerCell.h"
#import "DDImagePlayerCell+ConfigCell.h"
#import <UIImageView+WebCache.h>
#define ScreenWidth     [UIScreen mainScreen].bounds.size.width
#define ScreenHeight     [UIScreen mainScreen].bounds.size.heigh

#define RandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

static NSString *const FIRSTCELLIDENTIFY = @"firstCell";
static NSString *const ThemeCellIdentify = @"themeCell";
static NSString *const ImagePlayerCell = @"imagePlayerCell";
@interface ViewController ()
<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *section1Arr;
@property (nonatomic, strong) NSArray *section1ImageArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
      [self loadCollectionView];
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
    

}
#pragma mark - lazy load
-(UICollectionView *)collectionView {
    
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
         layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    switch (section) {
        case 0:
        {
            return 1;
        }
            break;
        case 1:
        {
            return 1;
        }
            break;
        case 2:
        {
            
        }
            break;
            
        default:
            break;
    }
    
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ( indexPath.section == 0 ) {
        
        DDHomeFirstCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:FIRSTCELLIDENTIFY forIndexPath:indexPath];
        return cell;
    }else if ( indexPath.section == 1 ) {
        
        DDImagePlayerCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ImagePlayerCell forIndexPath:indexPath];
        
        [cell configCellWithImages:@[@"http://www.intel.cn/content/dam/staging/image/Kim/standards_consumer_320x160.jpg"]];
        return cell;
    }
    return nil;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 2;
}


#pragma mark - layout delegate 
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case 0:
        {
            return CGSizeMake(ScreenWidth, ScreenWidth / 4);
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
