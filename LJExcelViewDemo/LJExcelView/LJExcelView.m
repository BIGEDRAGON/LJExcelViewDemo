//
//  LJExcelView.m
//  LJExcelViewDemo
//
//  Created by long on 2017/11/1.
//  Copyright © 2017年 long. All rights reserved.
//

#import "LJExcelView.h"
#import "LJExcelConfigure.h"
#import "LJTopCollectionView.h"
#import "LJContentTableView.h"
#import "LJContentTableViewCell.h"

@interface LJExcelView ()

@property (nonatomic, strong) LJContentTableView *contentTableView;
@property (nonatomic, strong) LJTopCollectionView *topCollectionView;

@end

@implementation LJExcelView

+ (instancetype)excelViewWithConfi:(LJExcelConfigure *)confi
                             frame:(CGRect)frame {
    LJExcelView *excelView = [[LJExcelView alloc] initWithFrame:frame];
    excelView.confi = confi;
    return excelView;
}

- (void)setConfi:(LJExcelConfigure *)confi {
    _confi = confi;
    
    switch (confi.style) {
        case LJExcelViewStyleStock: {
            confi.showBtmLineView = YES;
            confi.hideTopTextVLineView = NO;
            confi.hideTopTextTopLineView = YES;
            confi.hideTopTextBtmLineView = NO;
            confi.hideContentLeftVLineView = YES;
            confi.hideContentRightVLineView = YES;
        }
            break;
        default:
            break;
    }
    
    // 顶部左边的logoView
    UIView *logoView = [self creatLogoViewWithConfi:confi];
    [self addSubview:logoView];
    
    // 顶部横向序号CollectionView
    UICollectionViewFlowLayout *collectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    [collectionViewFlowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    _topCollectionView = [[LJTopCollectionView alloc] initWithFrame:CGRectMake(logoView.frame.size.width, 0, self.frame.size.width-logoView.frame.size.width, confi.topHeight) collectionViewLayout:collectionViewFlowLayout];
    _topCollectionView.confi = confi;
    [self addSubview:_topCollectionView];
    
    // 添加Observer
    [_topCollectionView addObserver:self forKeyPath:kObserver_topCollectionViewScroll options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
    // 底部内容TableView
    _contentTableView = [[LJContentTableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(logoView.frame), self.frame.size.width, self.frame.size.height-logoView.frame.size.height) style:UITableViewStylePlain];
    _contentTableView.confi = confi;
    [self addSubview:_contentTableView];
    
    // 添加Observer
    [_contentTableView addObserver:self forKeyPath:kObserver_contentRightCollectionViewScroll options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

- (UIView *)creatLogoViewWithConfi:(LJExcelConfigure *)confi {
    
    UIView *logoView = [[UIView alloc] init];;
    if (confi.logoView) {
        logoView = confi.logoView;
    }
    logoView.frame = CGRectMake(0, 0, confi.contentLeftWidth, confi.topHeight);
    
    void (^LineView)(CGRect rect) = ^(CGRect rect) {
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor lightGrayColor];
        lineView.frame = rect;
        [logoView addSubview:lineView];
    };
    
    if (confi.showLeftLineView) {
        LineView(CGRectMake(0, 0, 0.5, confi.topHeight));
    }
    if (confi.showRightLineView) {
        LineView(CGRectMake(0, confi.contentLeftWidth-0.5, 0.5, confi.topHeight));
    }
    if (confi.showTopLineView) {
        LineView(CGRectMake(0, 0, confi.contentLeftWidth, 0.5));
    }
    if (confi.showBtmLineView) {
        LineView(CGRectMake(0, confi.topHeight-0.5, confi.contentLeftWidth, 0.5));
    }
    
    return logoView;
}


// 不做容错处理crash
- (id)valueForUndefinedKey:(NSString *)key {
    return kObserver_topCollectionViewScroll;
}

- (void)observeValueForKeyPath:(NSString*)keyPath
                      ofObject:(id)object
                        change:(NSDictionary*)change
                       context:(void*)context {
    
    if ([keyPath isEqualToString:kObserver_topCollectionViewScroll]) {
        for (LJContentTableViewCell *cell in _contentTableView.visibleCells) {
            for (UIView *view in cell.contentView.subviews) {
                if ([view isKindOfClass:[UICollectionView class]]) {
                    UICollectionView *collectionView = (UICollectionView *)view;
                    collectionView.contentOffset = _topCollectionView.contentOffset;
                }
            }
        }
    }
    
    if ([keyPath isEqualToString:kObserver_contentRightCollectionViewScroll]) {
        for (LJContentTableViewCell *cell in _contentTableView.visibleCells) {
            for (UIView *view in cell.contentView.subviews) {
                if ([view isKindOfClass:[UICollectionView class]]) {
                    UICollectionView *collectionView = (UICollectionView *)view;
                    _topCollectionView.contentOffset = collectionView.contentOffset;
                }
            }
        }
    }
}

// 移除Observer
- (void)dealloc{
    [_topCollectionView removeObserver:self forKeyPath:kObserver_topCollectionViewScroll];
    [_contentTableView removeObserver:self forKeyPath:kObserver_contentRightCollectionViewScroll];
}

@end
