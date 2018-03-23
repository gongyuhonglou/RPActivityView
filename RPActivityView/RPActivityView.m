//
//  RPActivityView.m
//  RPActivityView
//
//  Created by mac on 2018/3/23.
//  Copyright © 2018年 WRP. All rights reserved.
//

#import "RPActivityView.h"

//static RPActivityView *activiyView;

@interface RPActivityView ()

@property (nonatomic, strong) RPActivityView *activiyView;
@end

@implementation RPActivityView
- (void)showActiviTy {
    //    static dispatch_once_t onceToken;
    //    dispatch_once(&onceToken, ^{
    //        if (_activiyView == nil) {
    //            _activiyView = [[RPActivityView alloc] init];
    //            _activiyView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.2];
    //        }
    //    });
    _activiyView.showTimes += 1;
    
    _activiyView.alpha = 1;
}

- (void)hideActiviTy {
    if (_activiyView.showTimes > 0) {
        _activiyView.showTimes -= 1;
    }
    if (_activiyView.showTimes == 0){
        [UIView animateWithDuration:0.25f animations:^{
            _activiyView.alpha = 0;
        }];
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.showTimes = 0;
        [self.contentView addSubview:self.label];
        [self.contentView.layer addSublayer:self.reaplicator];
        [self addSubview:self.contentView];
        [self startAnimation];
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        self.alpha = 0;
    }
    return self;
}
- (void)startAnimation {
    
    //对layer进行动画设置
    CABasicAnimation *animaiton = [CABasicAnimation animation];
    //设置动画所关联的路径属性
    animaiton.keyPath = @"transform.scale";
    //设置动画起始和终结的动画值
    animaiton.fromValue = @(1);
    animaiton.toValue = @(0.1);
    //设置动画时间
    animaiton.duration = 1.0f;
    //填充模型
    animaiton.fillMode = kCAFillModeForwards;
    //不移除动画
    animaiton.removedOnCompletion = NO;
    //设置动画次数
    animaiton.repeatCount = INT_MAX;
    //添加动画
    [self.showlayer addAnimation:animaiton forKey:@"anmation"];
}
- (UIView *)contentView {
    if (_contentView == nil) {
        UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        contentView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2-100);
        contentView.layer.cornerRadius = 10.0f;
        contentView.layer.borderColor = [UIColor colorWithWhite:0.926 alpha:1.000].CGColor;
        contentView.layer.shadowColor = [UIColor blackColor].CGColor;
        contentView.layer.shadowOpacity = 0.1;
        contentView.layer.shadowOffset = CGSizeMake(1, 1);
        contentView.backgroundColor = [UIColor clearColor];
        _contentView = contentView;
    }
    return _contentView;
}
- (UILabel *)label {
    if (_label == nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(-CGRectGetWidth(self.contentView.frame)/2, CGRectGetMaxY(self.reaplicator.frame), CGRectGetWidth(self.contentView.frame)*2, 40)];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor grayColor];
        label.font = [UIFont systemFontOfSize:16];
        label.numberOfLines = 0;
        _label = label;
    }
    return _label;
}
- (CAReplicatorLayer *)reaplicator{
    if (_reaplicator == nil) {
        int numofInstance = 10;
        CGFloat duration = 1.0f;
        //创建repelicator对象
        CAReplicatorLayer *repelicator = [CAReplicatorLayer layer];
        repelicator.bounds = CGRectMake(0, 0, 100, 100);
        repelicator.position = CGPointMake(self.contentView.frame.size.width/2, self.contentView.frame.size.height/2);
        repelicator.instanceCount = numofInstance;
        repelicator.instanceDelay = duration / numofInstance;
        //设置每个实例的变换样式
        repelicator.instanceTransform = CATransform3DMakeRotation(M_PI * 2.0 / 10.0, 0, 0, 1);
        //创建repelicator对象的子图层，repelicator会利用此子图层进行高效复制。并绘制到自身图层上
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, 8, 8);
        //子图层的仿射变换是基于repelicator图层的锚点，因此这里将子图层的位置摆放到此
        CGPoint point = [repelicator convertPoint:repelicator.position fromLayer:self.layer];
        layer.position = CGPointMake(point.x, point.y - 20);
        // 修改等待提示颜色
        layer.backgroundColor = [UIColor grayColor].CGColor;
        
        layer.cornerRadius = 5;
        layer.transform = CATransform3DMakeScale(0.01, 0.01, 1);
        _showlayer = layer;
        //将子图层添加到repelicator上
        [repelicator addSublayer:layer];
        _reaplicator = repelicator;
    }
    return _reaplicator;
}

@end


