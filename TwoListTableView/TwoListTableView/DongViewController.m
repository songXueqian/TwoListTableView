//
//  DongViewController.m
//  TwoListTableView
//
//  Created by 宋学谦 on 16/8/30.
//  Copyright © 2016年 宋学谦. All rights reserved.
//

#import "DongViewController.h"
#import "TableViewCell.h"
#import "TableViewCellViewController.h"

@interface DongViewController ()

@end

@implementation DongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Dong";
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatView];
    [self initData];

}

- (void)initData{
    NSString *string = @"12947819487192348719347129843712984719283471982347912847";
    NSString *string2 = @"biChi昊biChi付biChi鹏biChi帆biChi桶";
    NSString *string3 = @"鸡肉鸡肉鸡肉鸡肉鸡肉鸡肉鸡肉鸡肉鸡肉鸡肉鸡肉鸡肉鸡肉鸡肉鸡肉鸡肉鸡肉鸡肉鸡肉";
    NSString *string4 = @"DotaLOLWar3NBA2Konling@CSGOFIFAonling3暗黑破坏神2拳皇9守望先峰星际争霸";
    NSString *string5 = @"asdlkfjalsdkfjlasdfkjalsdkfjalsdkjfowieruqeowruqweojfsldajflasdjfasldjflaskjflsdkjflaskdfjl";

    self.dataArray = [NSMutableArray arrayWithObjects:string, string2, string3, string4, string5, nil];
    
    self.dataArray2 = [NSMutableArray array];
    
    for (NSString *string in self.dataArray) {
        CGRect rect = [string boundingRectWithSize:CGSizeMake(Main_Screen_Width, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
        NSLog(@"rect ===== %ld", (long)rect.size.height);
        [self.dataArray2 addObject:[NSString stringWithFormat:@"%f", rect.size.height]];
    }
    
    
}

- (void)creatView{

    
//    for (int i = 0; i < 6; i++) {
//        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(((Main_Screen_Width - 40) / 3 + 10) * (i % 3) + 10, 20 + ((Main_Screen_Width - 40) / 3 + 10) * (i / 3), (Main_Screen_Width - 40) / 3, (Main_Screen_Width - 40) / 3)];
//        imageView.backgroundColor = [UIColor redColor];
//
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"service_kaixin" ofType:@"png"];
//        imageView.image = [UIImage imageWithContentsOfFile:path];
//        
//        imageView.userInteractionEnabled = YES;
//        [self.view addSubview:imageView];
//        imageView.tag = i;
//        UILongPressGestureRecognizer *longTap = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
//        longTap.minimumPressDuration = 1.0;
//        [imageView addGestureRecognizer:longTap];
//    }
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height - 64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.tableView];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.dataArray count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return [[self.dataArray2 objectAtIndex:indexPath.row] floatValue];

    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *Identifier = @"Identifier";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    if (indexPath.row == 1) {
        cell.label.backgroundColor = [UIColor yellowColor];
    }
    cell.label.text = [self.dataArray objectAtIndex:indexPath.row];
    
    //获取界面上能显示出来了cell
    [self.tableView visibleCells];
    
    cell.backgroundColor = [UIColor greenColor];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCellViewController *cellVC = [[TableViewCellViewController alloc] init];
    [self.navigationController pushViewController:cellVC animated:YES];
}



- (void)longPress:(UILongPressGestureRecognizer*)longPress{
    
    UIImageView *ab = [(UIImageView *)self.view viewWithTag:longPress.view.tag];
    

    
    if (longPress.state == UIGestureRecognizerStateBegan) {
        
        NSLog(@"%@", ab);
//        CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
//        anim.keyPath = @"transform.rotation";
//        anim.values = @[@(angelToRandian(-7)),@(angelToRandian(7)),@(angelToRandian(-7))];
//        anim.repeatCount = MAXFLOAT;
//        anim.duration = 0.2;
//        [ab.layer addAnimation:anim forKey:nil];
    }
    
    
}

//在任何方式触发 contentOffset 变化的时候都会被调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
     NSLog(@"2");
}


//用户开始拖动 scroll view 的时候被调用(拖)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
     NSLog(@"1");
}


//用户将要结束拖动 scroll view 的时候被调用
//若 Velocity 为CGPointZero（结束拖动时两个方向都没有速度）时，didEndDragging 中的 decelerate 为 NO，即没有减速过程，willBeginDecelerating 和 didEndDecelerating 也就不会被调用
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSLog(@"3");
}



//用户已经结束拖动 scroll view 的时候被调用
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
     NSLog(@"4");
}

//减速动画开始前被调用(减速)
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
     NSLog(@"5");
}


//减速动画已经结束的时候被调用(减速)
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
     NSLog(@"6");
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
