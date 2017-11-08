//
//  BaseVC.m
//  CustomTransitionAnimations
//
//  Created by wsk on 2017/10/26.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import "BaseCustomTransitionVC.h"
#import "AnimationDismiss.h"
#import "AnimationPresent.h"

@interface BaseCustomTransitionVC ()
@end

@implementation BaseCustomTransitionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark Lazy initial
-(BaseCustomTransitionAnimation *)presentAnimation {
    if ( !_presentAnimation ) {
        _presentAnimation = [AnimationPresent new];
    }
    return _presentAnimation;
}

-(BaseCustomTransitionAnimation *)dissmissAnimation {
    if ( !_dissmissAnimation) {
        _dissmissAnimation = [AnimationDismiss new];
    }
    return _dissmissAnimation;
}

#pragma mark - <UIViewControllerTransitioningDelegate>
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                 presentingController:(UIViewController *)presenting
                                                                     sourceController:(UIViewController *)source {
    return self.presentAnimation;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return self.dissmissAnimation;
}

#pragma mark - <DelegateForDismissVC>
-(void)didDismissViewController {
    [self dismissViewControllerAnimated:YES completion:^{}];
}














@end
