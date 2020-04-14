//
//  BaesViewModel.h
//  FFTableView
//
//  Created by HT on 2020/4/14.
//  Copyright © 2020 GF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewModel : NSObject

@property (nonatomic ,assign) BOOL isReuse;         // 是否复用单元格

@property (nonatomic ,assign) BOOL isNib;         // 是否是nib

@property (nonatomic ,assign) BOOL isEdit;          // 单元格是否可以编辑

@property (nonatomic ,strong) NSMutableArray *dataSurece;

@property (nonatomic ,strong) Class cellClass;  // cell类

@property (nonatomic ,strong) BaseModel *baseModel;




@end

NS_ASSUME_NONNULL_END
