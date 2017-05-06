//
//  NewsTipsLabel.m
//  NewsAPP
//
//  Created by 邹前立 on 2017/4/30.
//  Copyright © 2017年 邹前立. All rights reserved.
//
/**
 *  自定义uilabel 提示消息数量、位置
 */
#import "NewsTipsLabel.h"
#import "commenHeader.h"

@implementation NewsTipsLabel
- (instancetype)initWithPoint:(CGPoint)point message:(int)msg {
//    UIFont *font = [UIFont systemFontOfSize:20.0];
//    CGSize msgWH = [msg sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName, nil]];
    CGRect rect;
    NSString *message = nil;
    if (msg < 10 && msg > -1) {
        rect = CGRectMake(point.x, point.y, 20, 20);
        message = [NSString stringWithFormat:@"%d",msg];
    }else if (msg < 100) {
        rect = CGRectMake(point.x, point.y, 40, 20);
        message = [NSString stringWithFormat:@"%d",msg];
    }else {
        rect = CGRectMake(point.x, point.y, 40, 20);
        message = [NSString stringWithFormat:@"%@",@"99+"];
    }
    
    if (self = [super initWithFrame:rect]) {
//        self.font = [UIFont systemFontOfSize:20];
        self.textAlignment = NSTextAlignmentCenter;
        self.textColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor redColor];
        self.text = message;
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
//        self.alpha = 0.5;
//        self.layer.opacity = 0.2;
    }
    return self;
}
@end
