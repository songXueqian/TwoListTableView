//
//  TableViewCellViewController.h
//  TwoListTableView
//
//  Created by 宋学谦 on 16/9/1.
//  Copyright © 2016年 宋学谦. All rights reserved.
//

#import <UIKit/UIKit.h>
//当前屏幕高宽度
#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width

@interface TableViewCellViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *dataArray;
@property (nonatomic, assign)BOOL userDragging;
@property (nonatomic, strong) NSValue *targetRect;

@end
