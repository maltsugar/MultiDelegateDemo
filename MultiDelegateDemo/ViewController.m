//
//  ViewController.m
//  MultiDelegateDemo
//
//  Created by qm on 2017/10/25.
//  Copyright © 2017年 qm. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "AppDelegate.h"

@interface ViewController ()<DemoClassDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"1st VC";
    
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
    SecondViewController *vc = [SecondViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)dealloc
{
    NSLog(@"%s", __func__);
}

@end
