//
//  HMEditViewController.m
//  私人通讯录
//
//  Created by yz on 14-8-29.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "HMEditViewController.h"

#import "HMContact.h"

@interface HMEditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end

@implementation HMEditViewController

// 点击了保存按钮
- (IBAction)save:(id)sender {
    // 1.回到联系人界面
    [self.navigationController popViewControllerAnimated:YES];
    // 2.更新数据:覆盖旧数据，把最新的数据展示出来
    self.contact.name = _nameField.text;
    self.contact.phone = _phoneField.text;
    
    
    // 3.通知联系人界面刷新表格
    if ([_delegate respondsToSelector:@selector(editViewController:didUpdateContact:)]) {
        [_delegate editViewController:self didUpdateContact:self.contact];
    }
    
}

// 点击了编辑按钮就会调用
- (IBAction)edit:(UIBarButtonItem *)sender {
    
    if ([sender.title isEqualToString:@"取消"]) { // 点击取消
        // 1.改变按钮的文字
        sender.title = @"编辑";
        // 2.不允许文本框编辑
        _nameField.enabled = NO;
        _phoneField.enabled = NO;
        
        // 3.隐藏保存按钮
        _saveBtn.hidden = YES;
        
        // 4.退出键盘
//        [_phoneField resignFirstResponder];
        [self.view endEditing:YES];
        
        // 恢复文本框显示
        _nameField.text = _contact.name;
        _phoneField.text = _contact.phone;

        
        
        
    }else // 点击编辑
    {
        // 1.改变按钮的文字
        sender.title = @"取消";
        // 2.允许文本框编辑
        _nameField.enabled = YES;
        _phoneField.enabled = YES;
        
        // 3.显示保存按钮
        _saveBtn.hidden = NO;
        
        // 4.弹出电话的键盘
        [_phoneField becomeFirstResponder];
        
    }
    
    
    
}

#pragma mark 给文本框控件赋值
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 给控件赋值
    _nameField.text = _contact.name;
    _phoneField.text = _contact.phone;

    // 1.addTarget
    [_nameField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_phoneField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    
    // 手动判断按钮是否能点击
    [self textChange];
}

- (void)textChange
{
    // 判断两个文本框的内容
    _saveBtn.enabled = _nameField.text.length && _phoneField.text.length;
    
    
}

@end
