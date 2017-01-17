//
//  StaticButtonCell.h
//  FlowTableView_OC
//
//  Created by tanson on 16/9/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticBaseCell.h"



@interface StaticButtonCell : StaticBaseCell

@property (nonatomic,copy) StaticClickButtonHandel clickAction;

-(instancetype) initWithButtonTitle:(NSString*)title;
-(void) setNormalColor:(UIColor*)color;
-(void) setHighlightedColor:(UIColor*)color;
-(void) setTitleColor:(UIColor*)color;

@end
