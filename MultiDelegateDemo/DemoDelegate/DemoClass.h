//
//  DemoClass.h
//  MultiDelegateDemo
//
//  Created by qm on 2017/10/25.
//  Copyright © 2017年 qm. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DemoClassDelegate <NSObject>

- (void)testMethodInProtocol;

- (void)testMethodWithParameter:(NSString *)param;

@end

@interface DemoClass : NSObject


- (void)addDelegate:(id<DemoClassDelegate>)delegate;

@end
