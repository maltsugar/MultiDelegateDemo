//
//  AppDelegate.h
//  MultiDelegateDemo
//
//  Created by qm on 2017/10/25.
//  Copyright © 2017年 qm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DemoClass.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) DemoClass *democls;

@end

