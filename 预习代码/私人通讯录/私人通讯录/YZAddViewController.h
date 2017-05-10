//
//  YZAddViewController.h
//  私人通讯录
//
//  Created by yz on 14-8-22.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YZContactsController.h"
@class YZAddViewController,YZContacts;
@protocol YZAddViewControllerDelegate <NSObject>

@optional
- (void)addViewController:(YZAddViewController *)add didAddContact:(YZContacts *)contact;

@end

@interface YZAddViewController : UIViewController

@property (nonatomic, weak) id<YZAddViewControllerDelegate> delegate;

@end
