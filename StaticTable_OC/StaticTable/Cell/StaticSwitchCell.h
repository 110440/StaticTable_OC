//
//  StaticSwitchCell.h
//  FlowTableView_OC
//
//  Created by tanson on 16/9/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticBaseCell.h"

typedef void (^StaticSwitchCellChange)(BOOL on);

@interface StaticSwitchCell : StaticBaseCell

@property(nonatomic,copy) StaticSwitchCellChange valueChangeAction;
@property (nonatomic,assign) BOOL on;

-(instancetype) initWithTitle:(NSString*)title;

@end
