//
//  StaticCitySelectCell.m
//  FlowTableView_OC
//
//  Created by tanson on 16/10/3.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticCitySelectCell.h"
#import "CitySelectController.h"

@implementation StaticCitySelectCell

-(void)cellDidSelect{
    [super cellDidSelect];
    CitySelectController * citySelcetVC = [[CitySelectController alloc] initWithContoller:self.parentController];
    __weak typeof(self) wSelf = self;
    citySelcetVC.selectComplate = ^(NSString *str){
        wSelf.rightText = str;
    };
    
    [self.parentController.navigationController pushViewController:citySelcetVC animated:YES];
}

@end
