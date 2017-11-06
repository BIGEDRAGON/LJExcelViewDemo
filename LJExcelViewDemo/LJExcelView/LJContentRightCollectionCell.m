//
//  LJContentRightCollectionCell.m
//  LJExcelViewDemo
//
//  Created by long on 2017/11/1.
//  Copyright © 2017年 long. All rights reserved.
//

#import "LJContentRightCollectionCell.h"

@interface LJContentRightCollectionCell ()
@property (nonatomic, strong) UIView *vLineView;
@property (nonatomic, strong) UIView *hLineView;
@end

@implementation LJContentRightCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _textLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height)];
        [self.contentView addSubview:_textLab];
        
        _vLineView = [[UIView alloc] initWithFrame:CGRectMake(_textLab.frame.size.width-0.5, 0, 0.5, self.contentView.frame.size.height)];
        _vLineView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_vLineView];
        
        _hLineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.contentView.frame.size.height-0.5, self.contentView.frame.size.width, 0.5)];
        _hLineView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_hLineView];
        
    }
    return self;
}

- (void)setHideVLineView:(BOOL)hideVLineView {
    _hideVLineView = hideVLineView;
    _vLineView.hidden = hideVLineView;
}
- (void)setHideHLineView:(BOOL)hideHLineView {
    _hideHLineView = hideHLineView;
    _hLineView.hidden = hideHLineView;
}

@end
