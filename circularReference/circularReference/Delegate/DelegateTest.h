//
//  DelegateTest.h
//  circularReference
//
//  Created by wsk on 2017/12/19.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomProtocol.h"

@interface DelegateTest : NSObject
// weak不会造成循环引用，反之strong会造成循环引用
@property (nonatomic, weak) id<CustomProtocol> delegate;
@end
