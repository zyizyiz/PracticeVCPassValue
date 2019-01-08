//
//  People.m
//  PrecticeVCPassValue
//
//  Created by ios on 2019/1/9.
//  Copyright © 2019年 KN. All rights reserved.
//

#import "People.h"

static People *manager = nil;
@implementation People


+(instancetype)shareManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[People alloc]init];
    });
    return manager;
}

-(NSString *)getName {
    return _name;
}

@end
