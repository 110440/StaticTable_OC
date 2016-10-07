//
//  StaticInputFieldCell.h
//  FlowTableView_OC
//
//  Created by tanson on 16/9/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticBaseCell.h"

@interface StaticInputFieldCell : StaticBaseCell

@property (nonatomic,weak)StaticInputFieldCell * next;

-(instancetype)initWithTitle:(NSString*)title placeholder:(NSString*)placeholder;

-(void) setPassWordStyle;
-(void) setInputTextAlignmentToLeft;
-(void) setInputOffsetX:(CGFloat)offsetX;

-(BOOL) isValidEmail;
-(BOOL) isValidSite;
-(BOOL) isValidPhoneNumber;

@end
