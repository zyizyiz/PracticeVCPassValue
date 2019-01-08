//
//  SecondViewController.h
//  PrecticeVCPassValue
//
//  Created by ios on 2019/1/9.
//  Copyright © 2019年 KN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "People.h"

@protocol SecondDelegate<NSObject>
@optional
-(void)delegatePassValue:(NSString*)value;

@end

@interface SecondViewController : UIViewController

// 对象传值
@property(nonatomic,copy)NSString *objectPassValue;

// Block传值
@property(nonatomic,copy)void(^BlockPassValue)(NSString* value);

// 代理传值
@property(nonatomic,weak)id<SecondDelegate> delegate;

// KVO传值
@property(nonatomic,copy)NSString *kvoPassValue;

// 单例传值
@property(nonatomic,copy)People *man;

@end
