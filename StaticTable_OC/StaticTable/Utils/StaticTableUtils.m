//
//  StaticTableUtils.m
//  FlowTableView_OC
//
//  Created by tanson on 16/9/30.
//  Copyright © 2016年 chatchat. All rights reserved.
//

#import "StaticTableUtils.h"

@implementation StaticTableUtils

@end



@implementation NSString(StaticTable)


- (CGSize)StaticTable_sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode {
    CGSize result;
    if (!font) font = [UIFont systemFontOfSize:12];
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableDictionary *attr = [NSMutableDictionary new];
        attr[NSFontAttributeName] = font;
        if (lineBreakMode != NSLineBreakByWordWrapping) {
            NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
            paragraphStyle.lineBreakMode = lineBreakMode;
            attr[NSParagraphStyleAttributeName] = paragraphStyle;
        }
        CGRect rect = [self boundingRectWithSize:size
                                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      attributes:attr context:nil];
        result = rect.size;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        result = [self sizeWithFont:font constrainedToSize:size lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
    }
    return result;
}

- (CGFloat)StaticTable_widthForFont:(UIFont *)font {
    CGSize size = [self StaticTable_sizeForFont:font size:CGSizeMake(HUGE, HUGE) mode:NSLineBreakByWordWrapping];
    return size.width;
}

- (CGFloat)StaticTable_heightForFont:(UIFont *)font width:(CGFloat)width {
    CGSize size = [self StaticTable_sizeForFont:font size:CGSizeMake(width, HUGE) mode:NSLineBreakByWordWrapping];
    return size.height;
}

-(BOOL)static_matchesRegex:(NSString *)pattern{
    
    NSError *error;
    NSRegularExpression * regex = [[NSRegularExpression alloc] initWithPattern:pattern
                                                                       options:NSRegularExpressionCaseInsensitive
                                                                         error:&error];
    NSInteger number = [regex numberOfMatchesInString:self options:0 range:NSMakeRange(0, self.length)];
    if(error){
        return NO;
    }else{
        return number > 0;
    }
}

@end


@implementation UIImage (StaticTable)


+ (UIImage *)StaticTable_imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)StaticTable_imageWithColor:(UIColor *)color{
    return [self StaticTable_imageWithColor:color size:CGSizeMake(1, 1)];
}

@end
