//
//  CellTableViewCell.m
//  TwoListTableView
//
//  Created by 宋学谦 on 16/9/1.
//  Copyright © 2016年 宋学谦. All rights reserved.
//

#import "CellTableViewCell.h"

@implementation CellTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        self.image = [[UIImageView alloc] init];
        self.image.userInteractionEnabled = YES;
        [self addSubview:self.image];
        
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
    
    [self.image setFrame:CGRectMake(5, 5, 20, 20)];

    [self.label setFrame:CGRectMake(25, 5, 150, 20)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
