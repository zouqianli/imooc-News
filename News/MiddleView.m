//
//  MiddleView.m
//  NewsAPP
//
//  Created by 邹前立 on 2017/4/29.
//  Copyright © 2017年 邹前立. All rights reserved.
//

#import "MiddleView.h"
#import "commenHeader.h"
#import "NewsTipsLabel.h"
#import "MaskView.h"
#import "MixView.h"
@interface MiddleView() {
    UIScrollView *menuScrollView;
    NSArray *menus; // menus名称
    NewsTipsLabel *tips; // 提示消息位置、数量
    
    UIScrollView *imagesScrollView;
    NSArray *images; // images轮播图片名称
    NSTimer *timer; // 定时器
    NSInteger imageIndex; // 轮播索引
    
    MaskView *mask;
    NSArray *maskTitles; // 蒙版标题文字
    
}
@end
@implementation MiddleView
#pragma mark - menuScrollView
- (void) menuScrollView {
    // menus名称
    menus = @[@"土豆味",@"马铃薯味",@"玉米味",@"番茄味",@"南瓜味",@"生菜味"];
    menuScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, screenW, MENUBUTTONHEIGHT)];
    menuScrollView.backgroundColor = [UIColor grayColor];
    menuScrollView.showsHorizontalScrollIndicator = NO;
    menuScrollView.contentSize = CGSizeMake(MENUBUTTONWIDTH*menus.count, MENUBUTTONHEIGHT);
    menuScrollView.contentOffset = CGPointMake(0, 0);
    [self addSubview:menuScrollView];
    //     menus按钮
    for (int i=0; i<menus.count; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(MENUBUTTONWIDTH*i, 0, MENUBUTTONWIDTH, MENUBUTTONHEIGHT)];
        btn.backgroundColor = [UIColor grayColor];
        NSString *btnTitle = [menus objectAtIndex:i];
        [btn setTitle:btnTitle forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [menuScrollView addSubview:btn]; // not self addSubView
        // 设置消息文字
        if (i==0) {
            [self setCurrentBtn:btn];
            tips = [[NewsTipsLabel alloc] initWithPoint:CGPointMake(btn.frame.size.width-42, 2) message:22];
            [btn addSubview:tips];
        }
        if (i==1) {
            tips = [[NewsTipsLabel alloc] initWithPoint:CGPointMake(btn.frame.size.width-21, 2) message:5];
            [btn addSubview:tips];
        }
        if (i==2) {
            tips = [[NewsTipsLabel alloc] initWithPoint:CGPointMake(btn.frame.size.width-42, 2) message:99];
            [btn addSubview:tips];
        }
        if (i==3) {
            tips = [[NewsTipsLabel alloc] initWithPoint:CGPointMake(btn.frame.size.width-42, 2) message:888];
            [btn addSubview:tips];
        }
    }
}
#pragma mark 设置按钮（背景、边框、文字）
- (void) setCurrentBtn:(UIButton *)btn {
    btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    btn.layer.cornerRadius = 20;
    btn.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    btn.layer.borderWidth = 1;
}
#pragma mark 设置当前按钮边框
- (void) btnAction:(UIButton *)btn {
    NSLog(@"btn:%@",[btn currentTitle]);
    // 清除所有按钮样式
    for (UIButton *btn in menuScrollView.subviews) {
        if ([btn isKindOfClass:[UIButton class]]) {
            btn.layer.borderWidth = 0; // 隐藏边框属性
            btn.backgroundColor = [UIColor grayColor];
        }
    }
    // 设置当前按钮
    //    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    NSString *curTitle = btn.currentTitle;
    NSInteger index = [menus indexOfObject:curTitle];
    if (index < 0 || index > menus.count) {
        return;
    }
    switch (index) {
        case 0:{
            [self setCurrentBtn:btn];
            break;
        }
        case 1:{
            [self setCurrentBtn:btn];
            break;
        }
        case 2:{
            [self setCurrentBtn:btn];
            break;
        }
        case 3:{
            [self setCurrentBtn:btn];
            break;
        }
        case 4:{
            [self setCurrentBtn:btn];
            break;
        }
        case 5:{
            [self setCurrentBtn:btn];
            break;
        }
        default:
            break;
    }
}
#pragma mark - imagesScrollView
- (void) imagesScrollView {
    imagesScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, MENUBUTTONHEIGHT, screenW, IMAGEHEIGHT)];
    imagesScrollView.pagingEnabled = YES;
    imagesScrollView.showsHorizontalScrollIndicator = NO;
    imagesScrollView.contentSize = CGSizeMake(screenW*3, IMAGEHEIGHT);
    imagesScrollView.contentOffset = CGPointMake(0, 0);
    [self addSubview:imagesScrollView];
    
    // 添加图片
    images = @[@"1",@"2",@"3"]; // 图片名
    // 图片mask
    maskTitles = @[@"美食1--没有脚的螃蟹",@"美食2--蔬菜party",@"美食3--长毛的鱼"];
    for (int i=0; i<images.count;i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[images objectAtIndex:i]]];
        imageView.frame = CGRectMake(screenW*i, 0, screenW, IMAGEHEIGHT);
        //        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [imagesScrollView addSubview:imageView];
        // mask
        mask = [[MaskView alloc] initWithFrame:CGRectMake(0, IMAGEHEIGHT-20, screenW, 20)];
        NSString *maskTitle = [maskTitles objectAtIndex:i];
        //        NSLog(@"%@",maskTitle);
        [mask setTitle:maskTitle];
        [imageView addSubview:mask];
        // pagecontroller
        UIPageControl *pageC = [[UIPageControl alloc] initWithFrame:CGRectMake(screenW-100, 0, 100, 20)];
        pageC.numberOfPages = images.count;
        pageC.currentPage = i;
        pageC.pageIndicatorTintColor = [UIColor whiteColor];
        pageC.currentPageIndicatorTintColor = [UIColor redColor];
        [mask addSubview:pageC];
    }
    // 定时器
    timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    
}
#pragma mark 定时器timerAction
- (void) timerAction {
    //    imageIndex = 0;
    imagesScrollView.contentOffset = CGPointMake(screenW*imageIndex, 0);
    imageIndex++;
    if (imageIndex >= images.count) {
        imageIndex = 0;
    }
}

#pragma mark - MixView
- (void) addMixView {
    MixView *mView = [[MixView alloc] initWithFrame:CGRectMake(0, 252, screenW, 60)];
    mView.backgroundColor = [UIColor lightGrayColor];
    [mView setImage:@"1"];
    [mView setContent:@"爱美之心人皆有之，除了美人，美画，美文。在中国，广阔的地域中遍地都是美食。"];
    [mView setUrl:@"http://www.whatever.com"];
    [self addSubview:mView];
    
    MixView *mView2 = [[MixView alloc] initWithFrame:CGRectMake(0, 314, screenW, 60)];
    mView2.backgroundColor = [UIColor lightGrayColor];
    [mView2 setContent:@"随便什么蔬菜都可以混合着做出美味了食物。饿了困了，看看美食，精神一上午。"];
    [mView2 setUrl:@"http://www.whatever.com"];
    [mView2 setImage:@"4"];
    [self addSubview:mView2];
    
    MixView *mView3 = [[MixView alloc] initWithFrame:CGRectMake(0, 376, screenW, 60)];
    mView3.backgroundColor = [UIColor lightGrayColor];
    [mView3 setContent:@"冷饮也是一种不错的体验。夏天来了，来一杯冷饮，透心凉的感觉，太爽了。"];
    [mView3 setUrl:@"http://www.whatever.com"];
    [mView3 setImage:@"5"];
    [self addSubview:mView3];
}

@end
