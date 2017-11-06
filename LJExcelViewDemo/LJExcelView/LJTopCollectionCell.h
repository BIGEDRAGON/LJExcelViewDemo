//
//  LJTopCollectionCell.h
//  LJExcelViewDemo
//
//  Created by long on 2017/11/1.
//  Copyright © 2017年 long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJTopCollectionCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *customView;

@property (nonatomic, assign) BOOL hideVLineView;
@property (nonatomic, assign) CGFloat vLineViewHeight;
@property (nonatomic, assign) BOOL hideTopLineView;
@property (nonatomic, assign) BOOL hideBtmLineView;

@end
