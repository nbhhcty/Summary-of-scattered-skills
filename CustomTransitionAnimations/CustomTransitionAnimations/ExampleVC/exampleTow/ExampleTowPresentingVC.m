//
//  ExampleTowPresentingVC.m
//  CustomTransitionAnimations
//
//  Created by wsk on 2017/10/26.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import "ExampleTowPresentingVC.h"

@interface ExampleTowPresentingVC ()
@property (nonatomic, strong) UIButton* mBackBtn;
@end

@implementation ExampleTowPresentingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dissmissAnimation = nil;
    self.presentAnimation = nil;
    
    [self initSubViews];
}

-(void)initSubViews {
    [self.view addSubview:self.mBackBtn];
    [self initSubViewsFrame];
}

-(void)initSubViewsFrame {
    [self.mBackBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.offset(60.f);
        make.leftMargin.offset(60.f);
        make.size.mas_equalTo(CGSizeMake(100.f, 50.f));
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

@end
