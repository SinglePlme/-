//
//  YZLoginViewController.m
//  私人通讯录
//
//  Created by yz on 14-8-22.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "YZLoginViewController.h"

#import "MBProgressHUD+MJ.h"

#define YZAccountKey @"account"
#define YZPwdKey @"pwd"
#define YZRmbPwdKey @"rmb_pwd"
#define YZAutoLoginKey @"aoto_login"

@interface YZLoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UISwitch *rmbPwdSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;

@end



@implementation YZLoginViewController

- (IBAction)login:(id)sender { // 账号:hm 密码:123
    
    // 1.需要判断账号和密码是否正确
    if ( [_accountField.text isEqualToString:@"hm"] && [_pwdField.text isEqualToString:@"123"]) {
        
        // 保存数据
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:_accountField.text forKey:YZAccountKey];
        [defaults setBool:_rmbPwdSwitch.isOn forKey:YZRmbPwdKey];
        [defaults setBool:_autoLoginSwitch.isOn forKey:YZAutoLoginKey];
        [defaults setObject:_pwdField.text forKey:YZPwdKey];
        
        // 同步
        [defaults synchronize];
        
        // 显示遮盖
        [MBProgressHUD showMessage:@"正在登录中"];
        
        // 模拟网络请求
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

            // 移除遮盖
            [MBProgressHUD hideHUD];
            
            // 跳转到目的控制器
            [self performSegueWithIdentifier:@"login2contacts" sender:nil];
            
        });
    }else
    {
        
        [MBProgressHUD showError:@"账号或者密码错误"];

    }
}

/**
 *  在执行segue后，跳转之前调用这个方法。
    一般在这里给下一个控制器传递数据
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    NSLog(@"%@  %@   %@ ",segue.identifier,segue.sourceViewController,segue.destinationViewController);
    // 取出目标控制器
    UIViewController *vc = segue.destinationViewController;
    
    // 设置标题
    vc.title = [NSString stringWithFormat:@"%@的联系人列表",self.accountField.text];
    // vc.title = vc.navigationItem.title
//    vc.navigationItem.title = [NSString stringWithFormat:@"%@的联系人列表",self.accountField.text];
    
}

// 当记住密码开关的状态改变的时候调用
- (IBAction)rmbPwdChange:(id)sender {
    if (_rmbPwdSwitch.isOn == NO) {
        [_autoLoginSwitch setOn:NO animated:YES];

    }
    
}

// 当自动登录开关的状态改变的时候调用
- (IBAction)autoLoginChange:(id)sender {
    if (_autoLoginSwitch.isOn == YES) {
        [_rmbPwdSwitch setOn:YES animated:YES];

    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // 监听两个文本框文字的改变
    [_accountField addTarget:self action:@selector(testChange) forControlEvents:UIControlEventEditingChanged];
    [_pwdField addTarget:self action:@selector(testChange) forControlEvents:UIControlEventEditingChanged];
    
    
    // 读取数据
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _accountField.text = [defaults objectForKey:YZAccountKey];
    _rmbPwdSwitch.on = [defaults boolForKey:YZRmbPwdKey];
    _autoLoginSwitch.on = [defaults boolForKey:YZAutoLoginKey];
    
    if (_rmbPwdSwitch.isOn) { // 勾选记住密码
        
        _pwdField.text = [defaults objectForKey:YZPwdKey];
    }
    
    if (_autoLoginSwitch.isOn) { // 勾选自动登录
        [self login:nil];
    }
    
    [self testChange];

}
- (void)testChange
{
    _loginBtn.enabled = _accountField.text.length && _pwdField.text.length;

}



@end
