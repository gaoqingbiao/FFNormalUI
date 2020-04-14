//
//  FFtableView.h
//  FFTableView
//
//  Created by HT on 2020/4/14.
//  Copyright © 2020 GF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFtableViewDelegate.h"
#import "BaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

//@protocol FFtableViewDelegate <NSObject>
//
//@end

@interface FFtableView : UIView

@property (nonatomic ,strong) UITableView *tableView;
@property(nonatomic ,strong) BaseViewModel *viewModel;
@property(nonatomic ,weak) id<FFtableViewDelegate> delegate;


@end

NS_ASSUME_NONNULL_END
