//
//  ViewController.m
//  LJExcelViewDemo
//
//  Created by long on 2017/11/1.
//  Copyright © 2017年 long. All rights reserved.
//

#import "ViewController.h"
#import "LJExcelView.h"

@interface ViewController ()
@property (nonatomic, strong) LJExcelConfigure *model;
@property (nonatomic, strong) LJExcelView *excelView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *topArr = [NSMutableArray array];
    NSMutableArray *leftArr = [NSMutableArray array];
    NSMutableArray *contentArr = [NSMutableArray array];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"mock" ofType:@"plist"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        
        NSArray *root = [[NSArray alloc] initWithContentsOfFile:path];
        if (!root && ![root isKindOfClass:[NSArray class]])
            return;
        
        [root enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (!obj && ![obj isKindOfClass:[NSDictionary class]])
                return;
            
            [leftArr addObject:obj[@"name"]];
            
            if ([obj[@"contentArr"] isKindOfClass:[NSArray class]]) {
                
                NSMutableArray *temp0 = [NSMutableArray array];
                NSMutableArray *temp1 = [NSMutableArray array];
                for (id item in obj[@"contentArr"]) {
                    if ([item isKindOfClass:[NSDictionary class]]) {
                        [temp0 addObject:item[@"name"]];
                        [temp1 addObject:item[@"value"]];
                    }
                }
                [topArr addObject:temp0];
                [contentArr addObject:temp1];
            }
        }];
    }
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"logo";
    label.textAlignment = NSTextAlignmentCenter;
    
    LJExcelConfigure *model = [[LJExcelConfigure alloc] init];
    _model = model;
    
    // SourceData
    model.topTitleArr = topArr[0];
    model.contentLeftArr = leftArr;
    model.contentRightArr = contentArr;
    
    // Layout
//    model.topWidth = 120;
//    model.topHeight = 40;
//    model.contentCellHeight = 60;
//    model.contentLeftWidth = 70;
    
    model.style = LJExcelViewStyleStock;
//    model.hBounces = NO;
//    model.vBounces = NO;
    
    // logo
    model.logoView = label;
//    model.showLeftLineView = YES;
//    model.showTopLineView = YES;
//    model.showRightLineView = YES;
//    model.showBtmLineView = YES;
    
    // top
//    model.topCellView = view;
//    model.topTextColor = [UIColor redColor];
//    model.topTextFont = [UIFont systemFontOfSize:15];
//    model.topTextBGColor = [UIColor cyanColor];
//    model.topTextAlignment = NSTextAlignmentCenter;
//    model.topTextNumberOfLines = 0;
//    model.hideTopTextVLineView = YES;
    model.topTextVLineViewHeight = 20;
//    model.hideTopTextTopLineView = YES;
//    model.hideTopTextBtmLineView = YES;
    
    // content left
//    model.contentLeftColor = [UIColor blueColor];
//    model.contentLeftFont = [UIFont systemFontOfSize:15];
    model.contentLeftBGColor = [UIColor cyanColor];
//    model.contentLeftAlignment = NSTextAlignmentCenter;
//    model.contentLeftNumberOfLines = 0;
    model.hideContentLeftVLineView = YES;
//    model.hideContentLeftHLineView = YES;
    
    // content right
    model.contentRightColor = [UIColor redColor];
    model.contentRightFont = [UIFont systemFontOfSize:15];
//    model.contentRightBGColor = [UIColor cyanColor];
//    model.contentRightAlignment = NSTextAlignmentCenter;
//    model.contentRightNumberOfLines = 0;
    model.hideContentRightVLineView = YES;
//    model.hideContentRightHLineView = YES;
}

- (LJExcelView *)excelView {
    if (!_excelView) {
        _excelView = [[LJExcelView alloc] init];
        [self.view addSubview:_excelView];
    }
    return _excelView;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.excelView.frame = CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height-20);
    self.excelView.confi = _model;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
