//
//  StaticTableViewSection.h
//  FlowTableView_OC
//
//  Created by tanson on 16/9/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import <Foundation/Foundation.h>

@class StaticBaseCell;

@interface StaticTableViewSection : NSObject

@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) NSString * footText;
@property (nonatomic,assign) CGFloat height;
@property (nonatomic,readonly) NSInteger count;

-(instancetype) initWithTitle:(NSString*)title height:(CGFloat)height;
-(void) appendCell:(StaticBaseCell*)cell;
-(StaticBaseCell*) cellForRow:(NSInteger)row;
-(NSArray*) allCell;
@end
