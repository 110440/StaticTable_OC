//
//  StaticRightTextInputCell.h
//  FlowTableView_OC
//
//  Created by tanson on 16/9/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticRightTextCell.h"

typedef void (^StaticInputTextComplate)(NSString * text);

@interface StaticRightTextInputCell : StaticRightTextCell
@property (nonatomic,copy) StaticInputTextComplate inputComplate;

@end
