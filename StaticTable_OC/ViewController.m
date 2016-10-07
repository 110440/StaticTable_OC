//
//  ViewController.m
//  StaticTable_OC
//
//  Created by tanson on 16/10/7.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "ViewController.h"
#import "TestFlowViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showTable:(id)sender {
    TestStaticTableController *vc = [TestStaticTableController new];
    UINavigationController * showVc = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:showVc animated:YES completion:nil];
}

@end
