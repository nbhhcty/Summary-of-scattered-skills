//
//  UIView+extend.h
//  ScreenRotation
//
//  Created by wsk on 2017/10/24.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (extend)
// 判断View是否显示在屏幕上
- (BOOL)isDisplayedInScreen;

// 是否包含某个指定对象
- (BOOL)isContainSubView:(UIView*)subView;

// 子视图的个数
- (NSInteger)countOfSubView:(UIView*)subView;

// 子视图是否包含某个类对象
- (BOOL)isContainClass:(Class)objClass;

// 当前视图包含的指定类的对象的个数
- (NSInteger)countOfSubClass:(Class)objClass;


/**
 *  返回传入view的所有层级结构
 *
 *  @param view 需要获取层级结构的view
 *
 *  @return 字符串
 */
- (NSString *)digView:(UIView *)view;

@end
