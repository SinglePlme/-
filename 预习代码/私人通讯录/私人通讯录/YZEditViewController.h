//
//  YZEditViewController.h
//  私人通讯录
//
//  Created by yz on 14-8-22.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YZContacts,YZEditViewController;

@protocol YZEditViewControllerDelgegate <NSObject>

@optional
- (void)editViewController:(YZEditViewController *)editController didSaveContact:(YZContacts *)contacts;

@end

@interface YZEditViewController : UIViewController

@property (nonatomic, strong) YZContacts *contact;

@property (nonatomic, weak) id<YZEditViewControllerDelgegate> delegate;

@end
