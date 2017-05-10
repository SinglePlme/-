//
//  HMContactsTableViewController.m
//  私人通讯录
//
//  Created by yz on 14-8-29.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "HMContactsTableViewController.h"
#import "HMAddViewController.h"

#import "HMContact.h"
@interface HMContactsTableViewController ()<UIActionSheetDelegate,HMAddViewControllerDelgegate>

@property (nonatomic, strong) NSMutableArray *contacts;

@end

@implementation HMContactsTableViewController


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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%@",segue.destinationViewController);
    
    HMAddViewController *vc = segue.destinationViewController;
    
    vc.delegate = self;
    
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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.contacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *ID = @"contact";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    
    HMContact *contact = self.contacts[indexPath.row];
    // 给cell的控件赋值
    cell.textLabel.text = contact.name;
    cell.detailTextLabel.text = contact.phone;
    
    // Configure the cell...
    
    return cell;
}




#pragma mark - 注销功能
// 点击注销就会调用这个方法
- (IBAction)logout:(id)sender {
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"是否注销？" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注销" otherButtonTitles:nil, nil];
    
    
    
    [sheet showInView:self.view];
    
    
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex) return;
    
    // 回到登录界面
    [self.navigationController popViewControllerAnimated:YES];
}

@end
