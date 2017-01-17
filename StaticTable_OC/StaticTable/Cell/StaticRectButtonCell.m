//
//  StaticRectButtonCell.m
//  ZhiBo
//
//  Created by tanson on 2016/12/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticRectButtonCell.h"
#import "StaticTableUtils.h"

@interface StaticRectButtonCell ()

@end


@implementation StaticRectButtonCell

-(instancetype)initWithTitle:(NSString*)title{
    if([super initWithFrame:CGRectZero]){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.button];
        [self.button setTitle:title forState:UIControlStateNormal];
    }
    return self;
}

-(UIButton *)button{
    if(!_button){
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
        [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _button;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGRect frame = self.bounds;
    frame.origin.x +=15;
    frame.size.width -= 15*2;
    self.button.frame = frame;
}

-(void)setNormalColor:(UIColor*)color{
    UIImage * img = [UIImage StaticTable_imageWithColor:color];
    [self.button setBackgroundImage:img forState:UIControlStateNormal];
}
-(void)setTitileColor:(UIColor *)color{
    [self.button setTitleColor:color forState:UIControlStateNormal];
}

-(void)onClick{
    self.clickBlock? self.clickBlock():nil;
}

@end
