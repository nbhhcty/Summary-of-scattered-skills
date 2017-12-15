//
//  exampleNSTimer.m
//  circularReference
//
//  Created by wsk on 2017/12/15.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import "ExampleNSTimer.h"
#import "NSTimer+BlockSupport.h"

@interface ExampleNSTimer()
{
    NSString* name;
}
@property (nonatomic, strong) NSTimer* mTimer;
@end

@implementation ExampleNSTimer

-(instancetype)init {
    if ( self = [super init] ) {
        name = @"name";
    }
    return self;
}

#pragma mark - 会循环引用的情况
-(void)testCircularReferenceYES_1 {
    NSLog(@"!!会造成循环引用 1");
    self.mTimer = [NSTimer scheduledTimerWithTimeInterval:2.f
                                                   target:self
                                                 selector:@selector(timerAction)
                                                 userInfo:nil
                                                  repeats:YES];
}

-(void)testCircularReferenceYES_2 {
    NSLog(@"!!会造成循环引用 2");
    // iOS 10提供的新API，解决了循环引用
    self.mTimer = [NSTimer scheduledTimerWithTimeInterval:2.f
                                                  repeats:YES
                                                    block:^(NSTimer * _Nonnull timer) {
                                                        NSString* tempName = name;
                                                    }];
}

-(void)testCircularReferenceNO_1 {
    NSLog(@"不会造成循环引用 1");
    // iOS 10提供的新API，解决了循环引用
    self.mTimer = [NSTimer scheduledTimerWithTimeInterval:2.f
                                                  repeats:YES
                                                    block:^(NSTimer * _Nonnull timer) {
                                                        //    NSLog(@"执行定时任务");
                                                    }];
}

-(void)testCircularReferenceNO_2 {
    NSLog(@"不会造成循环引用 2");
    self.mTimer = [NSTimer scheduledTimerWithTimeInterval:2.f
                                                   target:self
                                                 selector:@selector(timerAction)
                                                 userInfo:nil
                                                  repeats:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 如果是在控制器viewController中，一般在viewWillDisappear的时候取消定时器，并且置空，解除循环引用
        [self.mTimer invalidate];
        self.mTimer = nil;
    });
}

-(void)testCircularReferenceNO_3 {
    // 使用dispatch_after只是为了log打印的清楚一些
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"不会造成循环引用 3");
        self.mTimer = [NSTimer bk_scheduledTimeWithTimeInterval:2.f
                                                        repeats:YES
                                                          block:^{
                                                              
                                                          }];
    });
}

-(void)timerAction {
    //NSLog(@"执行定时任务");
}

-(void)dealloc {
    NSLog(@"dealloc 释放内存空间\r\n");
}

@end
