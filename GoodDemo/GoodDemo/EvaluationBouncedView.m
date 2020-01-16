//
//  EvaluationBouncedView.m
//  GoodDemo
//
//  Created by Jiada on 2020/1/15.
//  Copyright © 2020 Demo. All rights reserved.
//

#import "EvaluationBouncedView.h"

@interface EvaluationBouncedView ()

@property (nonatomic ,strong) NSArray *dataSource;
@end

@implementation EvaluationBouncedView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
        self.backgroundColor = UIColor.whiteColor;
        self.layer.cornerRadius = 5.0f;
        
        self.layer.masksToBounds = YES;
    }
    return self;
}

- (void)setUp {
    
    for (int i = 0; i < self.dataSource.count; i++) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 40 * i, self.frame.size.width, 40)];
        [btn setTitle:[NSString stringWithFormat:@"%@",self.dataSource[i]] forState:UIControlStateNormal];
        [btn setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
}

- (void)btnClick:(UIButton *)button {
    self.titleBlock(button.titleLabel.text);
}

- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = @[@"Boring",@"Meh",@"It's OK",@"Like It",@"Fantastic!",@"Remove rating"];
    }
    return _dataSource;
}

@end
