//
//  HMContactsTableViewController.m
//  私人通讯录
//
//  Created by yz on 14-8-29.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "HMContactsTableViewController.h"
#import "HMAddViewController.h"

#import "HMEditViewController.h"

#import "HMContactCell.h"


#import "HMContact.h"
@interface HMContactsTableViewController ()<UIActionSheetDelegate,HMAddViewControllerDelgegate,HMEditViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *contacts;

@end

@implementation HMContactsTableViewController

#warning 第五步操作
#pragma mark - 注销功能
// 点击注销就会调用这个方法
- (IBAction)logout:(id)sender {
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"是否注销？" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注销" otherButtonTitles:nil, nil];
    
    
    [sheet showInView:self.view];
    
    
}



- (NSMutableArray *)contacts
{
    if (_contacts == nil) {
        _contacts = [NSMutableArray array];
    }
    return _contacts;
}

- (void)setName:(NSString *)name phone:(NSString *)phone
{
    NSLog(@"%@---%@",name,phone);
}


/**
 *   跳转之前，调用这个方法
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%@",segue.destinationViewController);
    
    
    if ([segue.destinationViewController isKindOfClass:[HMAddViewController class]]) {
        
        HMAddViewController *vc = segue.destinationViewController;
        
        vc.delegate = self;
    }else{ // 跳转到编辑控制器
        HMEditViewController *edit = segue.destinationViewController;
        
        NSIndexPath *seletedIndex = [self.tableView indexPathForSelectedRow];
        
        edit.delegate = self;
        edit.contact = self.contacts[seletedIndex.row];
        
    }
    
}

// 成功更新了一个联系人的时候调用
- (void)editViewController:(HMEditViewController *)edit didUpdateContact:(HMContact *)contact
{
    
    // 刷新表格
    [self.tableView reloadData];
}

// 成功添加了一个联系人的时候调用
- (void)addViewController:(HMAddViewController *)add didAddContact:(HMContact *)contact
{
    // 保存
    [self.contacts addObject:contact];
    
    // 刷新表格
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // 移除分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.contacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 1.创建对象
    HMContactCell *cell = [HMContactCell cellWithTableView:tableView];
    
    // 2.传递模型
    cell.contact = self.contacts[indexPath.row];
    
    return cell;
}




- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex) return;
    
    // 回到登录界面
    [self.navigationController popViewControllerAnimated:YES];
}

@end
