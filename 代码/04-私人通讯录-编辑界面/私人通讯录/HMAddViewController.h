//
//  HMAddViewController.h
//  私人通讯录
//
//  Created by yz on 14-8-29.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HMContactsTableViewController.h"

@class HMAddViewController,HMContact;
@protocol HMAddViewControllerDelgegate <NSObject>

@optional
- (void)addViewController:(HMAddViewController *)add didAddContact:(HMContact *)contact;

@end


@interface HMAddViewController : UIViewController

@property (nonatomic, strong) HMContactsTableViewController *contacts;

@property (nonatomic, weak) id<HMAddViewControllerDelgegate> delegate;

@end
