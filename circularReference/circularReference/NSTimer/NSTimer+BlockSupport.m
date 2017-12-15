//
//  NSTimer+BlockSupport.m
//  circularReference
//
//  Created by wsk on 2017/12/15.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import "NSTimer+BlockSupport.h"

@implementation NSTimer (BlockSupport)

+ (NSTimer *)bk_scheduledTimeWithTimeInterval:(NSTimeInterval)interval
                                      repeats:(BOOL)repeats
                                        block:(void(^)(void))block
{
    return [self scheduledTimerWithTimeInterval:interval
                                         target:self
                                       selector:@selector(ypq_blockInvoke:)
                                       userInfo:[block copy]
                                        repeats:repeats];
}

+ (void)ypq_blockInvoke:(NSTimer *)timer
{
    void (^block)(void) = timer.userInfo;
    if(block)
    {
        block();
    }
}

@end
