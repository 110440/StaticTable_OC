//
//  StaticInputPhoneVerCodeCell.m
//  ZhiBo
//
//  Created by tanson on 2016/12/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticInputPhoneVerCodeCell.h"


@implementation StaticInputPhoneVerCodeCell

-(instancetype)initWithTitle:(NSString *)title placeholder:(NSString *)placeholder{
    if([super initWithTitle:title placeholder:placeholder]){
        self.accessoryView = self.button;
        [self setInputOffsetX:15];
    }
    return self;
}

-(UIButton *)button{
    if(!_button){
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_button sizeToFit];
        [_button.titleLabel setFont:[UIFont systemFontOfSize:13]];
        [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [_button addTarget:self action:@selector(onButton) forControlEvents:UIControlEventTouchUpInside];
        _button.layer.borderColor = [UIColor blackColor].CGColor;
        _button.layer.cornerRadius = 3;
        _button.layer.borderWidth = 1;
        _button.clipsToBounds = YES;
    }
    return _button;
}

-(void)onButton{
    [self.button StaticTable_countDownWithTime:30 title:@"重发"];
    self.buttonClick? self.buttonClick():nil;
}

-(void) setButtonTinColor:(UIColor*)c{
    self.button.layer.borderColor = c.CGColor;
    [self.button setTitleColor:c forState:UIControlStateNormal];
}
@end
