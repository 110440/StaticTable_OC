//
//  StaticSwitchCell.m
//  FlowTableView_OC
//
//  Created by tanson on 16/9/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticSwitchCell.h"

@interface StaticSwitchCell ()
@property (nonatomic,strong) UISwitch * switchView;
@end

@implementation StaticSwitchCell

-(instancetype) initWithTitle:(NSString*)title{
    if([super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil]){
        self.accessoryView = self.switchView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.textLabel.text = title;
    }
    return self;
}

-(instancetype)init{
    if([super init]){
        self.accessoryView = self.switchView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if([super initWithFrame:frame]){
        self.accessoryView = self.switchView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(UISwitch *)switchView{
    if(!_switchView){
        _switchView = [[UISwitch alloc] init];
        [_switchView addTarget:self action:@selector(switchChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _switchView;
}

-(void) switchChange:(id)sender{
    self.valueChangeAction? self.valueChangeAction(self.switchView.on):nil;
}

-(BOOL)on{
    return self.switchView.on;
}
-(void)setOn:(BOOL)on{
    [self.switchView setOn:on];
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    [super setHighlighted:highlighted animated:animated];
    self.backgroundColor = [UIColor whiteColor];
}

@end
