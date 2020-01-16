//
//  NSString+Extension.m
//  GoodDemo
//
//  Created by Jiada on 2020/1/15.
//  Copyright © 2020 Demo. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
- (CGFloat)calculateRowHeightFontSize:(NSInteger)fontSize maxW:(CGFloat)maxW
{
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    CGRect rect = [self boundingRectWithSize:CGSizeMake(maxW, 0) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil];
    return rect.size.height;
}
@end
