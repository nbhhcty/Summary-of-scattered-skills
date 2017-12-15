//
//  example1.h
//  circularReference
//
//  Created by wsk on 2017/12/15.
//  Copyright © 2017年 pptv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExampleBlock : NSObject
@property (nonatomic, strong) NSString* pubName;

-(void)testCircularReferenceNo_1;
-(void)testCircularReferenceNo_2;
-(void)testCircularReferenceNo_3;
-(void)testCircularReferenceNo_4;

-(void)testCircularReferenceYES_1;

@end
