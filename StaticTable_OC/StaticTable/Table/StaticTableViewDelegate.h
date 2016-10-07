//
//  StaticTableViewDelegate.h
//  FlowTableView_OC
//
//  Created by tanson on 16/9/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StaticTableViewSection.h"

@interface StaticTableViewDelegate : NSObject <UITableViewDataSource,UITableViewDelegate>

-(instancetype) initWithSections:(NSArray*)sections;
-(NSArray*) allSection;

@end
