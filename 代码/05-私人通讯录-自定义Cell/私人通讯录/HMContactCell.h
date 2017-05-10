//
//  HMCotactCell.h
//  私人通讯录
//
//  Created by yz on 14-8-29.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HMContact;
@interface HMContactCell : UITableViewCell

@property (nonatomic, strong) HMContact *contact;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
