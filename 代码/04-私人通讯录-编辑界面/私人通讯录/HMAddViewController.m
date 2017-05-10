//
//  HMAddViewController.m
//  私人通讯录
//
//  Created by yz on 14-8-29.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "HMAddViewController.h"


#import "HMContact.h"
#import "HMContactsTableViewController.h"

@interface HMAddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

@implementation HMAddViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
#warning 第一步监听两个文本框的内容，控制器登录按钮的状态
    // 1.addTarget
    [_nameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_phoneField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    
    // 手动判断按钮是否能点击
    [self textChange];
    
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // 弹出姓名的文本框
    [_nameField becomeFirstResponder];

}

- (void)textChange
{
    // 判断两个文本框的内容
    _addBtn.enabled = _nameField.text.length && _phoneField.text.length;
    
    
}
- (IBAction)add:(id)sender {
    // 1.回到上一个控制器
    [self.navigationController popViewControllerAnimated:YES];
    
    // 创建模型
    HMContact *contact = [HMContact contactWithName:_nameField.text phone:_phoneField.text];
    
    // 2.通知代理做事情
    if ([_delegate respondsToSelector:@selector(addViewController:didAddContact:)]) {
        [_delegate addViewController:self didAddContact:contact];
    }
//    [self.contacts setName:_nameField.text phone:_phoneField.text];
    
}

@end
