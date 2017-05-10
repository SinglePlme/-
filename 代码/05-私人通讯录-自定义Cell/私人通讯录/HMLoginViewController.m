//
//  HMLoginViewController.m
//  私人通讯录
//
//  Created by yz on 14-8-29.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "HMLoginViewController.h"

#import "MBProgressHUD+MJ.h"

#import "HMContactsTableViewController.h"

@interface HMLoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginS;
@property (weak, nonatomic) IBOutlet UISwitch *rmbPwdS;

@property (nonatomic, strong) HMContactsTableViewController *contact;

@end

@implementation HMLoginViewController


#warning 第四步做跳转之前的准备工作
/**
 *  执行segue的时候，跳转之前调用
 *  一般用做一些跳转之前的准备操作，给下一个控制器传值
 *  @param segue  <#segue description#>
 *  @param sender <#sender description#>
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
//    NSLog(@"%@---%@--%@",segue.identifier,segue.sourceViewController,segue.destinationViewController);
    
    // 获取目的控制器
    UIViewController *v = segue.destinationViewController;
    
    // 给联系人导航条设置标题
    v.navigationItem.title = [NSString stringWithFormat:@"%@的联系人",_accountField.text];
    
}

#warning 第三步处理登录功能
// 当点击登录的时候调用
- (IBAction)login:(id)sender { // hm 123
    
    // 判断用户输入的账号和密码是否正确
    if ([_accountField.text isEqualToString:@"hm"] && [_pwdField.text isEqualToString:@"123"]) { // 账号和密码正确
        
        // 显示遮盖：只要做一些比较耗时的操作最好用遮盖
        [MBProgressHUD showMessage:@"正在登录中"];
        
        // GCD
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            // 移除遮盖
            [MBProgressHUD hideHUD];
            
            
            // 执行segue
            [self performSegueWithIdentifier:@"login2contact" sender:nil];
            
            
        });
        
        
        
    }else{ // 不正确
        
        
        // MBProgressHud:提示框
        [MBProgressHUD showError:@"账号或者密码错误"];
        
    }
    
    
}


#warning 第二步 处理Switch
// 当记住密码状态改变的时候调用
- (IBAction)rmbPwdSwitch:(UISwitch *)sender {
    //
    if (sender.isOn == NO) {
        [_autoLoginS setOn:NO animated:YES];

    }
    
}
// 当自动登录状态改变的时候调用
- (IBAction)autoLoginSwitch:(UISwitch *)sender {
    if (sender.isOn == YES) {
        [_rmbPwdS setOn:YES animated:YES];
    }

}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
#warning 第一步监听两个文本框的内容，控制器登录按钮的状态
    // 1.addTarget
    [_accountField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_pwdField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    
    // 手动判断按钮是否能点击
    [self textChange];
}
// 当文本框的内容改变的时候就会调用
- (void)textChange
{
    // 判断两个文本框的内容
    _loginBtn.enabled = _accountField.text.length && _pwdField.text.length;
    

}


 
 
 
@end
