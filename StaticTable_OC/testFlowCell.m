//
//  testFlowCell.m
//  FlowTableView_OC
//
//  Created by tanson on 16/9/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "testFlowCell.h"

@implementation testFlowCell

-(void)awakeFromNib{
    [super awakeFromNib];
}

-(instancetype)initWithFrame:(CGRect)frame{
    if([super initWithFrame:frame]){
        self.textLabel.text = @"testFlow";
    }
    return self;
}

-(CGFloat)heightForCell{
    return 60;
}
@end
