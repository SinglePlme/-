//
//  HMViewController.m
//  08-自定义对象归档
//
//  Created by yz on 14-8-29.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "HMViewController.h"

#import "HMPerson.h"

@interface HMViewController ()

@end

@implementation HMViewController

- (IBAction)save:(id)sender {
    HMPerson *person = [HMPerson new];
    person.age = 18;
    
    NSString *docPath =  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    // 拼接文件路径
    NSString *filePath = [docPath stringByAppendingPathComponent:@"person.data"];
    
    [NSKeyedArchiver archiveRootObject:person toFile:filePath];
    

}
- (IBAction)read:(id)sender {
    NSString *docPath =  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    
    // 拼接文件路径
    NSString *filePath = [docPath stringByAppendingPathComponent:@"person.data"];
    
    HMPerson *p = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%d",p.age);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
