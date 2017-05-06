//
//  MixView.m
//  NewsAPP
//
//  Created by 邹前立 on 2017/5/2.
//  Copyright © 2017年 邹前立. All rights reserved.
//

#import "MixView.h"
@interface MixView() {
    UIImageView *imageView;
    UILabel *intro;
    UILabel *url;
}
@end

@implementation MixView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.height*2, self.frame.size.height)];
        [self addSubview:imageView];
        intro = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.height*2+10, 0, self.frame.size.width-self.frame.size.height*2-10, self.frame.size.height-20)];
        intro.font = [UIFont systemFontOfSize:12];
        intro.numberOfLines = 0;
        [self addSubview:intro];
        url = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.height*2+10, self.frame.size.height-20, self.frame.size.width-self.frame.size.height*2-10-20, 20)];
        url.textColor = [UIColor purpleColor];
        url.textAlignment = NSTextAlignmentRight;
        url.font = [UIFont systemFontOfSize:12];
        [self addSubview:url];
    }
    return self;
}

- (void) setImage:(NSString *) imageName {
    imageView.image = [UIImage imageNamed:imageName];
}

- (void) setContent:(NSString *) content {
    intro.text = content;
}

- (void) setUrl:(NSString *) urlStr {
    url.text = urlStr;
}
@end
