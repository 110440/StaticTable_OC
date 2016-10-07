//
//  StaticTableViewBuilder.m
//  FlowTableView_OC
//
//  Created by tanson on 16/9/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticTableViewBuilder.h"
#import "StaticTableViewDelegate.h"
#import "StaticBaseCell.h"
#import "StaticTableController.h"

@interface StaticTableViewBuilder ()
@property (nonatomic,strong) NSMutableArray * sections;
@end

@implementation StaticTableViewBuilder

-(instancetype)initWithController:(StaticTableController*) vc {
    if([super init]){
        _sections = @[].mutableCopy;
        _viewController = vc;
        _isAndroidStyle = NO;
    }
    return self;
}

-(void)appendSection:(StaticTableViewSection*)section{
    [self.sections addObject:section];
}

-(void)appendCell:(StaticBaseCell*)cell{
    StaticTableViewSection * curSection = self.sections.lastObject;
    if(curSection){
        cell.section = curSection;
        cell.parentController = self.viewController;
        
        if(self.isAndroidStyle && curSection.count <= 0){
            [curSection appendCell:[StaticEmptyCell new]];
        }
        [curSection appendCell:cell];
        [self appendDescribeForCell:cell];
    }else{
        NSLog(@"[FLowTableView] error : 当前没有section !! ");
    }
}

-(void)appendDescribeForCell:(StaticBaseCell*)cell{
    if(cell.describeText){
        [cell removeSeparateLine];
        StaticBaseCell * desCell = [[StaticDescribeCell alloc] initWithText:cell.describeText];
        [self appendCell:desCell];
    }
}

-(StaticTableViewDelegate*)buildTableDelegate{
    if(self.isAndroidStyle){
        [self.sections enumerateObjectsUsingBlock:^(StaticTableViewSection * section, NSUInteger idx, BOOL * stop) {
            StaticBaseCell * lastCell = [section cellForRow:section.count-1];
            [lastCell removeSeparateLine];
        }];
    }
    return [[StaticTableViewDelegate alloc] initWithSections:self.sections];
}

@end
