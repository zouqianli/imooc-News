//
//  SearchViewController.m
//  NewsAPP
//
//  Created by 邹前立 on 2017/4/29.
//  Copyright © 2017年 邹前立. All rights reserved.
//

#import "SearchViewController.h"
#import "commenHeader.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBackBtn];
    [self addSearchBar];
    
}

- (void) addSearchBar {
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 70, screenW, 40)];
    searchBar.searchBarStyle = UISearchBarIconSearch;
    [self.view addSubview:searchBar];
}


// 添加按钮
- (void) setBackBtn {
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 50, 50)];
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
}
// 点击按钮返回
- (void) back {
    [self dismissViewControllerAnimated:YES completion:nil];
}
// 点击空白返回
- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//#pragma mark - 添加搜索按钮视图控制器
//- (void) showSearchViewController {
//    SearchViewController *searchViewController = [[SearchViewController alloc] init];
//    searchViewController.view.frame = [UIScreen mainScreen].bounds;
//    searchViewController.view.backgroundColor = [UIColor lightGrayColor];
//    [self presentViewController:searchViewController animated:YES completion:nil];
//}
@end
