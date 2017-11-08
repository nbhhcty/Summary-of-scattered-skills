//
//  ViewController.m
//  ScreenRotation
//
//  Created by wsk on 2017/10/23.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import "ViewController.h"
#import "UIView+extend.h"
#import "Masonry.h"
#import "SubViewOne.h"

@interface ViewController ()
@property (nonatomic, strong) UIView* mScreendisplayView;
@property (nonatomic, strong) SubViewOne* mSubViewOne;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView* testRootView = [UIView new];
    [self.view addSubview:testRootView];
    [testRootView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.mas_equalTo(300.f);
    }];

    [testRootView addSubview:self.mScreendisplayView];
    [self.mScreendisplayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(testRootView);
        make.width.height.mas_equalTo(200.f);
    }];
    
    [self.view addSubview:self.mSubViewOne];
    [self.mSubViewOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(400.f,400.f));
    }];
    
    BOOL result1 = [self.view isContainClass:[self.mSubViewOne class]];
    BOOL result2 = [[UIApplication sharedApplication].windows.firstObject isContainClass:[self.mSubViewOne class]];
    BOOL result3 = [[UIApplication sharedApplication].windows.firstObject isContainClass:[self.view class]];

    NSString* digStr = [self.view digView:_mSubViewOne];
    
    NSLog(@"self.view = %@", self.view);
    NSLog(@"[UIApplication sharedApplication].windows.firstObject = %@", [UIApplication sharedApplication].windows.firstObject);

    NSLog(@"self.view是否含有子视图 = %@", result1 ? @"是" : @"否");
    NSLog(@"[UIApplication sharedApplication].windows.firstObject是否含有子视图 = %@", result2 ? @"是" : @"否");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Landscape : 横屏  Portrait: 竖屏
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                duration:(NSTimeInterval)duration
{
    // 传入一个方向值, 如果是横屏, 则返回YES
    if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) {
        NSLog(@"横屏 landscape");
    }
    
    // 传入一个方向值, 如果是竖屏, 则返回YES
    if (UIInterfaceOrientationIsPortrait(toInterfaceOrientation)) {
        NSLog(@"竖屏 portrait");
    }
}

#pragma mark - lazy loading
-(UIView *)mScreendisplayView {
    if ( !_mScreendisplayView ) {
        _mScreendisplayView = [UIView new];
        _mScreendisplayView.backgroundColor = [UIColor redColor];
    }
    return _mScreendisplayView;
}

-(SubViewOne *)mSubViewOne {
    if ( !_mSubViewOne ) {
        _mSubViewOne = [SubViewOne new];
    }
    return _mSubViewOne;
}

-(void)viewDidLayoutSubviews {
    BOOL isInSection = [self.mScreendisplayView isDisplayedInScreen];
    
    NSLog(@"%@", isInSection ? @"是" : @"否");
}





@end
