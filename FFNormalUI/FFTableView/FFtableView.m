//
//  FFtableView.m
//  FFTableView
//
//  Created by HT on 2020/4/14.
//  Copyright © 2020 GF. All rights reserved.
//

#import "FFtableView.h"
#import "BaseTableViewCell.h"

@interface FFtableView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation FFtableView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tableView];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return [self.viewModel.dataSurece count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self.viewModel.dataSurece[section] isKindOfClass:[NSArray class]]) {
        return [self.viewModel.dataSurece[section] count];
    } else {
        return [self.viewModel.dataSurece count];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseModel *baseModel = [self viewModelForRowIndexPath:indexPath];
    if (baseModel) {
        return baseModel.rowHeight;
    }
    return 0.001f;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.viewModel.isEdit;
}



- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseModel *baseModel = [self viewModelForRowIndexPath:indexPath];
    if (self.delegate && [self.delegate respondsToSelector:@selector(editActionsForRowBasModel:indexPath:)]) {
           return [self.delegate editActionsForRowBasModel:baseModel indexPath:indexPath];
    }
    return nil;
}

- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseModel *baseModel = [self viewModelForRowIndexPath:indexPath];
    if (self.delegate && [self.delegate respondsToSelector:@selector(trailingSwipeActionsConfigurationForRowBasModel:indexPath:)]) {
           return [self.delegate trailingSwipeActionsConfigurationForRowBasModel:baseModel indexPath:indexPath];
    }
    return nil;
    
//    if (@available(ios 11.0, *)) {
//
//     NSString *title = @"置顶";
//     if (indexPath.section == 0) {
//      title = @"取消置顶";
//     } else {
//      title = @"置顶";
//     }
//        UIContextualAction *topaction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:title handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
//            // 这句很重要，退出编辑模式，隐藏左滑菜单
//            [tableView setEditing:NO animated:YES];
//            completionHandler(true);
//        }];
//        UIContextualAction *topaction1 = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:@"删除" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
//            // 这句很重要，退出编辑模式，隐藏左滑菜单
//            [tableView setEditing:NO animated:YES];
//            completionHandler(true);
//        }];
//
//     UISwipeActionsConfiguration *actions = [UISwipeActionsConfiguration configurationWithActions:@[topaction,topaction1]];
//     // 禁止侧滑无线拉伸
//     actions.performsFirstActionWithFullSwipe = NO;
//     return actions;
//    }else{
//     return nil;
//    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectRowForBasModel:indexPath:)]) {
        [self.delegate didSelectRowForBasModel:[self viewModelForRowIndexPath:indexPath] indexPath:indexPath];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1. 不同单元格 使用不同的样式
    // 2. 不同单元格使用相同的样式
    BaseTableViewCell *cell = nil;
    NSString *ident = [self identifier];
    if (self.delegate && [self.delegate respondsToSelector:@selector(registerCellForRowAtIndexPath:)]) {
        BaseViewModel *baseViewModel = [self.delegate registerCellForRowAtIndexPath:indexPath];
        cell = [self registerCellWithViewModel:baseViewModel ForRowAtIndexPath:indexPath];
    } else if (self.viewModel.cellClass) {
        // class
        cell = [tableView dequeueReusableCellWithIdentifier:ident];
        if (!cell) {
            cell = (BaseTableViewCell *) [(UITableViewCell *)[self.viewModel.cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
        }
    }
    BaseModel *baseModel = [self viewModelForRowIndexPath:indexPath];
    [cell setData:baseModel indexPath:indexPath];
    return cell;
}

- (BaseTableViewCell *)registerCellWithViewModel:(BaseViewModel *)viewModel ForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseTableViewCell *cell = nil;
    NSString *ident = [self identifier];
    if (viewModel.isNib) {
        [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass(viewModel.cellClass) bundle:nil] forCellReuseIdentifier:ident];
    } else {
        [self.tableView registerClass:viewModel.cellClass forCellReuseIdentifier:ident];
    }
    cell = [self.tableView dequeueReusableCellWithIdentifier:ident];
    return cell;
}

-(BaseModel *)viewModelForRowIndexPath:(NSIndexPath *)indexPath
{
    BaseModel *baseModel = nil;
    if ([self.viewModel.dataSurece[indexPath.section] isKindOfClass:[NSArray class]]) {
       baseModel = self.viewModel.dataSurece[indexPath.section][indexPath.row];
    } else {
       baseModel = self.viewModel.dataSurece[indexPath.row];
    }
    return baseModel;
}

- (NSString *)identifier
{
    if (self.viewModel.isReuse) {
        // 如果是复用
        return NSStringFromClass(self.viewModel.cellClass);
    } else {
        // 如果不复用
        return [NSString stringWithFormat:@"K%@%@",[self getCurrentTimestamp],NSStringFromClass(self.viewModel.cellClass)];
    }
}

// 获取当前时间戳
- (NSString *)getCurrentTimestamp {
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0]; // 获取当前时间0秒后的时间
    NSTimeInterval time = [date timeIntervalSince1970]*1000;// *1000 是精确到毫秒(13位),不乘就是精确到秒(10位)
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}


- (void)setViewModel:(BaseViewModel *)viewModel
{
    _viewModel = viewModel;
    [self.tableView reloadData];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
        _tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delaysContentTouches = NO;
        _tableView.tableFooterView = [UIView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}



@end
