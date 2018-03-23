//
//  ViewController.m
//  RPActivityView
//
//  Created by mac on 2018/3/23.
//  Copyright © 2018年 WRP. All rights reserved.
//

#import "ViewController.h"
#import "RPActivityView.h"

@interface ViewController ()

@property (nonatomic, strong) RPActivityView *activityView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)startActivity:(UIButton *)sender {
    if (_activityView == nil) {
        _activityView = [[RPActivityView alloc] init];
        _activityView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.2];
        _activityView.label.text = @"正在努力为您切换城市\n请耐心等待";
    }
    _activityView.showTimes += 1;
    _activityView.alpha = 1;
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        [_activiyView hideActiviTy];
    //    });
}

- (IBAction)closeActivity:(UIButton *)sender {
    [_activityView hideActiviTy];
    [_activityView removeFromSuperview];
    _activityView = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
