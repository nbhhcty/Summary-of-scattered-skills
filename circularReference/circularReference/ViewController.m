//
//  ViewController.m
//  circularReference
//
//  Created by wsk on 2017/12/15.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import "ViewController.h"
#import "BlockTest.h"
#import "NSTimerTest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Block测试
//    [BlockTest testCirculateReferenceBlockNo];
//    [BlockTest testCirculateReferenceBlockYes];

    // 定时器测试
    [NSTimerTest testCirculateReferenceBlockNo];
//    [NSTimerTest testCirculateReferenceBlockYes];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
