//
//  FootView.m
//  GoodDemo
//
//  Created by Jiada on 2020/1/15.
//  Copyright © 2020 Demo. All rights reserved.
//

#import "FootView.h"


#define SCREEN_W    [UIScreen mainScreen].bounds.size.width
#define SCREEN_H    [UIScreen mainScreen].bounds.size.height

@interface FootView ()

@end

@implementation FootView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:@"evaluation" forState:UIControlStateNormal];
    [btn setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, SCREEN_W, 40);
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    
}

- (void)btnClick:(UIButton *)button {
        [self.delegate footViewBtn];
}

@end
