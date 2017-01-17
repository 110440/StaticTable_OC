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

@implementation UIButton(StaticTable)


- (void)StaticTable_countDownWithTime:(NSInteger)time title:(NSString *)title{
    
    [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    UIColor * oldColor = [UIColor colorWithCGColor:self.layer.borderColor];
    
    //倒计时时间
    __block NSInteger timeOut = time;
    NSString * oldTitle  = self.titleLabel.text ?:@"重发";
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    //每秒执行一次
    __weak UIButton * wSelf = self;
    dispatch_source_set_timer(timer, dispatch_walltime(nil, 0), 1 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, ^{
        
        //倒计时结束，关闭
        if (timeOut <= 0) {
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [wSelf setTitle:oldTitle forState:UIControlStateNormal];
                [wSelf setEnabled:YES];
                wSelf.layer.borderColor = oldColor.CGColor;
            });
            
        } else {
            
            NSInteger allTime = time + 1;
            NSInteger seconds = timeOut % allTime;
            NSString * timeStr = [NSString stringWithFormat:@"%0.2ds", (int)seconds];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [wSelf setTitle:[NSString stringWithFormat:@"%@%@",timeStr,title] forState:UIControlStateNormal];
                [wSelf setEnabled:NO];
                wSelf.layer.borderColor = [UIColor lightGrayColor].CGColor;
            });
            
            timeOut--;
        }
    });
    dispatch_resume(timer);
}

@end
