//
//  ThirdViewController.m
//  MultiDelegateDemo
//
//  Created by qm on 2017/10/25.
//  Copyright © 2017年 qm. All rights reserved.
//

#import "ThirdViewController.h"
#import "AppDelegate.h"

@interface ThirdViewController ()<DemoClassDelegate>



@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"3rd VC";
    
    AppDelegate * app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [app.democls addDelegate:self];
}

#pragma mark- DemoClassDelegate
- (void)testMethodInProtocol
{
    NSLog(@"%s", __func__);
}

- (void)testMethodWithParameter:(NSString *)param
{
    NSLog(@"%s param-->%@", __func__, param);
}



- (void)dealloc
{
    NSLog(@"%s", __func__);
}
@end
