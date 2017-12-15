//
//  ViewController.m
//  circularReference
//
//  Created by wsk on 2017/12/15.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import "ViewController.h"
#import "exampleBlock.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self testCirculateReferenceNo];
    [self testCirculateReferenceYes];
}

-(void) testCirculateReferenceYes {
    exampleBlock* obj1 = [exampleBlock new];
    obj1.pubName = @"!!会循环引用1";
    [obj1 testCircularReferenceYES_1];
    obj1 = nil;
}

-(void) testCirculateReferenceNo {
    exampleBlock* obj1 = [exampleBlock new];
    obj1.pubName = @"不会循环引用1";
    [obj1 testCircularReferenceNo_1];
    obj1 = nil;
    
    exampleBlock* obj2 = [exampleBlock new];
    obj2.pubName = @"不会循环引用2";
    [obj2 testCircularReferenceNo_2];
    obj2 = nil;
    
    exampleBlock* obj3 = [exampleBlock new];
    obj3.pubName = @"不会循环引用3";
    [obj3 testCircularReferenceNo_3];
    obj3 = nil;
    
    exampleBlock* obj4 = [exampleBlock new];
    obj4.pubName = @"不会循环引用4";
    [obj4 testCircularReferenceNo_4];
    obj4 = nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
