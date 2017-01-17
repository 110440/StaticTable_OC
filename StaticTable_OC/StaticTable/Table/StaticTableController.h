//
//  FLViewController.h
//  FlowTableView_OC
//
//  Created by tanson on 16/9/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StaticTableViewBuilder.h"
#import "StaticTableViewSection.h"

// cells
#import "StaticEmptyCell.h"
#import "StaticCheckCell.h"
#import "StaticSwitchCell.h"
#import "StaticRightTextCell.h"
#import "StaticRightTextInputCell.h"
#import "StaticRightTextSelectCell.h"
#import "StaticInputFieldCell.h"
#import "StaticButtonCell.h"
#import "StaticCitySelectCell.h"
#import "StaticDescribeCell.h"
#import "StaticInputPhoneVerCodeCell.h"
#import "StaticRectButtonCell.h"
#import "StaticAvatarCell.h"

@interface StaticTableController : UIViewController

@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) StaticTableViewBuilder * tableViewBuilder;

-(NSArray*) allSection;
-(NSArray*) allCell;

//子类重写
-(void) buildCells:(StaticTableViewBuilder*)builder;

@end
