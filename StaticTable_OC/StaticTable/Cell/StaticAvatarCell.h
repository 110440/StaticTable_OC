//
//  StaticAvatarCell.h
//  ZhiBo
//
//  Created by tanson on 2016/12/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticBaseCell.h"

@interface StaticAvatarCell : StaticBaseCell
-(instancetype)initWithTitle:(NSString*)title size:(CGSize)size;
@property (nonatomic,strong) UIImageView * avatarView;
@end
