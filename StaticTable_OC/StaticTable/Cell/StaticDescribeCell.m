//
//  StaticDescribeCell.m
//  FlowTableView_OC
//
//  Created by tanson on 16/10/4.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticDescribeCell.h"
#import "StaticTableUtils.h"

#define DES_TO_LEFT 15
#define DES_TO_RIGHT 15
#define DES_TO_BOTTOM 5

@interface StaticDescribeCell ()

@property (nonatomic,copy) NSString * text;
@property (nonatomic,strong) UILabel * desLab;
@end

@implementation StaticDescribeCell

-(instancetype) initWithText:(NSString*)text{
    if([super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil]){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _text = text;
        [self setupLab];
    }
    return self;
}

-(UILabel *)desLab{
    if(!_desLab){
        _desLab = [UILabel new];
        _desLab.font = [UIFont systemFontOfSize:13];
        _desLab.textColor = [UIColor lightGrayColor];
        _desLab.translatesAutoresizingMaskIntoConstraints = NO;
        _desLab.numberOfLines = 0;
        _desLab.text = self.text;
    }
    return _desLab;
}

-(void) setupLab{
    
    [self.contentView addSubview:self.desLab];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.desLab
                                                                 attribute:NSLayoutAttributeLeft
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeLeft
                                                                multiplier:1
                                                                  constant:DES_TO_LEFT]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.desLab
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1
                                                                  constant:0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.desLab
                                                                 attribute:NSLayoutAttributeRight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeRight
                                                                multiplier:1
                                                                  constant:-DES_TO_RIGHT]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.desLab
                                                                 attribute:NSLayoutAttributeBottom
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.contentView
                                                                 attribute:NSLayoutAttributeBottom
                                                                multiplier:1
                                                                  constant:-DES_TO_BOTTOM]];
}

-(CGFloat)heightForCell{
    CGFloat width = self.frame.size.width - DES_TO_LEFT - DES_TO_RIGHT;
    CGFloat height = [self.desLab.text StaticTable_heightForFont:self.desLab.font width:width];
    return height + 8;
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
}

@end
