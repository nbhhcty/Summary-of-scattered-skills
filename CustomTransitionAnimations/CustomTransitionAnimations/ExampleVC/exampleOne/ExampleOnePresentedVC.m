//
//  ExampleOnePresentedVC.m
//  CustomTransitionAnimations
//
//  Created by wsk on 2017/10/26.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import "ExampleOnePresentedVC.h"

@interface ExampleOnePresentedVC ()
@property (nonatomic, strong) UIButton* mDismissBtn;
@end


@implementation ExampleOnePresentedVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    [self initSubViews];
}

-(void)initSubViews {
    [self.view addSubview:self.mDismissBtn];
    [self initSubViewsFrame];
}

-(void)initSubViewsFrame {
    [self.mDismissBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.mas_equalTo(200.f);
        make.height.mas_equalTo(100.f);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Lazy Initial
-(UIButton *)mDismissBtn {
    if ( !_mDismissBtn ) {
        _mDismissBtn = [UIButton new];
        _mDismissBtn.backgroundColor = [UIColor lightGrayColor];
        MD_WeakObj(self)
        [[_mDismissBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            MD_StrongObj(self)
            if ( [self.delgate respondsToSelector:@selector(didDismissViewController)] ) {
                [self.delgate didDismissViewController];
            }
        }];
    }
    return _mDismissBtn;
}

@end
