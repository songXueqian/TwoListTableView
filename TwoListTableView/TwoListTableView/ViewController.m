//
//  ViewController.m
//  TwoListTableView
//
//  Created by 宋学谦 on 16/8/29.
//  Copyright © 2016年 宋学谦. All rights reserved.
//


/*
 
1.一个页面两个tableView 点击第一个的cell刷新 第二个tableView(用了两种写法 第一种一个controller中两个tableView 第二种是一个controller里一个tabelView 另一个tableView通过controller的childView创建)
 
2.tableView 分割线左边短20像素问题
 
3.tableView 性能优化 heightForRowAtIndexPath方法里每次都要调用，可以在model(就是从接口拿到数据时)算好每个cell的高度，存入属性或数组，最后在方法里直接返回 
 若整个tableViewCell高度一样，可以在tableView初始化时 self.tableView.rowHeight = 50.f;
 直接写出，避免每次都要调用，因为tableView这个方法有多少个Cell就走多少遍
 
*/

#import "ViewController.h"
#import "MainViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"tableView";
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationController.navigationBar.translucent = NO;
    [self initData];
    [self creatView];
    
}

- (void)initData{
    NSDictionary *dic = [NSDictionary dictionaryWithObject:[NSArray arrayWithObjects:@"苹果", @"香蕉", @"芒果", @"草莓", @"葡萄", @"梨", @"樱桃", @"榴莲", @"桃子", nil] forKey:@"水果"];
    
    NSDictionary *dic2 = [NSDictionary dictionaryWithObject:[NSArray arrayWithObjects:@"biChi昊", @"biChi付", @"biChi鹏", @"biChi帆", @"biChi桶", nil] forKey:@"碧池"];
    
    NSDictionary *dic3 = [NSDictionary dictionaryWithObject:[NSArray arrayWithObjects:@"鸡肉", @"鸭肉", @"牛肉", @"羊肉", @"猪肉", @"狗肉", @"肥肉", nil] forKey:@"肉类"];
    
    NSDictionary *dic4 = [NSDictionary dictionaryWithObject:[NSArray arrayWithObjects:@"Dota", @"LOL", @"War3", @"NBA2K onling", @"CS GO", @"FIFA onling3", @"暗黑破坏神2", @"拳皇97", @"守望先峰", @"星际争霸", nil] forKey:@"游戏"];
    
    NSDictionary *dic5 = [NSDictionary dictionaryWithObject:[NSArray arrayWithObjects:@"假如爱有天意", @"魔兽争霸", @"天行者", @"星际穿越", @"老炮", @"夏洛克烦恼", @"佐罗", @"木乃伊归来", nil] forKey:@"电影"];
    
    NSDictionary *dic6 = [NSDictionary dictionaryWithObject:[NSArray arrayWithObjects:@"Beabea", @"IF YOU", @"爱情废柴", @"七里香", @"翅膀", @"唯一", @"as long as you love me", @"忘情水", @"我只在乎你", @"touch me", nil] forKey:@"歌曲"];
    
    self.dataArray = [NSMutableArray arrayWithObjects:dic, dic2, dic3, dic4, dic5, dic6, nil];
    
    NSArray *key = [dic allKeys];
    NSString *string = [key firstObject];
    
    NSArray *key2 = [dic2 allKeys];
    NSString *string2 = [key2 firstObject];

    
    NSArray *key3 = [dic3 allKeys];
    NSString *string3 = [key3 firstObject];

    
    NSArray *key4 = [dic4 allKeys];
    NSString *string4 = [key4 firstObject];

    NSArray *key5 = [dic5 allKeys];
    NSString *string5 = [key5 firstObject];

    
    NSArray *key6 = [dic6 allKeys];
    NSString *string6 = [key6 firstObject];

    
    self.dataArray2 = [NSMutableArray arrayWithObjects:string, string2, string3, string4, string5, string6, nil];

    self.dataArray3 = [NSMutableArray array];

}

- (void)creatView{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, 100, Main_Screen_Height - 60 - 64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor redColor];
    self.tableView.rowHeight = 50.f;
    [self.view addSubview:self.tableView];
    
    //tableView 分割线左边短20像素问题
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    self.tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(self.tableView.frame.origin.x + self.tableView.frame.size.width, 50, Main_Screen_Width - self.tableView.frame.size.width, Main_Screen_Height - 60 - 64) style:UITableViewStylePlain];
    self.tableView2.delegate = self;
    self.tableView2.dataSource = self;
    self.tableView2.backgroundColor = [UIColor greenColor];
    self.tableView2.rowHeight = 40;
    [self.view addSubview:self.tableView2];
    
    if ([self.tableView2 respondsToSelector:@selector(setSeparatorInset:)])
    {
        [self.tableView2 setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView2 respondsToSelector:@selector(setLayoutMargins:)])
    {
        [self.tableView2 setLayoutMargins:UIEdgeInsetsZero];
    }


    UIView *headerView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, Main_Screen_Width, 44)];
    headerView.backgroundColor = [UIColor orangeColor];
    self.tableView2.tableHeaderView = headerView;
    
    UIView *footView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, Main_Screen_Width, 44)];
    footView.backgroundColor = [UIColor lightGrayColor];
    self.tableView2.tableFooterView = footView;

    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    if (tableView == self.tableView) {

        return 1;
    } else {
        NSLog(@"countSection2 ====== %lu", self.dataArray.count);

        return self.dataArray.count;

    }
    
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView == self.tableView) {
        NSLog(@"countRow ====== %lu", self.dataArray.count);

        return self.dataArray.count;


    } else {
        NSString *string = [self.dataArray2 objectAtIndex:section];
        
        NSLog(@"countRow2 ====== %lu", [[[self.dataArray objectAtIndex:section] objectForKey:string] count]);
        
        return [[[self.dataArray objectAtIndex:section] objectForKey:string] count];
        

    }
}



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (tableView == self.tableView) {
        return nil;
    } else {
        return [NSString stringWithFormat:@"    %@", [self.dataArray2 objectAtIndex:section]];

    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (tableView == self.tableView) {
        static NSString *Identifier = @"Identifier";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        }
        cell.textLabel.text = [self.dataArray2 objectAtIndex:indexPath.row];

        if (indexPath.row == 0) {
            cell.textLabel.textColor = [UIColor orangeColor];
        }
        cell.backgroundColor = [UIColor purpleColor];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        return cell;
        
    } else {
        static NSString *Identifier = @"Iden";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        }
        
        
        NSString *string = [self.dataArray2 objectAtIndex:indexPath.section];
        
        self.dataArray3 = [[self.dataArray objectAtIndex:indexPath.section] objectForKey:string];
        
        
        cell.textLabel.text = [self.dataArray3 objectAtIndex:indexPath.row];
        cell.backgroundColor = [UIColor yellowColor];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        return cell;
        
    }

    
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == self.tableView) {

        UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:0]];
        cell.textLabel.textColor = [UIColor orangeColor];
        
        if (indexPath.row != 0) {
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
            cell.textLabel.textColor = [UIColor blackColor];
            
        }

        
        NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.row];
        [self.tableView2 scrollToRowAtIndexPath:scrollIndexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        
    } else {
        MainViewController *mainVC = [[MainViewController alloc] init];
        [self.navigationController pushViewController:mainVC animated:YES];
    }

}


- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.tableView) {
        
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:0]];
        cell.textLabel.textColor = [UIColor blackColor];
        
    } else {
        
    }

}

//tableView 分割线左边短20像素问题
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
    
}


//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//
//    if (self.tableView2.contentOffset.y == 0) {
//        UITableViewCell   *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
//        cell.textLabel.textColor = [UIColor orangeColor];
//        [self.tableView reloadData];
//    }
//    
//    
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
