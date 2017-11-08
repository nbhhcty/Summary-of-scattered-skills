//
//  BaseVC.h
//  CustomTransitionAnimations
//
//  Created by wsk on 2017/10/26.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCustomTransitionAnimation.h"
#import "DelegateForDismissVC.h"

@interface BaseCustomTransitionVC : UIViewController
<
UIViewControllerTransitioningDelegate,
DelegateForDismissVC
>
@property (nonatomic, weak) id <DelegateForDismissVC> delgate;
@property (nonatomic, strong) BaseCustomTransitionAnimation* presentAnimation;
@property (nonatomic, strong) BaseCustomTransitionAnimation* dissmissAnimation;
@property (nonatomic, strong) NSString* testStr;
@end
