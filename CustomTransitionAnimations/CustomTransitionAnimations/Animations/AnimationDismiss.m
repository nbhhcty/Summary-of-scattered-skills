//
//  AnimationDismiss.m
//  CustomTransitionAnimations
//
//  Created by wsk on 2017/10/26.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import "AnimationDismiss.h"

@implementation AnimationDismiss

#pragma mark - <UIViewControllerAnimatedTransitioning>
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3f;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    // 1. Get target viewController from transitionContext
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 2. Get toVC's finale frame afer animation
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    
    // 3. Set toVC's init frame before animation
    toVC.view.frame = CGRectOffset(finalFrame, -[UIScreen mainScreen].bounds.size.width, 0);
    
    // 4. Add toVC's view to containerView
    [[transitionContext containerView] addSubview:toVC.view];
    
    // 5. Do animation now
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         toVC.view.frame = finalFrame;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

@end
