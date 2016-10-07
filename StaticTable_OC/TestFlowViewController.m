//
//  TestStaticTableController.m
//  FlowTableView_OC
//
//  Created by tanson on 16/9/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "TestFlowViewController.h"
#import "StaticTableController.h"
#import "testFlowCell.h"
#import "NibTableViewCell.h"

@interface TestStaticTableController ()

@property (nonatomic,strong) StaticButtonCell * cell1;
@property (nonatomic,strong) testFlowCell * cell2;
@property (nonatomic,strong) StaticBaseCell * cell3;
@property (nonatomic,strong) StaticCheckCell * cell4;
@property (nonatomic,strong) StaticSwitchCell * cell5;
@property (nonatomic,strong) StaticRightTextCell * cell6;
@property (nonatomic,strong) StaticRightTextInputCell * cell7;
@property (nonatomic,strong) StaticInputFieldCell * cell8;
@property (nonatomic,strong) StaticInputFieldCell * cell9;
@property (nonatomic,strong) StaticInputFieldCell * cell11;
@property (nonatomic,strong) StaticRightTextSelectCell * cell10;
@property (nonatomic,strong) StaticCitySelectCell * cell12;
@property (nonatomic,strong) NibTableViewCell * cell13;

@end

@implementation TestStaticTableController

- (void)viewDidLoad {
    [super viewDidLoad];
}


-(void)buildCells:(StaticTableViewBuilder *)builder{
    
    builder.isAndroidStyle = YES;

    [builder appendSection:[[StaticTableViewSection alloc] initWithTitle:@"test" height:40]];
    [builder appendCell:self.cell8];
    [builder appendCell:self.cell9];
    [builder appendCell:self.cell11];
    
    [builder appendSection:[[StaticTableViewSection alloc] initWithTitle:nil height:20]];
    [builder appendCell:self.cell1];
    
    [builder appendSection:[StaticTableViewSection new]];
    [builder appendCell:self.cell2];
    
    [builder appendSection:[StaticTableViewSection new]];
    [builder appendCell:self.cell4];
    [builder appendCell:self.cell5];
    [builder appendCell:self.cell6];
    [builder appendCell:self.cell7];
    [builder appendCell:self.cell10];
    [builder appendCell:self.cell12];
    [builder appendCell:self.cell13];
    
}

/////////

-(StaticButtonCell *)cell1{
    if(!_cell1){
        _cell1 = [[StaticButtonCell alloc] initWithButtonTitle:@"确定"];
        //[_cell1 setTitleColor:[UIColor redColor]];
        //[_cell1 setHighlightedColor:[UIColor redColor]];
        _cell1.clickAction = ^{
            NSLog(@"确定");
        };
    }
    return _cell1;
}

-(testFlowCell *)cell2{
    if(!_cell2){
        _cell2 = [[testFlowCell alloc] init];
        
//        __weak typeof(self) wSelf = self;
        _cell2.cellDidSelectAction = ^{
            NSLog(@"cell2 did select");
        };
    }
    return _cell2;
}

-(StaticBaseCell *)cell3{
    if(!_cell3){
        _cell3 = [[StaticBaseCell alloc] init];
    }
    return _cell3;
}

-(StaticCheckCell *)cell4{
    if(!_cell4){
        _cell4 = [StaticCheckCell new];
        _cell4.textLabel.text = @"check";
    }
    return _cell4;
}

-(StaticSwitchCell *)cell5{
    if(!_cell5){
        _cell5 = [[StaticSwitchCell alloc] initWithTitle:@"开关"];
        _cell5.describeText = @"这是一个ＣＥＬＬ的描述这是一个ＣＥＬＬ的描述这是一个ＣＥＬＬ的描述";
        _cell5.valueChangeAction = ^(BOOL on){
        };
    }
    return  _cell5;
}

-(StaticRightTextCell *)cell6{
    if(!_cell6){
        _cell6 = [[StaticRightTextCell alloc] initWithTitle:@"设置" rightText:@"值value"];
    }
    return _cell6;
}

-(StaticRightTextInputCell *)cell7{
    if(!_cell7){
        _cell7 = [[StaticRightTextInputCell alloc] initWithTitle:@"name:" rightText:@""];
    }
    return _cell7;
}

-(StaticInputFieldCell *)cell8{
    if(!_cell8){
        _cell8 = [[StaticInputFieldCell alloc] initWithTitle:@"你的账号：" placeholder:@"请输入账号"];
        _cell8.next = self.cell9;
    }
    return _cell8;
}

-(StaticInputFieldCell *)cell9{
    if(!_cell9){
        _cell9 = [[StaticInputFieldCell alloc] initWithTitle:@"你的密码：" placeholder:@"请输入密码"];
        [_cell9 setPassWordStyle];
        _cell9.next = self.cell11;
    }
    return _cell9;
}

-(StaticInputFieldCell *)cell11{
    if(!_cell11){
        _cell11 = [[StaticInputFieldCell alloc] initWithTitle:@"邮箱：" placeholder:@"请输入邮箱"];
    }
    return _cell11;
}


-(StaticRightTextSelectCell *)cell10{
    if(!_cell10){
        NSArray * items = @[@"大",@"中",@"小"];
        _cell10 = [[StaticRightTextSelectCell alloc]initWithSelectItems:items title:@"选择" selectedIdx:-1];
        _cell10.selectComplateAction = ^(NSString * s){
            
        };
    }
    return _cell10;
}

-(StaticCitySelectCell *)cell12{
    if(!_cell12){
        _cell12 = [[StaticCitySelectCell alloc] initWithTitle:@"城市" rightText:nil];
    }
    return _cell12;
}

-(NibTableViewCell *)cell13{
    if(!_cell13){
        _cell13 = [NibTableViewCell fromNib];
    }
    return _cell13;
}

@end
