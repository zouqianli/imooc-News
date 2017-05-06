//
//  ViewController.m
//  NewsAPP
//
//  Created by 邹前立 on 2017/4/29.
//  Copyright © 2017年 邹前立. All rights reserved.
//

#import "ViewController.h"
#import "commenHeader.h"
#import "TopView.h"
#import "MiddleView.h"
//#import "SearchViewController.h"

@interface ViewController () {
    TopView *topView;
    MiddleView *middleView;
    UIView *searchView;
    UISearchBar *searchBar;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTopView];
    
    [self addMiddleView];
    
    [self addMixImageText];
    
    [self nightShift];
   
}
#pragma mark - 设置搜索按钮
- (void) setSearchButton:(NSString *) imageName {
    UIButton *searchBtn = [[UIButton alloc] init];
    searchBtn.frame = CGRectMake(screenW-60, 20, 25, 25);
    [searchBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(showSearchView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:searchBtn];
}
#pragma mark 显示搜索视图
- (void) showSearchView {
    searchView = [[UIView alloc] initWithFrame:CGRectMake(0, 60, screenW, screenH-60)];
    searchView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:searchView];
    [self addSearchBar];
}
#pragma mark 添加搜索条
- (void) addSearchBar {
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 5, screenW, 40)];
    searchBar.searchBarStyle = UISearchBarIconSearch;
    [searchView addSubview:searchBar];
}

#pragma mark - 添加顶部视图
- (void) addTopView {
    topView = [[TopView alloc] initWithFrame:CGRectMake(0, 0, screenW, 60)];
    [topView setTitle:@"慕课网餐厅"];
    [self.view addSubview:topView];
    [self setSearchButton:@"search"];
}
#pragma mark - 添加中部视图
- (void) addMiddleView {
    middleView = [[MiddleView alloc] initWithFrame:CGRectMake(0, 60, screenW, screenH)];
    middleView.backgroundColor = [UIColor whiteColor];
    [middleView menuScrollView];
    [middleView imagesScrollView];
    [middleView addMixView];
    [self.view addSubview:middleView];
}
#pragma mark - 添加图文视图 
// 单独类文件实现功能
- (void) addMixImageText {
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 300, screenW,screenH-400)];
//    view.backgroundColor = [UIColor lightGrayColor];
//    [self.view addSubview:view];
    
}
#pragma mark - 点击空白返回
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [searchBar resignFirstResponder]; // 关闭键盘
    [searchView removeFromSuperview]; // 移除视图
//    UITouch *touch = [touches anyObject];
//    CGPoint curPoint = [touch locationInView:middleView];
//    NSLog(@"%d",(int)curPoint.x);
}

#pragma mark - 夜间模式
- (void) nightShift {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 520, 80, 30)];
    label.text = @"夜间模式";
    [self.view addSubview:label];
    UISwitch *switchShift = [[UISwitch alloc] initWithFrame:CGRectMake(100, 520, 0, 0)];
    [self.view addSubview:switchShift];
    [switchShift addTarget:self action:@selector(switchChange:) forControlEvents:UIControlEventValueChanged];
}
- (void) switchChange:(UISwitch *) s {
    if (s.isOn) {
        topView.backgroundColor = [UIColor lightGrayColor];
        middleView.backgroundColor = [UIColor grayColor];
    }
    if (!s.isOn) {
        topView.backgroundColor = [UIColor colorWithRed:138/255.0 green:206/255.0 blue:245/255.0 alpha:1.0];
        middleView.backgroundColor = [UIColor whiteColor];

    }
}

@end
