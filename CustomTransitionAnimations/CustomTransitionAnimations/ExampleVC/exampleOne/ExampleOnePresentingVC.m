//
//  ExampleOnePresentingVC.m
//  CustomTransitionAnimations
//
//  Created by wsk on 2017/10/26.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import "ExampleOnePresentingVC.h"
#import "ExampleOnePresentedVC.h"

@interface ExampleOnePresentingVC ()
@property (nonatomic, strong) UIButton* mBackBtn;
@property (nonatomic, strong) UIButton* mPresentBtn;
@end

@implementation ExampleOnePresentingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSubViews];
}

-(void)initSubViews {
    [self.view addSubview:self.mBackBtn];
    [self.view addSubview:self.mPresentBtn];
    [self initSubViewsFrame];
}

-(void)initSubViewsFrame {
    [self.mBackBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.offset(60.f);
        make.leftMargin.offset(60.f);
        make.size.mas_equalTo(CGSizeMake(100.f, 50.f));
    }];
    
    [self.mPresentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200.f, 100.f));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Lazy Initial

-(UIButton *)mBackBtn {
    if ( !_mBackBtn ) {
        _mBackBtn = [UIButton new];
        _mBackBtn.backgroundColor = [UIColor blueColor];
        [_mBackBtn setTitle:@"Back" forState:UIControlStateNormal];
        MD_WeakObj(self)
        [[_mBackBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            MD_StrongObj(self)
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
        }];
    }
    return _mBackBtn;
}

-(UIButton *)mPresentBtn {
    if ( !_mPresentBtn ) {
        _mPresentBtn = [UIButton new];
        _mPresentBtn.backgroundColor = [UIColor brownColor];
        [_mPresentBtn setTitle:@"Transition Animation" forState:UIControlStateNormal];
        MD_WeakObj(self)
        [[_mPresentBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            MD_StrongObj(self)
            ExampleOnePresentedVC* vc = [ExampleOnePresentedVC new];
            vc.transitioningDelegate = self;
            vc.delgate = self;
            [self presentViewController:vc animated:YES completion:^{}];
        }];
    }
    return _mPresentBtn;
}

@end
