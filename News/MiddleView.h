//
//  MiddleView.h
//  NewsAPP
//
//  Created by 邹前立 on 2017/4/29.
//  Copyright © 2017年 邹前立. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MiddleView : UIView
@property (nonatomic,strong) NSArray *types;
- (void) menuScrollView;
- (void) imagesScrollView;
- (void) addMixView;
@end
