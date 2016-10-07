//
//  StaticInputFieldCell.m
//  FlowTableView_OC
//
//  Created by tanson on 16/9/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticInputFieldCell.h"
#import "StaticTableUtils.h"

@interface StaticInputFieldCell ()<UITextFieldDelegate>

@property (nonatomic,copy) NSString * placeholder;
@property (nonatomic,strong) UITextField * textField;

@end

@implementation StaticInputFieldCell


-(instancetype)initWithTitle:(NSString*)title placeholder:(NSString*)placeholder{
    if([super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil]){
        self.textLabel.text = title;
        _placeholder = placeholder;
        [self.contentView addSubview:self.textField];
        [self.contentView sendSubviewToBack:self.textField];
    }
    return self;
}

-(UITextField *)textField{
    if(!_textField){
        _textField = [[UITextField alloc] initWithFrame:CGRectZero];
        _textField.placeholder = _placeholder;
        _textField.textAlignment = NSTextAlignmentRight;
        _textField.leftViewMode = UITextFieldViewModeAlways;
        _textField.textColor = [UIColor lightGrayColor];
        _textField.returnKeyType = UIReturnKeyDone;
        _textField.delegate = self;
    }
    return _textField;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGRect frame = self.contentView.bounds;
    frame.size.width -= 15;
    self.textField.frame = frame;
}

-(void)setPassWordStyle{
    self.textField.secureTextEntry = YES;
}

-(void)setInputTextAlignmentToLeft{
    CGFloat width = [self.textLabel.text StaticTable_widthForFont:self.textLabel.font];
    width = self.textLabel.frame.origin.x + width + 10;
    [self setInputOffsetX:width];
}

-(void)setInputOffsetX:(CGFloat)offsetX{
    UIView * leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, offsetX, 10)];
    self.textField.leftView = leftView;
    self.textField.textAlignment = NSTextAlignmentLeft;
}

-(void)setNext:(StaticInputFieldCell *)next{
    if(next){
        self.textField.returnKeyType = UIReturnKeyNext;
        _next = next;
    }
}

-(BOOL) becomeFirstResponder{
    [self.textField becomeFirstResponder];
    return YES;
}

#pragma mark- textField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(self.next){
        [self.next becomeFirstResponder];
    }else{
        [self endEditing:YES];
    }
    return true;
}

#pragma mark- valid

-(BOOL) isValidEmail{
    NSString * pattern = @"^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$";
    return [self.textField.text static_matchesRegex:pattern];
}

-(BOOL) isValidSite{
    NSString * pattern = @"^(https?:\\/\\/)?([\\da-z\\.-]+)\\.([a-z\\.]{2,6})([\\/\\w \\.-]*)*\\/?$";
    return [self.textField.text static_matchesRegex:pattern];
}

-(BOOL) isValidPhoneNumber{
    
    NSString * mobile = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    BOOL ret = [self.textField.text static_matchesRegex:mobile] ||
    [self.textField.text static_matchesRegex:CM] ||
    [self.textField.text static_matchesRegex:CU] ||
    [self.textField.text static_matchesRegex:CT];
    
    return ret;
}

@end
