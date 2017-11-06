//
//  LJContentTableView.m
//  LJExcelViewDemo
//
//  Created by long on 2017/11/1.
//  Copyright © 2017年 long. All rights reserved.
//

#import "LJContentTableView.h"
#import "LJExcelConfigure.h"
#import "LJContentTableViewCell.h"

static NSString *tbIdentify = @"tableViewCellIdentify";

@interface LJContentTableView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIScrollView *contentRightScrollView;
@property (nonatomic, assign) CGPoint currentOffset;

@end


@implementation LJContentTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate=self;
        self.dataSource=self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self registerClass:[LJContentTableViewCell class] forCellReuseIdentifier:tbIdentify];
    }
    return self;
}

- (void)setConfi:(LJExcelConfigure *)confi {
    _confi = confi;
    self.bounces = confi.vBounces;
}


#pragma mark --collectionViewDataSource&&collectionViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _confi.contentLeftArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    LJContentTableViewCell *cell = (LJContentTableViewCell *)[tableView dequeueReusableCellWithIdentifier:tbIdentify];
    cell.contentCellWidth = self.frame.size.width;
    cell.dataArr = _confi.contentRightArr[indexPath.row];
    cell.confi = _confi;
    
    __weak __typeof__(self) weakSelf = self;
    cell.didScroll = ^(UIScrollView *scrollView) {
        [weakSelf scrollViewDidScroll:scrollView];
    };
    
    cell.leftTextLab.text = _confi.contentLeftArr[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _confi.contentCellHeight;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 解决bug：当tableview的collectionView的x有偏移时，新出现的cell会出现collectionView的x偏移问题
    if (_currentOffset.x <= 0) {
        return;
    }
    
    for (UIView *view in cell.subviews[0].subviews) {
        if ([view isKindOfClass:[UICollectionView class]]) {
            UICollectionView *displayCell = (UICollectionView *)view;
            displayCell.contentOffset = _currentOffset;
        }
    }
}


- (void)scrollViewDidScroll:(UIScrollView*)scrollView {
    if ([scrollView isKindOfClass:[UICollectionView class]]) {
    
        if (scrollView.contentOffset.y != 0) {
            scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, 0);
            return;
        }
        for (LJContentTableViewCell *cell in self.visibleCells) {
            for (UIView *view in cell.contentView.subviews) {
                if ([view isKindOfClass:[UICollectionView class]]) {
                    UICollectionView *collectionView = (UICollectionView *)view;
                    collectionView.contentOffset = scrollView.contentOffset;
                    _currentOffset = scrollView.contentOffset;
                }
            }
            
        }
        [self setValue:[NSValue valueWithCGPoint:scrollView.contentOffset] forKey:kObserver_contentRightCollectionViewScroll];
    }
}

// 不做容错处理crash
- (id)valueForUndefinedKey:(NSString *)key {
    return kObserver_contentRightCollectionViewScroll;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end
