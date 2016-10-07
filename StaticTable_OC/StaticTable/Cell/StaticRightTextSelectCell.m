//
//  StaticRightTextSelectCell.m
//  FlowTableView_OC
//
//  Created by tanson on 16/10/1.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticRightTextSelectCell.h"
#import "SingleSelectController.h"

@interface StaticRightTextSelectCell ()
@property (nonatomic,strong) NSArray * selectItems;
@property (nonatomic,assign) NSInteger selectIdx;
@end

@implementation StaticRightTextSelectCell

-(instancetype) initWithSelectItems:(NSArray*)items title:(NSString*)title selectedIdx:(NSInteger)idx {
    if([super initWithTitle:title rightText:nil]){
        _selectItems = items;
        _selectIdx = idx;
    }
    return self;
}

-(void)cellDidSelect{
    [super cellDidSelect];
    
    SingleSelectController * selectVC = [[SingleSelectController alloc] initWithTitles:self.selectItems? :@[] selectIndex:self.selectIdx];
    selectVC.title = self.textLabel.text;
    __weak typeof(self) wSelf = self;
    selectVC.selectComplate = ^(NSString * title){
        wSelf.rightText = title;
        wSelf.selectComplateAction? self.selectComplateAction(title):nil;
    };
    [self.parentController.navigationController pushViewController:selectVC animated:YES];
}

@end
