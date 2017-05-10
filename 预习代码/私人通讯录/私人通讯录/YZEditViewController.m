//
//  YZEditViewController.m
//  私人通讯录
//
//  Created by yz on 14-8-22.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "YZEditViewController.h"
#import "YZContacts.h"

@interface YZEditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end

@implementation YZEditViewController
- (IBAction)save:(id)sender {
    // 1.跳转到联系人控制器
    [self.navigationController popViewControllerAnimated:YES];
    
    // 2.更新模型数据,把最新文本框的数据给我们模型
    self.contact.name = _nameField.text;
    self.contact.phone = _phoneField.text;
    
    
    // 3.通知代理，刷新表格
    if ([_delegate respondsToSelector:@selector(editViewController:didSaveContact:)]) {
        
        [_delegate editViewController:self didSaveContact:self.contact];
        
    }
    

}
- (IBAction)edit:(UIBarButtonItem *)sender {
    
    if (_nameField.enabled) { // 点击的是取消
        // 改变UIBarButtonItem的文字
        sender.title = @"编辑";
        // 文本框不可以编辑
        _nameField.enabled = NO;
        _phoneField.enabled = NO;
        // 隐藏保存按钮
        _saveBtn.hidden = YES;
        // 退出键盘
        [_phoneField resignFirstResponder];
        
        // 恢复之前的数据,之前的数据一直保存在模型里面，直接给控件赋值就好了
        _nameField.text = _contact.name;
        _phoneField.text = _contact.phone;

        
        
    }else{ // 点击的是编辑
        // 改变UIBarButtonItem的文字
        sender.title = @"取消";
        // 文本框可以编辑
        _nameField.enabled = YES;
        _phoneField.enabled = YES;
        // 显示保存按钮
        _saveBtn.hidden = NO;
        // 为了用户体验，一开始就弹出电话文本框键盘
        [_phoneField becomeFirstResponder];
        
        // 需要判断下，保存按钮能否点击
        [self testChange];
        
    }
    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _nameField.text = _contact.name;
    _phoneField.text = _contact.phone;

    // 监听两个文本框文字的改变
    [_nameField addTarget:self action:@selector(testChange) forControlEvents:UIControlEventEditingChanged];
    [_phoneField addTarget:self action:@selector(testChange) forControlEvents:UIControlEventEditingChanged];
}


- (void)testChange
{
    // 控制按钮的状态
    _saveBtn.enabled = _nameField.text.length && _phoneField.text.length;
    
}
@end
