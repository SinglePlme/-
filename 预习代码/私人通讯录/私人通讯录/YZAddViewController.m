//
//  YZAddViewController.m
//  私人通讯录
//
//  Created by yz on 14-8-22.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "YZAddViewController.h"
#import "YZContacts.h"
@interface YZAddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

@implementation YZAddViewController



- (IBAction)addContacts:(id)sender {
    // 1.回到联系人界面
    [self.navigationController popViewControllerAnimated:YES];
    
    // 2.把文本框的数据传递给联系人控制器
    
    if ([_delegate respondsToSelector:@selector(addViewController:didAddContact:)]) {
        
        YZContacts *contact = [YZContacts contactWithName:_nameField.text phone:_phoneField.text];
        
        [_delegate addViewController:self didAddContact:contact];
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 监听两个文本框文字的改变
    [_nameField addTarget:self action:@selector(testChange) forControlEvents:UIControlEventEditingChanged];
    [_phoneField addTarget:self action:@selector(testChange) forControlEvents:UIControlEventEditingChanged];
    
    
}
// 界面显示完的时候，才需要弹出键盘
- (void)viewDidAppear:(BOOL)animated
{
    
    // 最好调用父类，不要改变系统默认的操作。
    [super viewDidAppear:animated];
    
    // 弹出文本框
    [_nameField becomeFirstResponder];
}

- (void)testChange
{
    // 控制按钮的状态
    _addBtn.enabled = _nameField.text.length && _phoneField.text.length;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
