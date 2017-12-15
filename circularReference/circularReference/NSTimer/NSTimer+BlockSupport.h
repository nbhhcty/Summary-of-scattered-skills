//
//  NSTimer+BlockSupport.h
//  circularReference
//
//  Created by wsk on 2017/12/15.
//  Copyright © 2017年 pptv. All rights reserved.
//  由于循环引用的起因是target,则可以包装一个target,让target是另一个对象,而不是ViewController即可

#import <Foundation/Foundation.h>

@interface NSTimer (BlockSupport)
+ (NSTimer *)bk_scheduledTimeWithTimeInterval:(NSTimeInterval)interval
                                      repeats:(BOOL)repeats
                                        block:(void(^)(void))block;
@end
