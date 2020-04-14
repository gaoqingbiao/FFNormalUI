//
//  BaesViewModel.m
//  FFTableView
//
//  Created by HT on 2020/4/14.
//  Copyright © 2020 GF. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel
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
    self.isReuse = NO;
    self.dataSurece = [NSMutableArray arrayWithCapacity:0];
}

@end
