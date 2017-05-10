//
//  HMPerson.m
//  08-自定义对象归档
//
//  Created by yz on 14-8-29.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "HMPerson.h"

@implementation HMPerson

// 在对象归档的时候调用
// 哪些属性需要归档
// 这些属性怎么归档
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInt:_age forKey:@"age"];
}

// 在对象解档的时候调用
// 哪些属性需要解档
// 这些属性怎么解档

- (id)initWithCoder:(NSCoder *)aDecoder
{
    // 当父类实现了NSCoding，就能调用 [super initWithCoder]
    if (self = [super init]) {
        _age = [aDecoder decodeIntForKey:@"age"];
    }
    return self;
}

@end
