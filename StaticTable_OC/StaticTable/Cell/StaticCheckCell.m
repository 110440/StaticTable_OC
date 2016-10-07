
//
//  StaticCheckCell.m
//  FlowTableView_OC
//
//  Created by tanson on 16/9/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticCheckCell.h"

@interface StaticCheckCell ()

@end

@implementation StaticCheckCell

-(instancetype)initWithFrame:(CGRect)frame{
    if([super initWithFrame:frame]){
        self.accessoryType = UITableViewCellAccessoryNone;
    }
    return self;
}

-(BOOL)on{
    return self.accessoryType == UITableViewCellAccessoryCheckmark;
}

-(void)setOn:(BOOL)on{
    if(on){
        self.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        self.accessoryType = UITableViewCellAccessoryNone;
    }
}

-(void)cellDidSelect{
    [super cellDidSelect];
    [self setOn:!self.on];
    self.valueChangeAction? self.valueChangeAction(self):nil;
}

@end
