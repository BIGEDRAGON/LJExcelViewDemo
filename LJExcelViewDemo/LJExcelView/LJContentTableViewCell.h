//
//  LJContentTableViewCell.h
//  LJExcelViewDemo
//
//  Created by long on 2017/11/1.
//  Copyright © 2017年 long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJExcelConfigure.h"

typedef void(^DidScrollBlock)(UIScrollView *scrollView);

@interface LJContentTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *leftTextLab;

@property (nonatomic, assign) CGFloat contentCellWidth;
@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, strong) LJExcelConfigure *confi;

@property (nonatomic, copy) DidScrollBlock didScroll;

@end
