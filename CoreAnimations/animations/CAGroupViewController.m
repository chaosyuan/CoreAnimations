//
//  CAGroupViewController.m
//  CoreAnimations
//
//  Created by yuanwei on 16/3/19.
//  Copyright © 2016年 YuanWei. All rights reserved.
//

#import "CAGroupViewController.h"

@interface CAGroupViewController ()

@property (nonatomic,strong) UIView *rectView;

@end

@implementation CAGroupViewController

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

- (IBAction)groupClick:(UIButton *)sender{
    switch (sender.tag) {
        case 3001:
            
            NSLog(@"组合");
            [self besidesAnimation];
            break;
        case 3002:
            [self serialAnimation];
            break;
        default:
            break;
    }
}
// 同时
- (void)besidesAnimation{
    
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, K_height/2 - 60)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(K_width/3, K_height/2 - 60)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(K_width, K_height/2 + 60)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(K_width/2*3, K_height/2 + 60)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(K_width/2*3, K_height/2 - 60)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(K_width, K_height/2 - 60)];
    keyAnimation.values = @[value0,value1,value2,value3,value4,value5];
    
    CABasicAnimation *scaleAni = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAni.fromValue = [NSNumber numberWithFloat:0.8f];
    scaleAni.toValue   = [NSNumber numberWithFloat:2.f];
    
    CABasicAnimation *rotAni = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotAni.toValue = [NSNumber numberWithFloat:M_PI * 4];
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[keyAnimation,scaleAni,rotAni];
    groupAnimation.duration = 4.f;
    
    [_rectView.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
}
// 连续
- (void)serialAnimation{

    CFTimeInterval currentTime = CACurrentMediaTime();

    CABasicAnimation *animation0 = [CABasicAnimation animationWithKeyPath:@"position"];
    animation0.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, K_height/2 - 75)];
    animation0.toValue   = [NSValue valueWithCGPoint:CGPointMake(K_width/2, K_height/2 - 75)];
    animation0.beginTime = currentTime;
    animation0.duration  = 1.f;
    animation0.fillMode  = kCAFillModeForwards;
    animation0.removedOnCompletion = NO;
    [_rectView.layer addAnimation:animation0 forKey:@"move"];
    

    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation1.fromValue = [NSNumber numberWithFloat:0.8f];
    animation1.toValue   = [NSNumber numberWithFloat:2.0f];
    animation1.beginTime = currentTime + 1.0f;
    animation1.duration  = 1.0f;
    animation1.fillMode  = kCAFillModeForwards;
    animation1.removedOnCompletion = NO;
    [_rectView.layer addAnimation:animation1 forKey:@"scale"];
    
    //旋转动画
    CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation3.toValue   = [NSNumber numberWithFloat:-M_PI * 4];
    animation3.beginTime = currentTime + 2.0f;
    animation3.duration  = 1.0f;
    animation3.fillMode  = kCAFillModeForwards;
    animation3.removedOnCompletion = NO;
    [_rectView.layer addAnimation:animation3 forKey:@"rotation"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
