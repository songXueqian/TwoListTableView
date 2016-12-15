//
//  TableViewCellViewController.m
//  TwoListTableView
//
//  Created by 宋学谦 on 16/9/1.
//  Copyright © 2016年 宋学谦. All rights reserved.
//

#import "TableViewCellViewController.h"
#import "CellTableViewCell.h"

@interface TableViewCellViewController ()

@end

@implementation TableViewCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Cell";
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatView];
    [self initData];
}

- (void)creatView{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height - 64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 30.f;
    self.tableView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.tableView];
    
    
}


- (void)initData{
    
    self.dataArray = [NSMutableArray array];
    for (int j = 0; j <= 1000; j++) {
        NSNumber *number = [NSNumber numberWithInt:j];
        [self.dataArray addObject:number];
    }

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.dataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *Identifier = @"Identifier";
    CellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[CellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    
    NSInteger inter = [[self.dataArray objectAtIndex:indexPath.row] integerValue];
    cell.label.text = [NSString stringWithFormat:@"%ld", inter];
    if (indexPath.row % 2) {
        
        
        cell.image.image = [UIImage imageNamed:@"geren_selectd.png"];
    } else {
        cell.image.image = [UIImage imageNamed:@"service_kaixin.png"];
    }
    cell.backgroundColor = [UIColor greenColor];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
    
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
