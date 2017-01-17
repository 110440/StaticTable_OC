//
//  StaticBaseCell.h
//  FlowTableView_OC
//
//  Created by tanson on 16/9/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StaticTableUtils.h"

typedef void (^StaticClickButtonHandel)();
typedef void (^StaticCellDidSelectHandel)() ;

@class StaticTableViewSection;

@interface StaticBaseCell : UITableViewCell

@property (nonatomic,weak) StaticTableViewSection * section;
@property (nonatomic,weak) UIViewController * parentController;
@property (nonatomic,copy) StaticCellDidSelectHandel cellDidSelectAction;
@property (nonatomic,strong) UIImage * image;
@property (nonatomic,assign) CGFloat height;

// cell 的底部描述
@property (nonatomic,copy)NSString * describeText;

+(instancetype) fromNib;

// android style (no separate)
-(void) removeSeparateLine;

// subclass over write
// the height for cell
-(CGFloat) heightForCell;

// subclass over write
// the cell did selected
-(void) cellDidSelect;

@end
