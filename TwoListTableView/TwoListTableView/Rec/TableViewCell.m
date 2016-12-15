//
//  TableViewCell.m
//  TwoListTableView
//
//  Created by 宋学谦 on 16/8/31.
//  Copyright © 2016年 宋学谦. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        

        self.label = [[UILabel alloc] init];
        self.label.font = [UIFont systemFontOfSize:15];
        self.label.textColor = [UIColor blackColor];
        [self addSubview:self.label];
        
        
    }
    return self;
    
    
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    [self.label setFrame:CGRectMake(0, 0, Main_Screen_Width, 20)];
    self.label.numberOfLines = 0;
    [self.label sizeToFit];
    
    if (self.label.frame.size.height <= 30) {
        [self.label setFrame:CGRectMake(0, -3, Main_Screen_Width, 20)];
    }

    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
