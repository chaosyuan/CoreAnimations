//
//  CABasicController.m
//  CoreAnimations
//
//  Created by yuanwei on 16/3/18.
//  Copyright © 2016年 YuanWei. All rights reserved.
//



#import "CABasicController.h"

@interface CABasicController()

@property (nonatomic,strong) UIView *rectView;

@end

@implementation CABasicController


- (void)viewDidLoad{
    
    [super viewDidLoad];

    [self.view addSubview:self.rectView];
}
- (UIView *)rectView{
    if (!_rectView) {
        _rectView = [[UIView alloc] initWithFrame:CGRectMake(140, 250, 100, 100)];
        self.rectView.backgroundColor = [UIColor redColor];
        _rectView.backgroundColor = [UIColor purpleColor];
    }
    return _rectView;
}

- (IBAction)basicClick:(id)sender{

    UIButton *btn = (UIButton *)sender;
    switch (btn.tag) {
        case 1001:
            [self moveView];
            break;
        case 1002:
               [self zoomView];
            break;
        case 1003:
            [self rotateView];
            break;
        case 1004:
            [self combinationView];
            break;
            
        default:
            break;
    }
}
// 移动
- (void)moveView{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 120)];
    animation.toValue   = [NSValue valueWithCGPoint:CGPointMake(K_width, K_height/2+85)];
    animation.duration = 2.0f;
    animation.autoreverses = YES;
    
    // 动画执行完毕后，图层会保持显示动画执行后的状态
//    animation.removedOnCompletion = NO;
//    animation.fillMode = kCAFillModeForwards;
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.rectView.layer addAnimation:animation forKey:@"moveViewLayer"];
}

// 旋转
- (void)rotateView{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.duration = 2.5f;
    animation.fromValue = [NSNumber numberWithFloat:0.0f];
    animation.toValue = [NSNumber numberWithFloat:M_PI];
    [self.rectView.layer addAnimation:animation forKey:@"rotateLayer"];
    
}
// 缩放
- (void)zoomView{
    
    CABasicAnimation *animate = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animate.duration = 2.5f;
    animate.toValue = [NSNumber numberWithFloat:2.0];
    [self.rectView.layer addAnimation:animate forKey:@"animateScale"];
}
// 组合
- (void)combinationView{
    
    // 动画1（在X轴方向移动）
    CABasicAnimation *animation1 =
    [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    // 终点设定
    animation1.toValue = [NSNumber numberWithFloat:80];;
    
    // 动画2（绕Z轴中心旋转
    CABasicAnimation *animation2 =
    [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    // 设定旋转角度
    animation2.fromValue = [NSNumber numberWithFloat:0.0];
    animation2.toValue = [NSNumber numberWithFloat:2 * M_PI];
    
    //动画2
    CABasicAnimation *animation3 =
    [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation3.toValue = [NSNumber numberWithFloat:1.5f];
    
    // 动画组
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    // 动画选项设定
    group.duration = 3.0;
    group.repeatCount = 1;
    group.autoreverses = YES;
    
    // 添加动画
    group.animations = [NSArray arrayWithObjects:animation1, animation2,animation3, nil];
    [self.rectView.layer addAnimation:group forKey:@"Comlayer"];
}

@end
