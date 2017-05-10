//
//  HMLoginViewController.m
//  私人通讯录
//
//  Created by yz on 14-8-29.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "HMLoginViewController.h"

@interface HMLoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation HMLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 1.代理
//    _accountField.delegate = self;
    
    // 2.通知
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:_accountField];
    
    // 3.addTarget
    [_accountField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_pwdField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)textChange
{
    // 判断两个文本框的内容
//    if (_accountField.text.length && _pwdField.text.length) { // 两个都有值
//        _loginBtn.enabled = YES;
//    }else{
//        _loginBtn.enabled = NO;
//    }
    
    _loginBtn.enabled = _accountField.text.length && _pwdField.text.length;
    
    NSLog(@"%@",_accountField.text);
}
// 当用户开始编辑一个文本框的时候，首先会调用这个，看是否允许编辑这个文本框
//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
//    return NO;
//}

// 当用户结束编辑一个文本框的时候，首先会调用这个，看是否允许结束编辑这个文本框
//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
//{
//    return NO;
//}
// 当用户输入文字之前，会调用这个方法，判断是否允许把这个文字输入到文本框上面
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    NSLog(@"shouldChangeCharactersInRange--%@",textField.text);
//    return YES;
//}

/*
 // 是否允许编辑
 - (BOOL)textFieldShouldBeginEditing:(UITextField *)textField; 
 //
 - (void)textFieldDidBeginEditing:(UITextField *)textField;           // became first responder
 // 是否允许结束编辑
 - (BOOL)textFieldShouldEndEditing:(UITextField *)textField;          // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
 - (void)textFieldDidEndEditing:(UITextField *)textField;             // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
 // 是否允许用户输入文件
 - (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;   // return NO to not change text
 
 - (BOOL)textFieldShouldClear:(UITextField *)textField;
 
 
 
 */
@end
