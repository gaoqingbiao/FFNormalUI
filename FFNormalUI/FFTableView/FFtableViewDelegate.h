//
//  FFtableViewDelegate.h
//  FFTableView
//
//  Created by HT on 2020/4/14.
//  Copyright © 2020 GF. All rights reserved.
//
#import "BaseViewModel.h"
#import "BaseModel.h"

@protocol FFtableViewDelegate <NSObject>


@optional
- (BaseViewModel *)registerCellForRowAtIndexPath:(NSIndexPath *)indexPath;

@optional
- (void)didSelectRowForBasModel:(BaseModel *)baseModel indexPath:(NSIndexPath *)indexPath;

@optional
- (NSArray<UITableViewRowAction *> *)editActionsForRowBasModel:(BaseModel *)baseModel indexPath:(NSIndexPath *)indexPath;

@optional
- (UISwipeActionsConfiguration *)trailingSwipeActionsConfigurationForRowBasModel:(BaseModel *)baseModel indexPath:(NSIndexPath *)indexPath;

@end
