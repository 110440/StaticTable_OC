//
//  SingleSelectController.m
//  FlowTableView_OC
//
//  Created by tanson on 16/10/1.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "SingleSelectController.h"

@interface SingleSelectController ()
@property (nonatomic,strong) NSArray * titles;
@property (nonatomic,assign) NSInteger selectIndex;
@end

@implementation SingleSelectController


-(instancetype) initWithTitles:(NSArray*)titles selectIndex:(NSInteger)index {
    if([super init]){
        _titles = titles;
        _selectIndex = index;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithTitle:@"确定"
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(subimt)];
    [rightItem setEnabled:false];
    self.navigationItem.rightBarButtonItem = rightItem;
}

-(void) subimt{
    NSString * title = self.titles[self.selectIndex];
    self.selectComplate? self.selectComplate(title):nil;
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)buildCells:(StaticTableViewBuilder *)builder{
    [builder appendSection:[StaticTableViewSection new]];
    
    __weak typeof(self) wSelf = self;
    [self.titles enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * stop) {
        StaticCheckCell * cell = [StaticCheckCell new];
        cell.textLabel.text = obj;
        if(idx == self.selectIndex){
            [cell setOn:YES];
        }
        cell.valueChangeAction = ^(StaticCheckCell * c){
            wSelf.selectIndex = idx;
            NSArray * allCell = [self allCell];
            [allCell makeObjectsPerformSelector:@selector(setOn:) withObject:@(NO)];
            [c setOn:YES];
            [wSelf.navigationItem.rightBarButtonItem setEnabled:YES];
        };
        [builder appendCell:cell];
    }];
}

@end
