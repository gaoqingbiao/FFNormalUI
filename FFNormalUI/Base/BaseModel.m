//
//  BaseModel.m
//  FFTableView
//
//  Created by HT on 2020/4/14.
//  Copyright © 2020 GF. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self data];
    }
    return self;
}
- (void)data
{
    self.rowHeight = 60.0f;
    self.footerViewHeight = 0.00001f;
    self.headerViewHeight = 0.00001f;
    
}

@end
