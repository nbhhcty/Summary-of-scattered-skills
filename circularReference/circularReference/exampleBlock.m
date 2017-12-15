//
//  example1.m
//  circularReference
//
//  Created by wsk on 2017/12/15.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import "exampleBlock.h"

typedef void (^myBlock)(void);

@interface exampleBlock()
{
    NSString* name;
}
@property (nonatomic, strong) myBlock mBlock;
@end

@implementation exampleBlock

-(void)setPubName:(NSString *)pubName {
    name = pubName;
}

#pragma mark - 不会循环引用的情况
-(void)testCircularReferenceNo_1 {
    _mBlock = ^(void) {
        NSLog(@"name = %@", name);
    };
    _mBlock();
    _mBlock = nil;
}

-(void)testCircularReferenceNo_2 {
    __weak typeof(self) weakSelf=self;
    _mBlock = ^(void) {
        __strong typeof(weakSelf) self = weakSelf;
        NSLog(@"name = %@", self->name);
    };
    _mBlock();
}

-(void)testCircularReferenceNo_3 {
    _mBlock = ^(void) {
        NSLog(@"name = %@", name);
        _mBlock = nil;
    };
    _mBlock();
}

-(void)testCircularReferenceNo_4 {
    myBlock tempBlock = ^(void) {
        NSLog(@"name = %@", name);
        _mBlock = nil;
    };
    tempBlock();
}

#pragma mark - 会循环引用的情况
-(void)testCircularReferenceYES_1 {
    _mBlock = ^(void) {
        NSLog(@"name = %@", name);
    };
    _mBlock();
}

-(void)dealloc {
    NSLog(@"dealloc 释放内存空间\r\n");
}

@end
