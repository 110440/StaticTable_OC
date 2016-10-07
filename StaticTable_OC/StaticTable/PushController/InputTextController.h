//
//  InputTextController.h
//  FlowTableView_OC
//
//  Created by tanson on 16/9/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^StaticInputTextCallback)(NSString * text);

@interface InputTextController : UIViewController

@property (nonatomic,copy) StaticInputTextCallback inputTextCallback;

-(instancetype) initWithPlaceText:(NSString*)text;

@end
