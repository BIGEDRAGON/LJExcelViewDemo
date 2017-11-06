//
//  LJTopCollectionCell.m
//  LJExcelViewDemo
//
//  Created by long on 2017/11/1.
//  Copyright © 2017年 long. All rights reserved.
//

#import "LJTopCollectionCell.h"

@interface LJTopCollectionCell ()
@property (nonatomic, strong) UIView *vLineView;
@property (nonatomic, strong) UIView *hTopLineView;
@property (nonatomic, strong) UIView *hBtmLineView;
@end

@implementation LJTopCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height)];
        [self.contentView addSubview:_titleLabel];
        
        _customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height)];
        _customView.hidden = YES;
        [self.contentView addSubview:_customView];
        
        _vLineView = [[UIView alloc] initWithFrame:CGRectMake(_titleLabel.frame.size.width-0.5, 0, 0.5, self.contentView.frame.size.height)];
        _vLineView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_vLineView];
        
        _hTopLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, 0.5)];
        _hTopLineView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_hTopLineView];
        
        _hBtmLineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.contentView.frame.size.height-0.5, self.contentView.frame.size.width, 0.5)];
        _hBtmLineView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_hBtmLineView];
        
    }
    return self;
}

- (void)setHideVLineView:(BOOL)hideVLineView {
    _hideVLineView = hideVLineView;
    _vLineView.hidden = hideVLineView;
}
- (void)setHideTopLineView:(BOOL)hideTopLineView {
    _hideTopLineView = hideTopLineView;
    _hTopLineView.hidden = hideTopLineView;
}
- (void)setHideBtmLineView:(BOOL)hideBtmLineView {
    _hideBtmLineView = hideBtmLineView;
    _hBtmLineView.hidden = hideBtmLineView;
}
- (void)setVLineViewHeight:(CGFloat)vLineViewHeight {
    _vLineViewHeight = vLineViewHeight;
    if (vLineViewHeight != 0) {
        _vLineView.frame = CGRectMake(_titleLabel.frame.size.width-0.5, (self.contentView.frame.size.height-vLineViewHeight)/2, 0.5, vLineViewHeight);
    }
}

@end
