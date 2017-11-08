//
//  BaseCustomTransitionAnimation.m
//  CustomTransitionAnimations
//
//  Created by wsk on 2017/10/26.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import "BaseCustomTransitionAnimation.h"

@interface BaseCustomTransitionAnimation()

@end

@implementation BaseCustomTransitionAnimation

#pragma mark - <UIViewControllerAnimatedTransitioning>
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3f;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
}

@end
