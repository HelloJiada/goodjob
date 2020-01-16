//
//  FootView.h
//  GoodDemo
//
//  Created by Jiada on 2020/1/15.
//  Copyright © 2020 Demo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FootViewDelegate<NSObject>
@optional
- (void)footViewBtn;
@end

@interface FootView : UIView
@property (nonatomic,weak)id<FootViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
