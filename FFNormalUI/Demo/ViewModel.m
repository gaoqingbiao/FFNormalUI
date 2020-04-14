//
//  ViewModel.m
//  FFTableView
//
//  Created by HT on 2020/4/14.
//  Copyright © 2020 GF. All rights reserved.
//

#import "ViewModel.h"
#import "ListModel.h"
#import "DemoCell.h"

@implementation ViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cellClass = [DemoCell class];
        
        ListModel *list1 = [ListModel new];
        list1.text = @"list1";
        ListModel *list2 = [ListModel new];
        list2.text = @"list2";
        ListModel *list3 = [ListModel new];
        list3.text = @"list3";
        self.dataSurece = @[@[list1 ,list2 , list3]].mutableCopy;
    }
    return self;
}


@end
