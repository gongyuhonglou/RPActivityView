//
//  RPActivityView.h
//  RPActivityView
//
//  Created by mac on 2018/3/23.
//  Copyright © 2018年 WRP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RPActivityView : UIView
@property (nonatomic, strong) CAReplicatorLayer *reaplicator;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) CALayer *showlayer;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign) NSInteger showTimes;

/**  显示活动指示器 */
- (void)showActiviTy;
/**  关闭活动指示器 */
- (void)hideActiviTy;
@end

