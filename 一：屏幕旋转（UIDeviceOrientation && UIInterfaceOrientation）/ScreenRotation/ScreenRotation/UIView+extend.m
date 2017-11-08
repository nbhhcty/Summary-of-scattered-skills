//
//  UIView+extend.m
//  ScreenRotation
//
//  Created by wsk on 2017/10/24.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import "UIView+extend.h"

@implementation UIView (extend)
// 判断View是否显示在屏幕上

- (BOOL)isDisplayedInScreen
{
    if (self == nil || self.hidden || self.superview == nil) {
        return FALSE;
    }
    
    NSLog(@"%@", NSStringFromCGRect(self.superview.frame));
    
    // 转换view对应window的Rect
    CGRect rect = [self.superview convertRect:self.frame fromView:self.superview];
    if ( CGRectIsEmpty(rect) || CGRectIsNull(rect) ) {
        return FALSE;
    }
    
    // 若size为CGrectZero
    if (CGSizeEqualToSize(rect.size, CGSizeZero)) {
        return FALSE;
    }
    
    // 获取 该view与window 交叉的 Rect
    CGRect screenRect = [UIScreen mainScreen].bounds;
    CGRect intersectionRect = CGRectIntersection(rect, screenRect);
    if (CGRectIsEmpty(intersectionRect) || CGRectIsNull(intersectionRect)) {
        return FALSE;
    }
    
    return TRUE;
}

- (BOOL)isContainSubView:(UIView*)subView
{
    __block BOOL result = NO;
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * obj, NSUInteger idx, BOOL * stop) {
        if ( [obj isEqual:subView] ) {
            *stop = YES;
            result = YES;
        }
        else {
            result = [obj isContainSubView:subView];
        }
    }];
    return result;
}

- (NSInteger)countOfSubView:(UIView*)subView
{
    __block NSInteger count = 0;
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * obj, NSUInteger idx, BOOL * stop) {
        if ( [obj isEqual:subView] ) {
            count += 1;
        }
        else {
            count += [obj isContainSubView:subView];
        }
    }];
    return count;
}

- (BOOL)isContainClass:(Class)objClass
{
    __block BOOL result = NO;
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * obj, NSUInteger idx, BOOL * stop) {
        if ( [obj isContainClass:objClass] ) {
            *stop = YES;
            result = YES;
        }
        else {
            result = [obj isContainClass:objClass];
        }
    }];
    return result;
}

- (NSInteger)countOfSubClass:(Class)objClass
{
    __block NSInteger count = 0;
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * obj, NSUInteger idx, BOOL * stop) {
        if ( [obj isContainClass:objClass] ) {
            count += 1;
        }
        else {
            count += [obj isContainClass:objClass];
        }
    }];
    return count;
}

/**
 *  返回传入view的所有层级结构
 *
 *  @param view 需要获取层级结构的view
 *
 *  @return 字符串
 */
- (NSString *)digView:(UIView *)view
{
    if ([view isKindOfClass:[UITableViewCell class]]) return @"";
    // 1.初始化
    NSMutableString *xml = [NSMutableString string];
    
    // 2.标签开头
    [xml appendFormat:@"<%@ frame=\"%@\"", view.class, NSStringFromCGRect(view.frame)];
    if (!CGPointEqualToPoint(view.bounds.origin, CGPointZero)) {
        [xml appendFormat:@" bounds=\"%@\"", NSStringFromCGRect(view.bounds)];
    }
    
    if ([view isKindOfClass:[UIScrollView class]]) {
        UIScrollView *scroll = (UIScrollView *)view;
        if (!UIEdgeInsetsEqualToEdgeInsets(UIEdgeInsetsZero, scroll.contentInset)) {
            [xml appendFormat:@" contentInset=\"%@\"", NSStringFromUIEdgeInsets(scroll.contentInset)];
        }
    }
    
    // 3.判断是否要结束
    if (view.subviews.count == 0) {
        [xml appendString:@" />"];
        return xml;
    } else {
        [xml appendString:@">"];
    }
    
    // 4.遍历所有的子控件
    for (UIView *child in view.subviews) {
        NSString *childXml = [self digView:child];
        [xml appendString:childXml];
    }
    
    // 5.标签结尾
    [xml appendFormat:@"</%@>", view.class];
    
    return xml;
}
@end
