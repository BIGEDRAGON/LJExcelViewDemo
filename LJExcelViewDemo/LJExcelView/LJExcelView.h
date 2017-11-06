//
//  LJExcelView.h
//  LJExcelViewDemo
//
//  Created by long on 2017/11/1.
//  Copyright © 2017年 long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LJExcelConfigure.h"

@interface LJExcelView : UIView

@property (nonatomic, strong) LJExcelConfigure *confi;

+ (instancetype)excelViewWithConfi:(LJExcelConfigure *)confi
                             frame:(CGRect)frame;


@end
