//
//  StaticInputPhoneVerCodeCell.h
//  ZhiBo
//
//  Created by tanson on 2016/12/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticInputFieldCell.h"

@interface StaticInputPhoneVerCodeCell : StaticInputFieldCell
@property (nonatomic,strong) UIButton * button;
@property (nonatomic,copy) StaticClickButtonHandel buttonClick;

-(void) setButtonTinColor:(UIColor*)c;
@end

