//
//  InputTextController.m
//  FlowTableView_OC
//
//  Created by tanson on 16/9/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "InputTextController.h"

@interface InputTextController ()

@property (nonatomic,copy) NSString * placeholder;
@property (nonatomic,strong) UITextField * inputField;

@end

@implementation InputTextController

-(instancetype) initWithPlaceText:(NSString*)text{
    if([super init]){
        _placeholder = text;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self setupTextField];
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(subimt)];
    self.navigationItem.rightBarButtonItem = rightItem;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.inputField becomeFirstResponder];
}

-(void) subimt{
    self.inputTextCallback? self.inputTextCallback(self.inputField.text):nil;
    [self.navigationController popViewControllerAnimated:YES];
}

-(UITextField *)inputField{
    
    if(!_inputField){
        
        _inputField = [[UITextField alloc] initWithFrame:CGRectZero];
        _inputField.leftViewMode = UITextFieldViewModeAlways;
        _inputField.text = self.placeholder;
        UIView * leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 10)];
        _inputField.leftView = leftView;
        _inputField.backgroundColor = [UIColor whiteColor];
        _inputField.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _inputField;
}

-(void) setupTextField{
    
    [self.view addSubview:self.inputField];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.inputField
                                                                 attribute:NSLayoutAttributeLeft
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeLeft
                                                                multiplier:1
                                                                  constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.inputField
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.topLayoutGuide
                                                                 attribute:NSLayoutAttributeBaseline
                                                                multiplier:1
                                                                  constant:20]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.inputField
                                                                 attribute:NSLayoutAttributeRight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:self.view
                                                                 attribute:NSLayoutAttributeRight
                                                                multiplier:1
                                                                  constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.inputField
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:nil
                                                                 attribute:NSLayoutAttributeHeight
                                                                multiplier:1
                                                                  constant:44]];
}

@end
