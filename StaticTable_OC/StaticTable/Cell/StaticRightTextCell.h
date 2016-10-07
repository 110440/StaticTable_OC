//
//  StaticRightTextCell.h
//  FlowTableView_OC
//
//  Created by tanson on 16/9/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticBaseCell.h"

@interface StaticRightTextCell : StaticBaseCell

@property (nonatomic,copy) NSString * rightText;

-(instancetype)initWithTitle:(NSString*)title rightText:(NSString*)text;

@end
