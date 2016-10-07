//
//  CitySelectControllerViewController.h
//  FlowTableView_OC
//
//  Created by tanson on 16/10/3.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticTableController.h"

typedef void (^StaticCitySelectComplate)(NSString * selectCity);

@interface CitySelectController : StaticTableController

@property (nonatomic,copy)StaticCitySelectComplate selectComplate;
- (instancetype) initWithContoller:(UIViewController*)controller;
@end
