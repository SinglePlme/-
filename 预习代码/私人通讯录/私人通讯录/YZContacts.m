//
//  YZContacts.m
//  私人通讯录
//
//  Created by yz on 14-8-23.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "YZContacts.h"

#define YZNameKey @"name"
#define YZPhoneKey @"phone"

@implementation YZContacts


+ (instancetype)contactWithName:(NSString *)name phone:(NSString *)phone
{
    YZContacts *contact = [[self alloc] init];
    contact.name = name;
    contact.phone = phone;
    
    return contact;
}
#pragma mark 归档的时候调用
// 告诉哪些属性需要归档
// 告诉属性怎么从文件中存储
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_name forKey:YZNameKey];
    [aCoder encodeObject:_phone forKey:YZPhoneKey];
}

#pragma mark 解档的时候调用
// 告诉哪些属性需要解档
// 告诉属性怎么从文件中读取

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {

        _name = [aDecoder decodeObjectForKey:YZNameKey];
        _phone = [aDecoder decodeObjectForKey:YZPhoneKey];
        
    }
    return self;
}

@end
