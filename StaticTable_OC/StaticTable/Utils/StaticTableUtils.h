//
//  StaticTableUtils.h
//  FlowTableView_OC
//
//  Created by tanson on 16/9/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface StaticTableUtils : NSObject

@end

@interface NSString(StaticTable)

- (CGSize)StaticTable_sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode;
- (CGFloat)StaticTable_widthForFont:(UIFont *)font;
- (CGFloat)StaticTable_heightForFont:(UIFont *)font width:(CGFloat)width;

- (BOOL) static_matchesRegex:(NSString*)pattern;

@end


@interface UIImage (StaticTable)

+ (UIImage *)StaticTable_imageWithColor:(UIColor *)color size:(CGSize)size;
+ (UIImage *)StaticTable_imageWithColor:(UIColor *)color;

@end

@interface UIButton(StaticTable)

// 倒计时
- (void) StaticTable_countDownWithTime:(NSInteger)time title:(NSString*)title;

@end
