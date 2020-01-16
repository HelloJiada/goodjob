//
//  ViewController.m
//  GoodDemo
//
//  Created by Jiada on 2020/1/15.
//  Copyright © 2020 Demo. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Extension.h"
#import "HeadView.h"
#import "FootView.h"
#import "EvaluationBouncedView.h"
#import "UIView+CustomAlertView.h"
#define SCREEN_W    [UIScreen mainScreen].bounds.size.width
#define SCREEN_H    [UIScreen mainScreen].bounds.size.height
#define UIKeyWindow [[UIApplication sharedApplication] keyWindow]
#define kWeakSelf __weak typeof(self) weakSelf = self;
NSString *const kTableViewCellId = @"kTableViewCellId";
static NSString * kIdentifierHead = @"kIdentifierHead";
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,FootViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) EvaluationBouncedView *evaluationBouncedView;
@property (nonatomic, weak) NSString *str;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    FootView *footView = [[FootView alloc] init];
    footView.delegate = self;
    self.tableView.tableFooterView = footView;
    self.tableView.tableFooterView.frame = CGRectMake(0, 0, SCREEN_W, 40);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 41;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *str = [NSString stringWithFormat:@"%@",self.dataSource[indexPath.section]];
    if ([str isEqualToString:@""]) {
        return 0;
    }
    CGFloat contentHeight = [str calculateRowHeightFontSize:18 maxW:SCREEN_W-22];
    return contentHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    HeadView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kIdentifierHead];
    
    UILabel *label = [[UILabel alloc] init];
    CGSize size = [self.dataArray[section] sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18.0f]}];
    label.frame = CGRectMake(0, 0, size.width, 40);
    label.text = self.dataArray[section];
    [headerView addSubview:label];
    
    
    if (section == 2) {
        UIButton *btn = [[UIButton alloc] init];
        [btn setTitle:@"Hide" forState:UIControlStateNormal];
        [btn setTitle:@"Show" forState:UIControlStateSelected];
        [btn setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
        btn.frame = CGRectMake(170, 0, 50, 40);
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [headerView addSubview:btn];
    }
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTableViewCellId];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.dataSource[indexPath.section];
    cell.textLabel.numberOfLines = 0;
    return cell;
}

- (void)btnClick:(UIButton *)button {
    button.selected = !button.selected;
    if (button.selected) {
        _dataSource = @[
                   @"I have been in this garden in all seasons, in all weathers, at all times.Sometimes I stay for a while and then go home. ",
                   @"After years of thinking this, it finally became clear that a person's birth was no longer an issue for debate, but a fact given to him by god.",
                   @"",
                   @""
               ];
    }else{
        _dataSource = @[
                   @"I have been in this garden in all seasons, in all weathers, at all times.Sometimes I stay for a while and then go home. ",
                   @"After years of thinking this, it finally became clear that a person's birth was no longer an issue for debate, but a fact given to him by god.",
                   @"I don't know how many years it will take to recognize a new place as a family.",
                   @""
               ];
    }
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:0 inSection:2];

    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = UIColor.whiteColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTableViewCellId];
        [_tableView registerClass:[HeadView class] forHeaderFooterViewReuseIdentifier:kIdentifierHead];
    }
    return _tableView;
}

- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[
            @"The first paragraph.",
            @"The second paragraph.",
            @"The third paragraph.",
            @"The stars"
        ];
    }
    return _dataArray;
}

- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = @[
            @"I have been in this garden in all seasons, in all weathers, at all times.Sometimes I stay for a while and then go home. ",
            @"After years of thinking this, it finally became clear that a person's birth was no longer an issue for debate, but a fact given to him by god.",
            @"I don't know how many years it will take to recognize a new place as a family.",
            @""
        ];
    }
    return _dataSource;
}

- (void)footViewBtn {
    NSLog(@"111");
    kWeakSelf;
    weakSelf.evaluationBouncedView = [[EvaluationBouncedView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W * 0.67, 392.5)];
    weakSelf.evaluationBouncedView.titleBlock = ^(NSString * _Nonnull str) {
        NSLog(@"str == %@",str);
                weakSelf.dataArray = @[
            @"The first paragraph.",
            @"The second paragraph.",
            @"The third paragraph.",
            [NSString stringWithFormat:@"The stars : %@",str]
        ];
        NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:3];
        [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
        [weakSelf.evaluationBouncedView jk_hideView];
    };
    [weakSelf.evaluationBouncedView jk_showInWindowWithMode:JKCustomAnimationModeAlert inView:UIKeyWindow bgAlpha:0.6 needEffectView:YES];
}

@end
