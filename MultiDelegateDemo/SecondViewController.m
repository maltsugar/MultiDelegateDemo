//
//  SecondViewController.m
//  MultiDelegateDemo
//
//  Created by qm on 2017/10/25.
//  Copyright © 2017年 qm. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "AppDelegate.h"

@interface SecondViewController ()<DemoClassDelegate>

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"2nd VC";
    
    
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


- (IBAction)pushNextAction
{
    ThirdViewController *vc = [ThirdViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)dealloc
{
    NSLog(@"%s", __func__);
}

@end
