//
//  People.h
//  PrecticeVCPassValue
//
//  Created by ios on 2019/1/9.
//  Copyright © 2019年 KN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject

// 名字
@property(nonatomic,copy,getter=getName)NSString *name;

+(instancetype)shareManager;

@end
