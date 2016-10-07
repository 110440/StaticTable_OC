
//
//  StaticTableViewSection.m
//  FlowTableView_OC
//
//  Created by tanson on 16/9/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StaticTableViewSection.h"


@interface StaticTableViewSection ()
@property (nonatomic,strong) NSMutableArray * cells;
@end

@implementation StaticTableViewSection

-(instancetype) init{
    if([super init]){
        _cells = @[].mutableCopy;
        _title = nil;
        _height = UITableViewAutomaticDimension;
    }
    return self;
}

-(instancetype) initWithTitle:(NSString*)title height:(CGFloat)height{
    if([super init]){
        _cells = @[].mutableCopy;
        _title = title;
        _height = height;
    }
    return self;
}

-(void) appendCell:(StaticBaseCell*)cell{
    [self.cells addObject:cell];
}

-(StaticBaseCell*) cellForRow:(NSInteger)row{
    return self.cells[row];
}

-(NSInteger)count{
    return self.cells.count;
}
-(NSArray *)allCell{
    return self.cells;
}

@end
