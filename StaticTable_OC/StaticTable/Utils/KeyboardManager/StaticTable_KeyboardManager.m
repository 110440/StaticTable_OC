//
//  KeyboardManager.m
//  QDYongGong
//
//  Created by tanson on 16/7/10.
//  Copyright © 2016年 QDYongGong. All rights reserved.
//

#import "StaticTable_KeyboardManager.h"

@interface StaticTable_KeyboardManager ()


@end

@implementation StaticTable_KeyboardManager

-(instancetype) init{
    if([super init]){
        self.isKeyboradShowNow = NO;
        NSNotificationCenter * nt = [NSNotificationCenter defaultCenter];
        [nt addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
        [nt addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

-(void) keyboardWillChangeFrame:(NSNotification*)notification{
    [self handleKeyboard:notification];
}

-(void) keyboardWillHide:(NSNotification*)notification{
    self.isKeyboradShowNow = NO;
    if ([UIApplication sharedApplication].applicationState == UIApplicationStateBackground ){
        return;
    }
    [self handleKeyboard:notification];
}

-(void) handleKeyboard:(NSNotification*)notification{
    
    NSDictionary * userInfo = notification.userInfo ;
    if (!userInfo){
        return;
    }
    
    CGSize screentSize = [UIScreen mainScreen].bounds.size;
    NSTimeInterval animationDuration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    NSInteger animationCurve = [userInfo[UIKeyboardAnimationCurveUserInfoKey] unsignedIntegerValue];
    CGRect frameBegin = [userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect frameEnd = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    UIView * firstResponder = [UIResponder currentFirstResponder];
    [UIView animateWithDuration:animationDuration delay:0 options: (animationCurve << 16 | UIViewAnimationOptionBeginFromCurrentState) animations:^{
        
        if ( CGRectGetMinY(frameBegin) >= screentSize.height) {
            //弹出
            self.keyboardheight = frameEnd.size.height;
            self.isKeyboradShowNow = YES;
            if (self.animateWhenKeyboardAppear){
                self.animateWhenKeyboardAppear(frameEnd.size.height,firstResponder);
            }
            
        }else {
            if (CGRectGetMinY(frameEnd) >= screentSize.height ){
                //消失
                self.isKeyboradShowNow = NO;
                if(self.animateWhenKeyboardDisappear){
                    self.animateWhenKeyboardDisappear(frameEnd.size.height,firstResponder);
                }
                
            }else{
                //大小改变
                self.keyboardheight = frameEnd.size.height;
                if (self.animateWhenKeyboardAppear){
                    self.animateWhenKeyboardAppear(frameEnd.size.height,firstResponder);
                }
            }
        }
        
    } completion:^(BOOL finished) {
        self.animateComplateWhenAppear? self.animateComplateWhenAppear(frameEnd.size.height,firstResponder):nil;
    }];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter ]removeObserver:self];
}

@end


#pragma mark- UIResponder FirstResponder

static __weak id currentFirstResponder;

@implementation UIResponder (StaticTable_KeyboardManager)

+(id)currentFirstResponder {
    currentFirstResponder = nil;
    [[UIApplication sharedApplication] sendAction:@selector(findFirstResponder:) to:nil from:nil forEvent:nil];
    return currentFirstResponder;
}
-(void)findFirstResponder:(id)sender {
    currentFirstResponder = self;
}

@end
