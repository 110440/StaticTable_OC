//
//  StaticCheckCell.h
//  FlowTableView_OC
//
//  Created by tanson on 16/9/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticBaseCell.h"

@class StaticCheckCell;
typedef void (^StaticCheckCellChange)(StaticCheckCell * cell);

@interface StaticCheckCell : StaticBaseCell

@property (nonatomic,assign) BOOL on;
@property (nonatomic,copy)StaticCheckCellChange valueChangeAction;

@end
