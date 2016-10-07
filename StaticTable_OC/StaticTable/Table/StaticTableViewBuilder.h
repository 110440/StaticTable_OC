//
//  StaticTableViewBuilder.h
//  FlowTableView_OC
//
//  Created by tanson on 16/9/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StaticTableViewSection;
@class StaticBaseCell;
@class StaticTableController;
@class StaticTableViewDelegate;

@interface StaticTableViewBuilder : NSObject

@property (nonatomic,weak) StaticTableController * viewController;
@property (nonatomic,assign) BOOL isAndroidStyle;

-(instancetype)initWithController:(StaticTableController*)vc;
-(StaticTableViewDelegate*)buildTableDelegate;
-(void)appendSection:(StaticTableViewSection*)section;
-(void)appendCell:(StaticBaseCell*)cell;


@end
