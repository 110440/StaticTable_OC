//
//  StaticEmptyCell.m
//  FlowTableView_OC
//
//  Created by tanson on 16/10/1.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticEmptyCell.h"

@implementation StaticEmptyCell


-(instancetype)initWithFrame:(CGRect)frame{
    if([super initWithFrame:frame]){
        
        [self setHidden:YES];
        self.highlighted = YES;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(CGFloat)heightForCell{
    return 0.01;
}

@end
