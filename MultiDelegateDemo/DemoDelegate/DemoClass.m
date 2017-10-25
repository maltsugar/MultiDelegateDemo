//
//  DemoClass.m
//  MultiDelegateDemo
//
//  Created by qm on 2017/10/25.
//  Copyright © 2017年 qm. All rights reserved.
//

#import "DemoClass.h"


// 桥接类 弱引用delegate
@interface DemoClassBridge : NSObject
@property (nonatomic,   weak) id<DemoClassDelegate> delegate;
@end

@implementation DemoClassBridge
- (void)dealloc
{
    NSLog(@"%s", __func__);
}
@end



@interface DemoClass ()
@property (nonatomic, strong) NSMutableArray *delegatesContainer;
@end

@implementation DemoClass


- (instancetype)init
{
    self = [super init];
    if (self) {
        // 此处模拟网络请求后或者其他需要回调时
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self startCallBack];
        });
    }
    return self;
}

- (void)startCallBack
{
    
    int random = arc4random()%100;
    for (DemoClassBridge *obj in self.delegatesContainer) {
        if ([obj.delegate respondsToSelector:@selector(testMethodInProtocol)]) {
            [obj.delegate testMethodInProtocol];
        }
        
        if ([obj.delegate respondsToSelector:@selector(testMethodWithParameter:)]) {
            [obj.delegate testMethodWithParameter:[NSString stringWithFormat:@"传了一个参数%d",random]];
        }
    }
}



- (void)addDelegate:(id<DemoClassDelegate>)delegate
{
    DemoClassBridge *bridge = [DemoClassBridge new];
    bridge.delegate = delegate;
    [self.delegatesContainer addObject:bridge];
}


- (NSMutableArray *)delegatesContainer
{
    if (nil == _delegatesContainer) {
        _delegatesContainer = [[NSMutableArray alloc]init];
    }
    return _delegatesContainer;
}

- (void)dealloc
{
    NSLog(@"%s", __func__);
}

@end
