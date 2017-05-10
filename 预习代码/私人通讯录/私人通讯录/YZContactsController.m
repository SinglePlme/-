//
//  YZContactsController.m
//  私人通讯录
//
//  Created by yz on 14-8-22.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "YZContactsController.h"
#import "YZAddViewController.h"
#import "YZEditViewController.h"

#import "YZContacts.h"

#import "YZContactsCell.h"

#define YZFilePath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"contacts.data"]

@interface YZContactsController ()<UIActionSheetDelegate,YZAddViewControllerDelegate,YZEditViewControllerDelgegate>
@property (nonatomic, strong) NSMutableArray *contacts;
@end

@implementation YZContactsController

- (NSMutableArray *)contacts
{
    if (_contacts == nil) {
        
        _contacts = [NSKeyedUnarchiver unarchiveObjectWithFile:YZFilePath];
        
        // 从文件中读取可能为空
        if (_contacts == nil) {
            _contacts = [NSMutableArray array];
        }
        
    }
    
    return _contacts;
}


/**
 *  跳转之前调用
 *
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.destinationViewController isKindOfClass:[YZAddViewController class]]) {
        YZAddViewController *addVc = segue.destinationViewController;
        
        addVc.delegate = self;

    }else if ([segue.destinationViewController isKindOfClass:[YZEditViewController class]]){
        
        // 获取选中cell的indexPath
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        // 取出模型
        YZContacts *contact = _contacts[indexPath.row];
        
        // 获取目的控制器
        YZEditViewController *edit = segue.destinationViewController;
        
        // 设置代理
        edit.delegate = self;
        
        edit.contact = contact;
    
    }
    
}

#pragma mark - YZEditViewControllerDelegate的代理方法
// // 成功更新一个联系人就会调用
- (void)editViewController:(YZEditViewController *)editController didSaveContact:(YZContacts *)contacts
{
    // 刷新表格
    [self.tableView reloadData];
    
    // 归档
    [NSKeyedArchiver archiveRootObject:_contacts toFile:YZFilePath];
    
}

#pragma mark - YZAddViewControllerDelegate的代理方法
// 成功添加一个联系人就会调用
- (void)addViewController:(YZAddViewController *)add didAddContact:(YZContacts *)contact
{
    // 1.添加数据
    [self.contacts addObject:contact];
    
    // 2.刷新表格
    [self.tableView reloadData];

    // 3.归档
    [NSKeyedArchiver archiveRootObject:_contacts toFile:YZFilePath];
}

#pragma mark 撤销
- (IBAction)logout:(id)sender {
    
    // destructiveButtonTitle一般放一些比较危险的操作
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"确定要注销？" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"注销" otherButtonTitles:nil, nil];
    
    [sheet showInView:self.view];
}

#pragma mark - UIActionSheet代理方法
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex) return;
    
    // 监听注销按钮
        [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 取消分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 创建cell
    YZContactsCell *cell = [YZContactsCell cellWithTableView:tableView];
    
    // 设置模型
    YZContacts *contact = _contacts[indexPath.row];
    cell.contact = contact;
    
    
    return cell;
    
}

#pragma mark - tableView delegate
/**
 *  只要实现了这个方法，就自动实现了滑动删除功能
 *  只要提交一个编辑操作就会调用这个方法,也就是点击删除按钮才会调用，滑动的时候不会调用
 *  @param editingStyle 编辑样式(删除/添加) 默认是删除
 *  @param indexPath    操作的那一行
 */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSLog(@"%d",indexPath.row);
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // 删除这一行模型
        [_contacts removeObjectAtIndex:indexPath.row];
        
        // 刷新表格
//        [self.tableView reloadData];
        // 这个是指定刷新那一行cell，并不会删除一行cell，不是我们需要的。
//        self.tableView reloadRowsAtIndexPaths:<#(NSArray *)#> withRowAnimation:<#(UITableViewRowAnimation)#>
        
        // 这个方法必须注意，cell的总数必须和模型数组里的个数保持一致
        // 指定tableView删除哪一行，不会调用返回每一行cell的方法，优化了性能。
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
        
        // 归档
        [NSKeyedArchiver archiveRootObject:_contacts toFile:YZFilePath];
    }
    
}



@end
