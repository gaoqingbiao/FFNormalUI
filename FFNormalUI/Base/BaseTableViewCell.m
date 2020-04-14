//
//  BaseTableViewCell.m
//  FFTableView
//
//  Created by HT on 2020/4/14.
//  Copyright © 2020 GF. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setData:(BaseModel *)model indexPath:(NSIndexPath *)indexPath{};

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
