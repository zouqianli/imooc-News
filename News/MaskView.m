//
//  MaskView.m
//  NewsAPP
//
//  Created by 邹前立 on 2017/5/2.
//  Copyright © 2017年 邹前立. All rights reserved.
//

#import "MaskView.h"
#import "commenHeader.h"
@implementation MaskView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor grayColor];
        self.alpha = 0.6;
    }
    return self;
}
- (void) setTitle:(NSString*) title {
//    imageLabel.frame = self.frame;
//    UILabel *imageLabel = [[UILabel alloc] initWithFrame:self.bounds];
    UILabel *imageLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, screenW-100, 20)];
    imageLabel.textColor = [UIColor whiteColor];
    imageLabel.textAlignment = NSTextAlignmentLeft;
    imageLabel.text = title;
    [self addSubview:imageLabel];
}
@end
