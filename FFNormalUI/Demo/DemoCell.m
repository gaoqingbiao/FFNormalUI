//
//  DemoCell.m
//  FFTableView
//
//  Created by HT on 2020/4/14.
//  Copyright © 2020 GF. All rights reserved.
//

#import "DemoCell.h"
#import "ListModel.h"

@implementation DemoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setData:(ListModel *)model indexPath:(NSIndexPath *)indexPath
{
    self.textLabel.text = model.text;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
