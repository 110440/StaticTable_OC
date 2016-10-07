//
//  StaticButtonCell.m
//  FlowTableView_OC
//
//  Created by tanson on 16/9/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticButtonCell.h"
#import "StaticTableUtils.h"

@interface StaticButtonCell ()
@property (nonatomic,strong) UIColor * colorNormal;
@property (nonatomic,strong) UIColor * colorHlighted;
@end

@implementation StaticButtonCell

-(instancetype) initWithButtonTitle:(NSString*)title{
    if([super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil]){
        
        self.textLabel.text = title;
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self setHighlightedColor:[[UIColor lightGrayColor] colorWithAlphaComponent:0.5]];
        [self setNormalColor:[UIColor whiteColor]];
    }
    return self;
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    [super setHighlighted:highlighted animated:animated];
    
    if(highlighted){
        [UIView animateWithDuration:0.15 animations:^{
            self.backgroundColor = self.colorHlighted;
        }];
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            self.backgroundColor = self.colorNormal;
        }];
    }

}

-(void)cellDidSelect{
    [super cellDidSelect];
    self.clickAction? self.clickAction():nil;
}

-(void) setNormalColor:(UIColor*)color{
    self.colorNormal = color;
}
-(void) setHighlightedColor:(UIColor *)color{
    self.colorHlighted = color;
}

-(void) setTitleColor:(UIColor*)color{
    self.textLabel.textColor = color;
}

@end
