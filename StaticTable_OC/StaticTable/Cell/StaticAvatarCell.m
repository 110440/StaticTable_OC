//
//  StaticAvatarCell.m
//  ZhiBo
//
//  Created by tanson on 2016/12/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticAvatarCell.h"

@implementation StaticAvatarCell{
    CGSize _size;
}

-(instancetype)initWithTitle:(NSString*)title size:(CGSize)size{
    if([super initWithFrame:CGRectZero]){
        self.textLabel.text = title;
        _size = size;
        self.accessoryView = self.avatarView;
    }
    return self;
}

-(UIImageView *)avatarView{
    if(!_avatarView){
        _avatarView = [UIImageView new];
        _avatarView.frame = CGRectMake(0, 0, _size.width, _size.height);
        _avatarView.layer.cornerRadius = _size.height/2;
    }
    return _avatarView;
}


-(CGFloat)heightForCell{
    return _size.height + 10;
}



@end
