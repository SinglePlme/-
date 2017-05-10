//
//  HMCotactCell.m
//  私人通讯录
//
//  Created by yz on 14-8-29.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "HMContactCell.h"
#import "HMContact.h"


@interface HMContactCell()

@property (nonatomic, weak) UIView *divide;

@end


@implementation HMContactCell


- (UIView *)divide
{
    if (_divide == nil) {
        
        UIView *v = [[UIView alloc] init];
        
        v.backgroundColor = [UIColor blackColor];
        
        v.alpha = 0.2;
        _divide = v;
        
        [self.contentView addSubview:_divide];
    }
    
    return _divide;
}

- (void)setContact:(HMContact *)contact
{
    _contact = contact;
    
    // 给cell的控件赋值
    self.textLabel.text = contact.name;
    self.detailTextLabel.text = contact.phone;

    
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"contact";
    return [tableView dequeueReusableCellWithIdentifier:ID];

}

// 从XIB加载完成的时候调用
- (void)awakeFromNib
{
    // Initialization code
    
    
    
}


// 当自己的frame改变的时候就会调用
- (void)layoutSubviews
{
    [super layoutSubviews];
    // 给divide设置位置
    
    CGFloat divideH = 1;
    CGFloat divideW = self.bounds.size.width;
    CGFloat divideY = self.bounds.size.height - divideH;
    self.divide.frame = CGRectMake(0, divideY, divideW, divideH);

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
