//
//  LJExcelConfigure.h
//  LJExcelViewDemo
//
//  Created by long on 2017/11/3.
//  Copyright © 2017年 long. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

static NSString * const kObserver_topCollectionViewScroll           = @"topCollectionViewScroll";
static NSString * const kObserver_contentRightCollectionViewScroll  = @"contentRightCollectionViewScroll";

/**
 表格视图的样式

 - LJExcelViewStyleDefault: excel表格
 - LJExcelViewStyleStock: 股票显示表格（仿同花顺）
 */
typedef NS_ENUM(NSInteger, LJExcelViewStyle) {
    LJExcelViewStyleDefault = 0,
    LJExcelViewStyleStock = 1,
};

@interface LJExcelConfigure : NSObject

/**************************** DataSource ****************************/
/**
 头部的标题数组
 */
@property (nonatomic, strong) NSArray *topTitleArr;
/**
 内容左边数据
 */
@property (nonatomic, strong) NSArray *contentLeftArr;
/**
 内容的右边数据源，数组（整个tableview）里面又是一个数组（整个）
 */
@property (nonatomic, strong) NSArray *contentRightArr;


/************************* Layout Attribute *************************/
/**
 头部的宽度，同内容的右边cell的宽度，默认是100
 */
@property (nonatomic, assign) CGFloat topWidth;
/**
 头部的高度，默认是30
 */
@property (nonatomic, assign) CGFloat topHeight;
/**
 内容cell整体的高度，右边内容的高度也一样，默认是40
 */
@property (nonatomic, assign) CGFloat contentCellHeight;

/**
 左边内容的宽度，默认是120
 */
@property (nonatomic, assign) CGFloat contentLeftWidth;


/************************* Style Attribute *************************/
/**
 表格视图的样式，该属性会改变头部和底部视图的lineView
 */
@property (nonatomic, assign) LJExcelViewStyle style;
/**
 水平方向滚动视图的bounces（头部+底部内容）
 */
@property (nonatomic, assign) BOOL hBounces;
/**
 垂直方向滚动视图的bounces（底部tableView）
 */
@property (nonatomic, assign) BOOL vBounces;

/**
 头部左边Logo视图
 */
@property (nonatomic, strong) UIView *logoView;
@property (nonatomic, assign) BOOL showLeftLineView;
@property (nonatomic, assign) BOOL showRightLineView;
@property (nonatomic, assign) BOOL showTopLineView;
@property (nonatomic, assign) BOOL showBtmLineView;

/**
 头部的文字颜色、字体、背景色、alignment、换行等
 */
@property (nonatomic, strong) UIColor         *topTextColor;
@property (nonatomic, strong) UIFont          *topTextFont;
@property (nonatomic, strong) UIColor         *topTextBGColor;
@property (nonatomic, assign) NSTextAlignment topTextAlignment;
@property (nonatomic, assign) NSInteger       topTextNumberOfLines;
@property (nonatomic, strong) UIView    *topCellView;
@property (nonatomic, assign) BOOL            hideTopTextVLineView;
@property (nonatomic, assign) CGFloat         topTextVLineViewHeight;
@property (nonatomic, assign) BOOL            hideTopTextTopLineView;
@property (nonatomic, assign) BOOL            hideTopTextBtmLineView;

/**
 内容左边标题的文字颜色、字体、背景色、alignment、换行等
 */
@property (nonatomic, strong) UIColor         *contentLeftColor;
@property (nonatomic, strong) UIFont          *contentLeftFont;
@property (nonatomic, strong) UIColor         *contentLeftBGColor;
@property (nonatomic, assign) NSTextAlignment contentLeftAlignment;
@property (nonatomic, assign) NSInteger       contentLeftNumberOfLines;
@property (nonatomic, assign) BOOL            hideContentLeftVLineView;
@property (nonatomic, assign) BOOL            hideContentLeftHLineView;

/**
 内容右边的文字颜色、字体、背景色、alignment、换行等
 */
@property (nonatomic, strong) UIColor         *contentRightColor;
@property (nonatomic, strong) UIFont          *contentRightFont;
@property (nonatomic, strong) UIColor         *contentRightBGColor;
@property (nonatomic, assign) NSTextAlignment contentRightAlignment;
@property (nonatomic, assign) NSInteger       contentRightNumberOfLines;
@property (nonatomic, assign) BOOL            hideContentRightVLineView;
@property (nonatomic, assign) BOOL            hideContentRightHLineView;

@end


