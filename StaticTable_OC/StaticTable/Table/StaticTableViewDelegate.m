//
//  StaticTableViewDelegate.m
//  FlowTableView_OC
//
//  Created by tanson on 16/9/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StaticTableViewDelegate.h"
#import "StaticBaseCell.h"

@interface StaticTableViewDelegate ()
@property (nonatomic,strong) NSArray * sections;
@end

@implementation StaticTableViewDelegate

-(instancetype)initWithSections:(NSArray *)sections{
    if([super init]){
        _sections = sections;
    }
    return self;
}

-(StaticBaseCell*) cellForIndexPath:(NSIndexPath*)indexPath{
    StaticTableViewSection * section = self.sections[indexPath.section];
    return [section cellForRow:indexPath.row];
}

-(NSArray *)allSection{
    return self.sections;
}

#pragma mark - tableView delegate


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return ((StaticTableViewSection*)self.sections[section]).count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self cellForIndexPath:indexPath];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    StaticBaseCell * cell = [self cellForIndexPath:indexPath];
    return [cell heightForCell];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return ((StaticTableViewSection*)self.sections[section]).height;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return ((StaticTableViewSection*)self.sections[section]).title;
}
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return ((StaticTableViewSection*)self.sections[section]).footText;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    StaticBaseCell * cell = [self cellForIndexPath:indexPath];
    [cell setSelected:NO animated:YES];
    [cell cellDidSelect];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [scrollView endEditing:YES];
}

@end
