//
//  StaticRectButtonCell.h
//  ZhiBo
//
//  Created by tanson on 2016/12/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticBaseCell.h"

@interface StaticRectButtonCell : StaticBaseCell

@property (nonatomic,copy) StaticClickButtonHandel clickBlock;
@property (nonatomic,strong)UIButton * button;

-(instancetype)initWithTitle:(NSString*)title;
-(void)setNormalColor:(UIColor*)color;
-(void)setTitileColor:(UIColor*)color;

@end
