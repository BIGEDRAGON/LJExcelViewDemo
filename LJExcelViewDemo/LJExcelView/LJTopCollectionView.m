//
//  LJTopCollectionView.m
//  LJExcelViewDemo
//
//  Created by long on 2017/11/1.
//  Copyright © 2017年 long. All rights reserved.
//

#import "LJTopCollectionView.h"
#import "LJTopCollectionCell.h"
#import "LJExcelConfigure.h"

static NSString *topClIdentify = @"topCollectionViewCellIdentify";

@interface LJTopCollectionView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end


@implementation LJTopCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.delegate = self;
        self.dataSource = self;
        self.showsHorizontalScrollIndicator = NO;
        [self registerClass:[LJTopCollectionCell class] forCellWithReuseIdentifier:topClIdentify];
    }
    return self;
}

- (void)setConfi:(LJExcelConfigure *)confi {
    _confi = confi;
    self.bounces = confi.hBounces;
}


#pragma mark --collectionViewDataSource&&collectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _confi.topTitleArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LJTopCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:topClIdentify forIndexPath:indexPath];
    
    cell.titleLabel.text = _confi.topTitleArr[indexPath.row];
    cell.titleLabel.textColor = _confi.topTextColor;
    cell.titleLabel.font = _confi.topTextFont;
    cell.titleLabel.backgroundColor = _confi.topTextBGColor;
    cell.titleLabel.textAlignment = _confi.topTextAlignment;
    cell.titleLabel.numberOfLines = _confi.topTextNumberOfLines;
    
    cell.vLineViewHeight = _confi.topTextVLineViewHeight;
    cell.hideVLineView = _confi.hideTopTextVLineView;
    cell.hideTopLineView = _confi.hideTopTextTopLineView;
    cell.hideBtmLineView = _confi.hideTopTextBtmLineView;
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath*)indexPath{
    
    return CGSizeMake(_confi.topWidth, _confi.topHeight);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self setValue:[NSValue valueWithCGPoint:scrollView.contentOffset] forKey:kObserver_topCollectionViewScroll];
}

- (id)valueForUndefinedKey:(NSString *)key{
    return kObserver_topCollectionViewScroll;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
