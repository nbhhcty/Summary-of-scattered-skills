//
//  NSTimerTest.m
//  circularReference
//
//  Created by wsk on 2017/12/15.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import "NSTimerTest.h"
#import "ExampleNSTimer.h"

@implementation NSTimerTest

+(void) testCirculateReferenceBlockYes{
    ExampleNSTimer* obj1 = [ExampleNSTimer new];
    [obj1 testCircularReferenceYES_1];
    obj1 = nil;
    
    ExampleNSTimer* obj2 = [ExampleNSTimer new];
    [obj2 testCircularReferenceYES_2];
    obj2 = nil;
}

+(void) testCirculateReferenceBlockNo{
    ExampleNSTimer* obj1 = [ExampleNSTimer new];
    [obj1 testCircularReferenceNO_1];
    obj1 = nil;
    
    ExampleNSTimer* obj2 = [ExampleNSTimer new];
    [obj2 testCircularReferenceNO_2];
    obj2 = nil;
    
    ExampleNSTimer* obj3 = [ExampleNSTimer new];
    [obj3 testCircularReferenceNO_3];
    obj3 = nil;
}

@end
