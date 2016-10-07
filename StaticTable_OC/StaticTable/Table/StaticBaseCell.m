//
//  StaticBaseCell.m
//  FlowTableView_OC
//
//  Created by tanson on 16/9/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticBaseCell.h"

@interface StaticBaseCell ()

@end

@implementation StaticBaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleGray;
    self.height = 44;
}

-(instancetype)init{
    if([super init]){
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        self.height = 44;
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if([super initWithFrame:frame]){
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        self.height = 44;
    }
    return self;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if([super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        self.height = 44;
    }
    return self;
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    [super setHighlighted:highlighted animated:animated];
    
    if(self.selectionStyle == UITableViewCellSelectionStyleGray ){
        return;
    }
    
    if(highlighted){
        [UIView animateWithDuration:0.15 animations:^{
            self.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
        }];
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            self.backgroundColor = [UIColor whiteColor];
        }];
    }
}

-(void) removeSeparateLine{
    self.selectionStyle = UITableViewCellSelectionStyleGray;
    self.highlighted = YES;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

+(instancetype)fromNib{
    NSBundle * bundle = [NSBundle bundleForClass:self];
    NSString * nibName = NSStringFromClass(self);
    return [bundle loadNibNamed:nibName owner:nil options:nil].firstObject;
}

-(UIImage *)image{
    return self.imageView.image;
}
-(void)setImage:(UIImage *)image{
    //TODO: 裁剪成 36X36
    self.imageView.image = image;
}

// sub class over write

- (CGFloat)heightForCell{
    return self.height;
}

-(void)cellDidSelect{
    self.cellDidSelectAction ? self.cellDidSelectAction():nil;
}


@end
