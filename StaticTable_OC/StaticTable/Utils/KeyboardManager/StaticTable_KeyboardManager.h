//
//  KeyboardManager.h
//  QDYongGong
//
//  Created by tanson on 16/7/10.
//  Copyright © 2016年 QDYongGong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^StaticTableKeyboardEvenHandel)(CGFloat height,UIView * firstResponder);

@interface StaticTable_KeyboardManager : NSObject

@property (nonatomic,assign) BOOL isKeyboradShowNow;
@property (nonatomic,assign) CGFloat keyboardheight;
@property (nonatomic,copy) StaticTableKeyboardEvenHandel animateWhenKeyboardAppear;
@property (nonatomic,copy) StaticTableKeyboardEvenHandel animateWhenKeyboardDisappear;
@property (nonatomic,copy) StaticTableKeyboardEvenHandel animateComplateWhenAppear;

@end


#pragma mark- UIResponder FirstResponder

@interface UIResponder (StaticTable_KeyboardManager)
+(id)currentFirstResponder;
@end