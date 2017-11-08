//
//  GestureTransition.m
//  CustomTransitionAnimations
//
//  Created by wsk on 2017/10/27.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import "GestureTransition.h"

@interface GestureTransition()
@property (nonatomic, assign) GestureTransitionType         mTransitionType;    // 转场类型
@property (nonatomic, assign) GestureTransitionDirection    mGestureDirection;  // 转场方向
@property (nonatomic, strong) UIViewController*             mGestrueVC;
@end

@implementation GestureTransition

+(instancetype)objWithType:(GestureTransitionType)type
                 direction:(GestureTransitionDirection)direction
                 gestureVC:(UIViewController *)gestureVC {
    return [[GestureTransition alloc] initWithType:type
                                         direction:direction
                                         gestureVC:gestureVC];
}

-(instancetype)initWithType:(GestureTransitionType)type
                  direction:(GestureTransitionDirection)direction
                  gestureVC:(UIViewController *)gestureVC {
    self = [super init];
    if (self) {
        _mTransitionType = type;
        _mGestureDirection = direction;
        _mGestrueVC = gestureVC;
        
        UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureAction:)];
        [_mGestrueVC.view addGestureRecognizer:panGesture];
    }
    return self;
}

-(CGFloat)percentWithDirection:(GestureTransitionDirection)direction gesture:(UIPanGestureRecognizer*)gesture {
    CGPoint coordinate = [gesture translationInView:gesture.view.superview];
    CGFloat targeWidth = gesture.view.superview.bounds.size.width*0.4f;

    CGFloat percent = 0.f;
    switch ( _mGestureDirection ) {
        case GestureTransitionDirectionLeft:
            percent = -coordinate.x/targeWidth;
            break;
            
        case GestureTransitionDirectionRight:
            percent = coordinate.x/targeWidth;
            break;
            
        case GestureTransitionDirectionUp:
            percent = coordinate.y/targeWidth;
            break;
            
        case GestureTransitionDirectionDown:
            percent = -coordinate.y/targeWidth;
            break;
            
        default:
            break;
    }
    return percent;
}

-(void)tapGestureAction:(UIPanGestureRecognizer*)panGesture {

    CGFloat percent = [self percentWithDirection:_mGestureDirection gesture:panGesture];

    switch (panGesture.state) {
        case UIGestureRecognizerStateBegan:
            self.interacting = YES;
            [self startGesture];
            break;
            
        case UIGestureRecognizerStateChanged:
            [self updateInteractiveTransition:percent];
            break;
            
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:
            self.interacting = NO;
            if (percent > 0.5f) {
                [self finishInteractiveTransition];
            }
            else {
                [self cancelInteractiveTransition];
            }
            break;
            
        default:
            break;
    }
}

-(void)startGesture {
    switch ( _mTransitionType ) {
        case GestureTransitionTypePresent:
            if ( [self.delegate respondsToSelector:@selector(gestureTransitionPresent)] ) {
                [self.delegate gestureTransitionPresent];
            }
            break;
            
        case GestureTransitionTypeDismiss:
            [_mGestrueVC dismissViewControllerAnimated:YES completion:^{}];
            break;
            
        case GestureTransitionTypePush:
            if ( [self.delegate respondsToSelector:@selector(gestureTransitionPush)] ) {
                [self.delegate gestureTransitionPush];
            }
            break;
            
        case GestureTransitionTypePop:
            [_mGestrueVC.navigationController popViewControllerAnimated:YES];
            break;
            
        default:
            break;
    }
}

@end
