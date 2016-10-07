//
//  StaticRightTextSelectCell.h
//  FlowTableView_OC
//
//  Created by tanson on 16/10/1.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticRightTextCell.h"

typedef void (^StaticSelectComplateHandel)(NSString * itemStr);

@interface StaticRightTextSelectCell : StaticRightTextCell

@property (nonatomic,copy)StaticSelectComplateHandel selectComplateAction;

-(instancetype) initWithSelectItems:(NSArray*)items title:(NSString*)title selectedIdx:(NSInteger)idx;

@end
