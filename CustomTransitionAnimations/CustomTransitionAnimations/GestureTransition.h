//
//  GestureTransition.h
//  CustomTransitionAnimations
//
//  Created by wsk on 2017/10/27.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GestureTransitionDelegate<NSObject>
-(void)gestureTransitionPresent;
-(void)gestureTransitionPush;
@end

typedef NS_ENUM(NSUInteger, GestureTransitionDirection ) {
    GestureTransitionDirectionLeft,
    GestureTransitionDirectionRight,
    GestureTransitionDirectionUp,
    GestureTransitionDirectionDown
};

typedef NS_ENUM(NSUInteger, GestureTransitionType ) {
    GestureTransitionTypePresent,
    GestureTransitionTypeDismiss,
    GestureTransitionTypePush,
    GestureTransitionTypePop
};


@interface GestureTransition : UIPercentDrivenInteractiveTransition
@property (nonatomic, weak) id<GestureTransitionDelegate> delegate;
@property (nonatomic, assign) BOOL interacting;

+(instancetype)objWithType:(GestureTransitionType)type
                 direction:(GestureTransitionDirection)direction
                 gestureVC:(UIViewController*)gestureVC;

-(instancetype)initWithType:(GestureTransitionType)type
                  direction:(GestureTransitionDirection)direction
                  gestureVC:(UIViewController*)gestureVC;

@end
