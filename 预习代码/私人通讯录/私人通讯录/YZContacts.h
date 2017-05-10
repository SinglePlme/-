//
//  YZContacts.h
//  私人通讯录
//
//  Created by yz on 14-8-23.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZContacts : NSObject<NSCoding>

// 姓名
@property (nonatomic, copy) NSString *name;
// 电话
@property (nonatomic, copy) NSString *phone;

+ (instancetype)contactWithName:(NSString *)name phone:(NSString *)phone;

@end
