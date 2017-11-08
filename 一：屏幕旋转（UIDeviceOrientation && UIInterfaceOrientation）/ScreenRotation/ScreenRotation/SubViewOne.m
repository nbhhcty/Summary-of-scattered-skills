//
//  SubViewOne.m
//  ScreenRotation
//
//  Created by wsk on 2017/11/1.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import "SubViewOne.h"

@implementation SubViewOne

-(instancetype)init {
    if ( self = [super init] ) {
        self.text = NSStringFromClass([self class]);
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont boldSystemFontOfSize:55.f];
        self.textColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255.f)/255.f
                                               green:arc4random_uniform(255.f)/255.f
                                                blue:arc4random_uniform(255.f)/255.f
                                               alpha:1.f];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
