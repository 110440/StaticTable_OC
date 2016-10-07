//
//  StaticRightTextInputCell.m
//  FlowTableView_OC
//
//  Created by tanson on 16/9/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticRightTextInputCell.h"
#import "InputTextController.h"

@implementation StaticRightTextInputCell

-(void)cellDidSelect{
    [super cellDidSelect];
    InputTextController * inputVc = [[InputTextController alloc] initWithPlaceText:self.rightText];
    __weak typeof(self) wSelf = self;
    inputVc.inputTextCallback = ^(NSString * input){
        wSelf.rightText = input;
        wSelf.inputComplate? self.inputComplate(input):nil;
    };
    [self.parentController.navigationController pushViewController:inputVc animated:YES];
}

@end
