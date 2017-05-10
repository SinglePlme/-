//
//  YZContactsCell.h
//  私人通讯录
//
//  Created by yz on 14-8-23.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YZContacts;

@interface YZContactsCell : UITableViewCell

@property (nonatomic, strong) YZContacts *contact;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
