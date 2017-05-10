//
//  HMContact.h
//  私人通讯录
//
//  Created by yz on 14-8-29.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMContact : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *phone;

+ (instancetype)contactWithName:(NSString *)name phone:(NSString *)phone;

@end
