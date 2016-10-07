//
//  FLViewController.m
//  FlowTableView_OC
//
//  Created by tanson on 16/9/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticTableController.h"
#import "StaticTableViewDelegate.h"
#import "StaticTable_KeyboardManager.h"

@interface StaticTableController ()

@property (nonatomic,strong) StaticTableViewDelegate * tableViewDelegate;
@property (nonatomic,strong) StaticTable_KeyboardManager * keyboardManager;

@end

@implementation StaticTableController

- (instancetype)init{
    if([super init]){
        _tableViewBuilder = [[StaticTableViewBuilder alloc] initWithController:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self buildCells:self.tableViewBuilder];
    self.tableViewDelegate = [self.tableViewBuilder buildTableDelegate];
    self.tableView.delegate = self.tableViewDelegate;
    self.tableView.dataSource = self.tableViewDelegate;
    [self.tableView reloadData];
    self.keyboardManager.animateComplateWhenAppear=nil;
}

-(UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.contentInset = UIEdgeInsetsZero;
        UITapGestureRecognizer *tableViewGesture = [[UITapGestureRecognizer alloc]
                                                    initWithTarget:self
                                                    action:@selector(commentTableViewTouchInSide)];
        tableViewGesture.numberOfTapsRequired = 1;
        tableViewGesture.cancelsTouchesInView = NO;
        [_tableView addGestureRecognizer:tableViewGesture];
        return _tableView;
    }
    return _tableView;
}

-(StaticTable_KeyboardManager *)keyboardManager{
    if(!_keyboardManager){
        _keyboardManager = [StaticTable_KeyboardManager new];
        
        UITableView * tableView = self.tableView;
        __block UIEdgeInsets oldInsets;
        __block BOOL oldInsetsInit = NO;
        _keyboardManager.animateWhenKeyboardAppear = ^(CGFloat height , UIView * firstResponder){
            
            if(!oldInsetsInit){
                oldInsets = tableView.contentInset;
                oldInsetsInit = YES;
            }
            UIWindow * curWindow = [UIApplication sharedApplication].keyWindow;
            CGSize windowSize = curWindow.bounds.size;
            CGRect responderFrameInWindow = [curWindow convertRect:firstResponder.frame fromView:firstResponder.superview];
            CGFloat d = CGRectGetMaxY(responderFrameInWindow) - (windowSize.height - height);
            
            if(d > 0){
                UIEdgeInsets contentInset = oldInsets;
                contentInset.bottom += height;
                tableView.contentInset = contentInset;
                
                CGPoint offset = tableView.contentOffset;
                offset.y+=d;
                tableView.contentOffset = offset;
            }
        };
        
        _keyboardManager.animateWhenKeyboardDisappear = ^(CGFloat height , UIView * firstResponder){
            tableView.contentInset = oldInsets;
        };
    }
    return _keyboardManager;
}

- (void)commentTableViewTouchInSide{
    //[cells makeObjectsPerformSelector:@selector(commentTableViewTouch)];
    [self.view endEditing:YES];
}

-(NSArray *)allSection{
    return [self.tableViewDelegate allSection];
}

-(NSArray *)allCell{
    NSMutableArray * cells = @[].mutableCopy;
    NSArray * allSection = [self allSection];
    for(StaticTableViewSection * s in allSection){
        NSArray * allCell = [s allCell];
        [cells addObjectsFromArray:allCell];
    }
    return cells;
}

//子类重写
-(void)buildCells:(StaticTableViewBuilder *)builder{
    NSCAssert(false,@"子类必需重载这个函数");
}

@end
