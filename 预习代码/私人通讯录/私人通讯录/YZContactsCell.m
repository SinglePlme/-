//
//  YZContactsCell.m
//  私人通讯录
//
//  Created by yz on 14-8-23.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "YZContactsCell.h"

#import "YZContacts.h"

@interface YZContactsCell()

@property (nonatomic, weak) UIView *divide;

@end

@implementation YZContactsCell

- (UIView *)divide
{
    if (_divide == nil) {
        UIView *divide = [[UIView alloc] init];
        divide.backgroundColor = [UIColor blackColor];
        divide.alpha = 0.2;
        [self.contentView addSubview:divide];
        _divide = divide;
    }
    
    return _divide;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"contact";
    
    return [tableView dequeueReusableCellWithIdentifier:ID];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.设置分割线的位置
    CGFloat divideH = 1;
    CGFloat divideW = self.frame.size.width;
    CGFloat divideY = self.frame.size.height - divideH;
    self.divide.frame = CGRectMake(0, divideY, divideW, divideH);
    
}

- (void)setContact:(YZContacts *)contact
{
    _contact = contact;
    self.textLabel.text = contact.name;
    self.detailTextLabel.text = contact.phone;

}
@end
