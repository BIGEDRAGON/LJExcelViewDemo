//
//  LJContentTableViewCell.m
//  LJExcelViewDemo
//
//  Created by long on 2017/11/1.
//  Copyright © 2017年 long. All rights reserved.
//

#import "LJContentTableViewCell.h"
#import "LJContentRightCollectionCell.h"

static NSString *clIdentify = @"collectionViewCellIdentify";

@interface LJContentTableViewCell ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UIView *leftLineView;
@property (nonatomic, strong) UIView *vLineView;
@property (nonatomic, strong) UIView *hLineView;
@end


@implementation LJContentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _leftTextLab = [[UILabel alloc] init];
        [self.contentView addSubview:_leftTextLab];
        
        _leftLineView = [[UIView alloc] init];
        _leftLineView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_leftLineView];
        
        _vLineView = [[UIView alloc] init];
        _vLineView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_vLineView];
        
        _hLineView = [[UIView alloc] init];
        _hLineView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_hLineView];
    }
    return self;
}

- (void)setConfi:(LJExcelConfigure *)confi {
    _confi = confi;
    
    _leftTextLab.frame = CGRectMake(0, 0, confi.contentLeftWidth, confi.contentCellHeight);
    _leftLineView.frame = CGRectMake(0, 0, 0.5, confi.contentCellHeight);
    _leftTextLab.textColor = confi.contentLeftColor;
    _leftTextLab.font = confi.contentLeftFont;
    _leftTextLab.backgroundColor = confi.contentLeftBGColor;
    _leftTextLab.textAlignment = confi.contentLeftAlignment;
    _leftTextLab.numberOfLines = confi.contentLeftNumberOfLines;
    
    _vLineView.frame = CGRectMake(confi.contentLeftWidth-0.5, 0, 0.5, confi.contentCellHeight);
    _vLineView.hidden = confi.hideContentLeftVLineView;
    
    _hLineView.frame = CGRectMake(0, confi.contentCellHeight-0.5, confi.contentLeftWidth, 0.5);
    _hLineView.hidden = confi.hideContentLeftHLineView;
    
    UICollectionViewFlowLayout *collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    collectionViewFlowLayout.minimumInteritemSpacing = 0;
    collectionViewFlowLayout.minimumLineSpacing = 0;
    [collectionViewFlowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    UICollectionView *contentCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(confi.contentLeftWidth, 0, _contentCellWidth-confi.contentLeftWidth, confi.contentCellHeight) collectionViewLayout:collectionViewFlowLayout];
    contentCollectionView.showsHorizontalScrollIndicator = NO;
    contentCollectionView.bounces = confi.hBounces;
    contentCollectionView.backgroundColor = [UIColor whiteColor];
    contentCollectionView.delegate = self;
    contentCollectionView.dataSource = self;
    [self.contentView addSubview:contentCollectionView];
    [contentCollectionView registerClass:[LJContentRightCollectionCell class] forCellWithReuseIdentifier:clIdentify];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _confi.topTitleArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LJContentRightCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:clIdentify forIndexPath:indexPath];
    cell.textLab.text = _dataArr[indexPath.row];
    cell.textLab.textColor = _confi.contentRightColor;
    cell.textLab.font = _confi.contentRightFont;
    cell.textLab.backgroundColor = _confi.contentRightBGColor;
    cell.textLab.textAlignment = _confi.contentRightAlignment;
    cell.textLab.numberOfLines = _confi.contentRightNumberOfLines;
    
    cell.hideVLineView = _confi.hideContentRightVLineView;
    cell.hideHLineView = _confi.hideContentRightHLineView;
    return cell;
}

- (CGSize)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath*)indexPath{
    return CGSizeMake(_confi.topWidth, _confi.contentCellHeight);
}


- (void)scrollViewDidScroll:(UIScrollView*)scrollView
{
    if (_didScroll) {
        _didScroll(scrollView);
    }
}



@end
