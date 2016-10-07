//
//  CitySelectControllerViewController.m
//  FlowTableView_OC
//
//  Created by tanson on 16/10/3.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "CitySelectController.h"

#pragma mark- city data

@interface Static_City : NSObject<NSCopying>
@property (nonatomic,copy) NSString * name;
@property (nonatomic,strong) NSArray * areas;

-(instancetype) initWithData:(NSDictionary*)data;
@end

@implementation Static_City

-(instancetype)initWithData:(NSDictionary *)data{
    if([super init]){
        _name = data[@"city"];
        _areas = data[@"areas"];
    }
    return self;
}
-(id)copyWithZone:(NSZone *)zone{
    Static_City * new = [[[self class] allocWithZone:zone] init];
    new.name = self.name;
    new.areas = self.areas.copy;
    return new;
}
@end


@interface Static_Province : NSObject <NSCopying>
@property (nonatomic,copy) NSString * name;
@property (nonatomic,strong) NSMutableArray * cites;

-(instancetype) initWithData:(NSDictionary*)data;
@end

@implementation Static_Province

-(instancetype)initWithData:(NSDictionary *)data{
    if([super init]){
        _name = data[@"state"];
        _cites = @[].mutableCopy;
        for( NSDictionary * cityData in data[@"cities"] ){
            Static_City * city = [[Static_City alloc] initWithData:cityData];
            [_cites addObject:city];
        }
    }
    return self;
}
-(id)copyWithZone:(NSZone *)zone{
    Static_Province * new = [[[self class] allocWithZone:zone] init];
    new.name = self.name;
    new.cites = self.cites.mutableCopy;
    return new;
}
@end


#pragma mark- CitySelectController

@interface CitySelectController ()

@property (nonatomic,weak) UIViewController * controller;
@property (nonatomic,strong) NSMutableArray * provinces;
@property (nonatomic,copy) Static_Province * province;
@property (nonatomic,copy) Static_City * city;
@property (nonatomic,copy) NSString * area;

@end

@implementation CitySelectController


- (instancetype) initWithContoller:(UIViewController*)controller{
    if([super init]){
        _controller = controller;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(NSMutableArray *)provinces{
    if(!_provinces){
        _provinces = @[].mutableCopy;
        
        NSString * dataPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"area" ofType:@"plist"];
        NSArray * chinaProvinces = [NSArray arrayWithContentsOfFile:dataPath];
        for(NSDictionary * data in chinaProvinces){
            Static_Province * province = [[Static_Province alloc] initWithData:data];
            [_provinces addObject:province];
        }
    }
    return  _provinces;
}

-(NSArray*) createTableData{
    
    NSMutableArray * titles = @[].mutableCopy;
    
    if(self.province == nil){
        for(Static_Province * province in self.provinces){
            [titles addObject:province.name];
        }
    }else if(self.city == nil){
        for(Static_City * city in self.province.cites){
            [titles addObject:city.name];
        }
    }else{
        titles = self.city.areas.mutableCopy;
    }
    return titles;
}

-(void)buildCells:(StaticTableViewBuilder *)builder{
    [builder appendSection:[StaticTableViewSection new]];
    
    NSArray * titles = [self createTableData];
    
    [titles enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * stop) {
        StaticCheckCell * cell = [StaticCheckCell new];
        cell.textLabel.text = obj;
        
        void (^selectComplate)() = ^{
            NSMutableString * selectCityStr = [NSMutableString stringWithFormat:@"%@ %@",self.province.name,self.city.name];
            if(self.area){
                [selectCityStr appendString:[NSString stringWithFormat:@" %@",self.area]];
            }
            self.selectComplate? self.selectComplate(selectCityStr):nil;
            [self.navigationController popToViewController:self.controller animated:YES];
        };
        
        cell.valueChangeAction = ^(StaticCheckCell * c){
            
            NSArray * allCell = [self allCell];
            [allCell makeObjectsPerformSelector:@selector(setOn:) withObject:@(NO)];
            [c setOn:YES];
            
            if(self.province == nil){
                CitySelectController * vc = [[CitySelectController alloc] initWithContoller:self.controller];
                vc.province = self.provinces[idx];
                vc.selectComplate = self.selectComplate;
                [self.navigationController pushViewController:vc animated:YES];
                
            }else if(self.city == nil){
                self.city = self.province.cites[idx];
                CitySelectController * vc = [[CitySelectController alloc] initWithContoller:self.controller];
                vc.province = self.province;
                vc.city = self.province.cites[idx];
                vc.selectComplate = self.selectComplate;
                if([vc createTableData].count > 0){
                    [self.navigationController pushViewController:vc animated:YES];
                }else{
                    selectComplate();
                }
                
            }else{
                self.area = obj;
                selectComplate();
            }
            
        };
        [builder appendCell:cell];
    }];
}


@end
