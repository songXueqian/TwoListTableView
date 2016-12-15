//
//  MainViewController.m
//  TwoListTableView
//
//  Created by 宋学谦 on 16/8/29.
//  Copyright © 2016年 宋学谦. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"MainView";
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
    [self.view addSubview:self.tableView];
    
    
    self.childViewController = [[ChildViewController alloc] init];
    [self addChildViewController:self.childViewController];
    
    [self.view addSubview:self.childViewController.view];
    [self.childViewController.view setFrame:CGRectMake(self.tableView.frame.origin.x + self.tableView.frame.size.width, self.tableView.frame.origin.y, [UIScreen mainScreen].bounds.size.width - self.tableView.frame.size.width, self.tableView.frame.size.height)];
        
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.f;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
        [self.childViewController.tableView scrollToRowAtIndexPath:scrollIndexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        
    } else {
        
    }
    
}


- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.tableView) {
        
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:0]];
        cell.textLabel.textColor = [UIColor blackColor];
        
    } else {
        
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
