//
//  EvaluationBouncedView.h
//  GoodDemo
//
//  Created by Jiada on 2020/1/15.
//  Copyright © 2020 Demo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^TitleBlock)(NSString *str);
@interface EvaluationBouncedView : UIView
@property (nonatomic, strong)TitleBlock titleBlock;
@end

NS_ASSUME_NONNULL_END
