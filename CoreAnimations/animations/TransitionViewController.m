//
//  TransitionViewController.m
//  CoreAnimations
//
//  Created by yuanwei on 16/3/19.
//  Copyright © 2016年 YuanWei. All rights reserved.
//

#import "TransitionViewController.h"

@interface TransitionViewController ()

@property (nonatomic,strong) UIView *rectView;
@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) NSArray *operateTitleArray;

@property (nonatomic,assign) NSInteger index;

@end

@implementation TransitionViewController


-(void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.rectView];
    [self.rectView addSubview:self.titleLabel];
}

- (void)viewDidLoad {
    [super viewDidLoad];
      _index = 0;
 
    self.operateTitleArray =  @[@"fade",@"moveIn",@"push",@"reveal",@"cube",@"suck",@"oglFlip",@"ripple",@"Curl",@"UnCurl",@"caOpen",@"caClose"];
    
    [self initView];
    [self changeView:YES];
}




- (void)initView{
    
    if(_operateTitleArray && _operateTitleArray.count > 0){
        NSUInteger row = _operateTitleArray.count % 4 == 0 ? _operateTitleArray.count/4 : _operateTitleArray.count/4 + 1;
        UIView *buttomView = [[UIView alloc] initWithFrame:CGRectMake(0, K_height-(row*50+20), K_width, row * 50 + 20)];
        [self.view addSubview:buttomView];
        for (int i = 0; i < _operateTitleArray.count; i++) {
         
            UIButton *btn = [[UIButton alloc] initWithFrame:[self rectForBtnAtIndex:i totalNum:_operateTitleArray.count]];
            [btn setTitle:_operateTitleArray[i] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:12];
            btn.backgroundColor = [UIColor lightGrayColor];
            btn.tag = i;
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [buttomView addSubview:btn];
        }
    }
}

- (void)btnClick:(UIButton *)button{
    switch (button.tag) {
        case 0:
            [self fadeAnimation];
            break;
        case 1:
            [self moveInAnimation];
            break;
        case 2:
            [self pushAnimation];
            break;
        case 3:
            [self revealAnimation];
            break;
        case 4:
            [self cubeAnimation];
            break;
        case 5:
            [self suckEffectAnimation];
            break;
        case 6:
            [self oglFlipAnimation];
            break;
        case 7:
            [self rippleEffectAnimation];
            break;
        case 8:
            [self pageCurlAnimation];
            break;
        case 9:
            [self pageUnCurlAnimation];
            break;
        case 10:
            [self cameraOpenAnimation];
            break;
        case 11:
            [self cameraCloseAnimation];
            break;
        default:
            break;
    }
}
/**
 *  type    动画过渡的类型
 *  subtype 动画过渡方向
 */

// 渐变效果
- (void)fadeAnimation{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionFade;// 动画过渡的类型
    anima.subtype = kCATransitionFromRight; // 动画过渡方向
    anima.duration = 1.0f;
    [_rectView.layer addAnimation:anima forKey:@"fadeAnimation"];
}

- (void)moveInAnimation{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionMoveIn;
    anima.subtype = kCATransitionFromRight;
    anima.duration = 1.0f;
    [_rectView.layer addAnimation:anima forKey:@"moveInAnimation"];
}

- (void)pushAnimation{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionPush;
    anima.subtype = kCATransitionFromRight;
    anima.duration = 1.0f;
    [_rectView.layer addAnimation:anima forKey:@"pushAnimation"];
}

- (void)revealAnimation{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = kCATransitionReveal;
    anima.subtype = kCATransitionFromRight;
    anima.duration = 1.0f;
    [_rectView.layer addAnimation:anima forKey:@"revealAnimation"];
}


// 立体翻滚
- (void)cubeAnimation{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"cube";
    anima.subtype = kCATransitionFromRight;
    anima.duration = 1.0f;
    
    [_rectView.layer addAnimation:anima forKey:@"cubeAnimation"];
}


- (void)suckEffectAnimation{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"suckEffect";
    anima.subtype = kCATransitionFromRight;
    anima.duration = 1.0f;
    
    [_rectView.layer addAnimation:anima forKey:@"suckEffectAnimation"];
}

-(void)oglFlipAnimation{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"oglFlip";
    anima.subtype = kCATransitionFromRight;
    anima.duration = 1.0f;
    
    [_rectView.layer addAnimation:anima forKey:@"oglFlipAnimation"];
}

- (void)rippleEffectAnimation{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"rippleEffect";
    anima.subtype = kCATransitionFromRight;
    anima.duration = 1.0f;
    
    [_rectView.layer addAnimation:anima forKey:@"rippleEffectAnimation"];
}

- (void)pageCurlAnimation{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"pageCurl";
    anima.subtype = kCATransitionFromRight;
    anima.duration = 1.0f;
    
    [_rectView.layer addAnimation:anima forKey:@"pageCurlAnimation"];
}

-(void)pageUnCurlAnimation{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"pageUnCurl";
    anima.subtype = kCATransitionFromRight;
    anima.duration = 1.0f;
    
    [_rectView.layer addAnimation:anima forKey:@"pageUnCurlAnimation"];
}

- (void)cameraOpenAnimation{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"cameraIrisHollowOpen";
    anima.subtype = kCATransitionFromRight;
    anima.duration = 1.0f;
    
    [_rectView.layer addAnimation:anima forKey:@"cameraOpenAnimation"];
}

- (void)cameraCloseAnimation{
    [self changeView:YES];
    CATransition *anima = [CATransition animation];
    anima.type = @"cameraIrisHollowClose";
    anima.subtype = kCATransitionFromRight;
    anima.duration = 1.0f;
    
    [_rectView.layer addAnimation:anima forKey:@"cameraCloseAnimation"];
}
/*-----------------------------------------------------------*/
- (UILabel *)titleLabel{
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(_rectView.frame)/2-10, CGRectGetHeight(_rectView.frame)/2-20, 20, 40)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:40];
    }
    return _titleLabel;
}

- (UIView*)rectView{
    
    if (!_rectView) {
        _rectView = [[UIView alloc] initWithFrame:CGRectMake(K_width/2 - 90, K_height/2 - 200,180,260)];
        _rectView.backgroundColor = [UIColor purpleColor];
    }
    return _rectView;
}

- (CGRect)rectForBtnAtIndex : (NSUInteger)index totalNum : (NSUInteger)totleNum{
    // 每一行最多显示4个
    NSUInteger maxColumnNum = 4;
    // 每个按钮的列间距
    CGFloat columnMargin = 20;
    // 每个按钮的行间距
    CGFloat rowMargin = 20;

 
    //每个按钮的宽度
    CGFloat width = (K_width - columnMargin * 5)/4;
    //每个按钮的高度
    CGFloat height = 30;
    
    //每个按钮的偏移
    CGFloat offsetX = columnMargin+(index % maxColumnNum)*(width + columnMargin);
    CGFloat offsetY = rowMargin+(index/maxColumnNum) * (height+rowMargin);
    
    return CGRectMake(offsetX, offsetY, width, height);
}

-(void)changeView:(BOOL)isUp{
    if (_index>3) {
        _index = 0;
    }
    if (_index<0) {
        _index = 3;
    }
    NSArray *colors = [NSArray arrayWithObjects:[UIColor purpleColor],[UIColor greenColor],[UIColor blueColor],[UIColor brownColor], nil];
    NSArray *titles = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
    _rectView.backgroundColor = [colors objectAtIndex:_index];
    _titleLabel.text = [titles objectAtIndex:_index];
    if (isUp) {
        _index++;
    }else{
        _index--;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
