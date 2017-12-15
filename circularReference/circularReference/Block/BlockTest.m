//
//  BlockTest.m
//  circularReference
//
//  Created by wsk on 2017/12/15.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import "BlockTest.h"
#import "ExampleBlock.h"

@implementation BlockTest

+(void) testCirculateReferenceBlockYes {
    ExampleBlock* obj1 = [ExampleBlock new];
    obj1.pubName = @"!!会循环引用1";
    [obj1 testCircularReferenceYES_1];
    obj1 = nil;
}

+(void) testCirculateReferenceBlockNo {
    ExampleBlock* obj1 = [ExampleBlock new];
    obj1.pubName = @"不会循环引用1";
    [obj1 testCircularReferenceNo_1];
    obj1 = nil;
    
    ExampleBlock* obj2 = [ExampleBlock new];
    obj2.pubName = @"不会循环引用2";
    [obj2 testCircularReferenceNo_2];
    obj2 = nil;
    
    ExampleBlock* obj3 = [ExampleBlock new];
    obj3.pubName = @"不会循环引用3";
    [obj3 testCircularReferenceNo_3];
    obj3 = nil;
    
    ExampleBlock* obj4 = [ExampleBlock new];
    obj4.pubName = @"不会循环引用4";
    [obj4 testCircularReferenceNo_4];
    obj4 = nil;
}

@end
