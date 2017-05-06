//
//  TopView.m
//  NewsAPP
//
//  Created by 邹前立 on 2017/4/29.
//  Copyright © 2017年 邹前立. All rights reserved.
//

#import "TopView.h"
#import "commenHeader.h"
#import "SearchViewController.h"

@implementation TopView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:138/255.0 green:206/255.0 blue:245/255.0 alpha:1.0];
    }
    return self;
}
#pragma mark - 设置标题
- (void) setTitle:(NSString *) title {
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.backgroundColor = [UIColor clearColor];
    UIFont *font = [UIFont systemFontOfSize:20.0];
    titleLabel.text = title;
    // 根据字体大小取得字符串的宽高,再设置label宽高
    CGSize titleWH = [title sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil]];
    titleLabel.frame = CGRectMake((screenW-titleWH.width)/2, 20, titleWH.width, titleWH.height);
    [self addSubview:titleLabel]; // 是self不是self.view
}


@end
