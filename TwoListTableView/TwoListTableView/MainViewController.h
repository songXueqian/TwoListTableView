//
//  MainViewController.h
//  TwoListTableView
//
//  Created by 宋学谦 on 16/8/29.
//  Copyright © 2016年 宋学谦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChildViewController.h"

//当前屏幕高宽度
#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width

@interface MainViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UITableView *tableView2;
@property (nonatomic, strong)NSMutableArray *dataArray;
@property (nonatomic, strong)NSMutableArray *dataArray2;
@property (nonatomic, strong)NSMutableArray *dataArray3;

@property (nonatomic, strong)ChildViewController *childViewController;

@end
