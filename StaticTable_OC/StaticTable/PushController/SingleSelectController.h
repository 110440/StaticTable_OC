//
//  SingleSelectController.h
//  FlowTableView_OC
//
//  Created by tanson on 16/10/1.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticTableController.h"

typedef void  (^StaticSingleSelectComplate)(NSString * title);

@interface SingleSelectController : StaticTableController

@property(nonatomic,copy) StaticSingleSelectComplate selectComplate;

-(instancetype) initWithTitles:(NSArray*)titles selectIndex:(NSInteger)index ;

@end
