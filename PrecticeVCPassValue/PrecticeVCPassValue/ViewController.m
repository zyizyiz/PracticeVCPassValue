//
//  ViewController.m
//  PrecticeVCPassValue
//
//  Created by ios on 2019/1/9.
//  Copyright © 2019年 KN. All rights reserved.
//

/*
 页面间传值:
    正向传值（A → B）:
        1.属性传值
    反向传值（A ← B）:
        2.Block传值 : 将Block当作属性
        3.代理传值
        4.通知传值
        5.KVO传值 : 监听B面的属性
        6.单例传值
        7.数据持久化 : NSUserDefaults、SQLite、CoreData等
 */

#import "ViewController.h"
#import "SecondViewController.h"


#define NotificationKey @"NotificationCenterPassValue"
@interface ViewController ()<SecondDelegate>

// 跳转到下一页面
@property(nonatomic,strong)UIButton *btn;

// 下一个界面
@property(nonatomic,strong)SecondViewController *vc;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 单例传值
    NSLog(@"%@",[[People shareManager] getName]);
    
    // 数据持久化
    NSLog(@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"userDefaultsPassValue"]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [_btn setTitle:@"跳转" forState:(UIControlStateNormal)];
    [_btn setBackgroundColor:[UIColor orangeColor]];
    [_btn addTarget:self action:@selector(jumpVC) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_btn];
    
    // 4.通知传值
    // 注册通知中心，添加监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:NotificationKey object:nil];
}

-(void)receiveNotification:(NSNotification *)notification {
    NSLog(@"%@",notification.userInfo);
}

-(void)jumpVC {
    
    _vc = [[SecondViewController alloc]init];
    // 1.（正向传值）属性传值
    _vc.objectPassValue = @"对象传值";
    // 2. Block传值
    _vc.BlockPassValue = ^(NSString *value) {
        NSLog(@"%@",value);
    };
    // 3. 代理传值
    _vc.delegate = self;
    // 5. KVO传值
    [_vc addObserver:self forKeyPath:@"kvoPassValue" options:(NSKeyValueObservingOptionNew) context:nil];
    [self.navigationController pushViewController:_vc animated:true];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"kvoPassValue"]) {
        NSLog(@"%@",change);
    }
}

-(void)delegatePassValue:(NSString *)value {
    NSLog(@"%@",value);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NotificationKey object:nil];
    [_vc removeObserver:self forKeyPath:@"kvoPassValue"];
}


@end
