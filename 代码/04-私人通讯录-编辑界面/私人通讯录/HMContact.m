//
//  HMContact.m
//  私人通讯录
//
//  Created by yz on 14-8-29.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "HMContact.h"

@implementation HMContact


// instancetype自动识别当前类的对象 == HMContact *
+ (instancetype)contactWithName:(NSString *)name phone:(NSString *)phone
{
    HMContact *contact = [[HMContact alloc] init];
    
    contact.name = name;
    contact.phone = phone;
    
    return contact;
}

@end
