//
//  CAKeyFrameViewController.m
//  CoreAnimations
//
//  Created by yuanwei on 16/3/18.
//  Copyright © 2016年 YuanWei. All rights reserved.
//

#import "CAKeyFrameViewController.h"

@interface CAKeyFrameViewController ()

@property (nonatomic,strong) UIView *rectView;

@end

@implementation CAKeyFrameViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view addSubview:self.rectView];
}
- (UIView*)rectView{

    if (!_rectView) {
        _rectView = [[UIView alloc] initWithFrame:CGRectMake(K_width/2-25, K_height/2-50,60,60)];
        _rectView.backgroundColor = [UIColor purpleColor];
    }
    return _rectView;
}

- (IBAction)KeyClick:(UIButton *)sender{
    
    switch (sender.tag) {
        case 2001:
            [self keyFrameAnimation];
            break;
        case 2002:
            [self pathAnimation];
            break;
        case 2003:
            [self shakeAnimation];
            break;
        case 2004:
            [self rotationAnimation];
            break;
        default:
            break;
    }
}

// 关键帧动画
- (void)keyFrameAnimation{
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, K_height/2 - 60)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(K_width/3, K_height/2 - 60)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(K_width/3, K_height/2 + 60)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(K_width/2*3, K_height/2 + 60)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(K_width/2*3, K_height/2 - 60)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(K_width, K_height/2 - 60)];
    animation.values = @[value0,value1,value2,value3,value4,value5];
    animation.duration = 2.f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]; // 设置动画的节奏
    animation.delegate = self; // 设置代理 检测动画的开始 结束
    [_rectView.layer addAnimation:animation forKey:@"keyFrameAnimation"];
}
// 路径
- (void)pathAnimation{
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(K_width/2 - 100, K_height/2 - 100, 200, 200)];
    keyAnimation.duration = 2.0f;
    keyAnimation.path = path.CGPath;
    keyAnimation.delegate = self;
    [_rectView.layer addAnimation:keyAnimation forKey:@"pathAnimation"];
}
// 抖动
- (void)shakeAnimation{
    CAKeyframeAnimation *shakeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    NSValue *value1 = [NSNumber numberWithFloat:-M_PI/M_PI_2 * 4];
    NSValue *value2 = [NSNumber numberWithFloat:M_PI/M_PI_2 * 4];
    NSValue *value3 = [NSNumber numberWithFloat:-M_PI/M_PI_2 * 4];
    shakeAnimation.values = @[value1,value2,value3];
    shakeAnimation.repeatCount = 3;
    shakeAnimation.delegate = self;
    [_rectView.layer addAnimation:shakeAnimation forKey:@"shakeAnimation"];
}
// 旋转
- (void)rotationAnimation{
    
    CAKeyframeAnimation *rotAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    CATransform3D rotation1 = CATransform3DMakeRotation(30 * M_PI/180, 0, 0, -1);
    CATransform3D rotation2 = CATransform3DMakeRotation(60 * M_PI/180, 0, 0, -1);
    CATransform3D rotation3 = CATransform3DMakeRotation(90 * M_PI/180, 0, 0, -1);
    CATransform3D rotation4 = CATransform3DMakeRotation(120 * M_PI/180, 0, 0, -1);
    CATransform3D rotation5 = CATransform3DMakeRotation(150 * M_PI/180, 0, 0, -1);
    CATransform3D rotation6 = CATransform3DMakeRotation(180 * M_PI/180, 0, 0, -1);
    
    [rotAnimation setValues:[NSArray arrayWithObjects:
                        [NSValue valueWithCATransform3D:rotation1],
                        [NSValue valueWithCATransform3D:rotation2],
                        [NSValue valueWithCATransform3D:rotation3],
                        [NSValue valueWithCATransform3D:rotation4],
                        [NSValue valueWithCATransform3D:rotation5],
                        [NSValue valueWithCATransform3D:rotation6],
                        nil]];
    [rotAnimation setKeyTimes:[NSArray arrayWithObjects:
                          [NSNumber numberWithFloat:0.0],
                          [NSNumber numberWithFloat:0.2f],
                          [NSNumber numberWithFloat:0.4f],
                          [NSNumber numberWithFloat:0.6f],
                          [NSNumber numberWithFloat:0.8f],
                          [NSNumber numberWithFloat:1.0f],
                          nil]];
    rotAnimation.duration = 4.0f;
    rotAnimation.fillMode = kCAFillModeForwards;
    [rotAnimation setRemovedOnCompletion:NO];
    [_rectView.layer addAnimation:rotAnimation forKey:nil];
}
- (void)animationDidStart:(CAAnimation *)anim{

    NSLog(@"开始动画");
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"结束动画");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
