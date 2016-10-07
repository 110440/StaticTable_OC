//
//  StaticRightTextCell.m
//  FlowTableView_OC
//
//  Created by tanson on 16/9/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticRightTextCell.h"

@implementation StaticRightTextCell

-(instancetype)initWithTitle:(NSString*)title rightText:(NSString*)text{
    if([super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil]){
        self.textLabel.text = title;
        self.detailTextLabel.text = text;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

-(NSString *)rightText{
    return self.detailTextLabel.text;
}

-(void)setRightText:(NSString *)rightText{
    self.detailTextLabel.text = rightText;
}

@end
