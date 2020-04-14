//
//  BaseModel.h
//  FFTableView
//
//  Created by HT on 2020/4/14.
//  Copyright © 2020 GF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface BaseModel : NSObject

@property (nonatomic ,assign) CGFloat rowHeight;
@property (nonatomic ,assign) CGFloat footerViewHeight;
@property (nonatomic ,assign) CGFloat headerViewHeight;

@end

NS_ASSUME_NONNULL_END
