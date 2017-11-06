//
//  LJExcelConfigure.m
//  LJExcelViewDemo
//
//  Created by long on 2017/11/3.
//  Copyright © 2017年 long. All rights reserved.
//

#import "LJExcelConfigure.h"

@implementation LJExcelConfigure

- (instancetype)init
{
    self = [super init];
    if (self) {
        _topWidth               = 100;
        _topHeight              = 30;
        _contentCellHeight      = 40;
        _contentLeftWidth       = 120;
        
        _vBounces               = YES;
        _hBounces               = YES;
        
        _topTextColor           = [UIColor blackColor];
        _topTextFont            = [UIFont systemFontOfSize:17];
        _topTextBGColor         = [UIColor whiteColor];
        _topTextAlignment       = NSTextAlignmentCenter;
        _topTextNumberOfLines   = 1;
        
        _contentLeftColor       = [UIColor blackColor];
        _contentLeftFont        = [UIFont systemFontOfSize:17];
        _contentLeftBGColor     = [UIColor whiteColor];
        _contentLeftAlignment   = NSTextAlignmentCenter;
        _contentLeftNumberOfLines = 1;
        
        _contentRightColor      = [UIColor blackColor];
        _contentRightFont       = [UIFont systemFontOfSize:15];
        _contentRightBGColor    = [UIColor whiteColor];
        _contentRightAlignment  = NSTextAlignmentCenter;
        _contentRightNumberOfLines = 1;
    }
    return self;
}

@end
