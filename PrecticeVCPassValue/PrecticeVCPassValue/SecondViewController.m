//
//  SecondViewController.m
//  PrecticeVCPassValue
//
//  Created by ios on 2019/1/9.
//  Copyright © 2019年 KN. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // 属性传值
    NSLog(@"%@",_objectPassValue);
    
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // Block传值
    if (self.BlockPassValue) {
        self.BlockPassValue(@"BlockPassValue");
    }
    
    // 代理传值
    if ([self.delegate respondsToSelector:@selector(delegatePassValue:)]) {
        [self.delegate delegatePassValue:@"DelegatePassValue"];
    }
    
    // 通知传值
    NSDictionary *dic = @{
                          @"NotificationCenterPassValue" : @"NotificationCenterPassValue"
                          };
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NotificationCenterPassValue" object:nil userInfo:dic];
    
    // KVO传值
    [self setKvoPassValue:@"kvoPassValue"];
    
    // 单例传值
    [[People shareManager] setName:@"SingletonPassValue"];
    
    // 数据持久化
    [[NSUserDefaults standardUserDefaults] setObject:@"userDefaultsPassValue" forKey:@"userDefaultsPassValue"];
}

@end
