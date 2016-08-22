//
//  ViewController.m
//  CoreAnimations
//
//  Created by yuanwei on 16/3/17.
//  Copyright © 2016年 YuanWei. All rights reserved.
//

#import "ViewController.h"
#import "TransitionViewController.h"

@interface ViewController ()

@property (nonatomic,strong) NSArray *dataList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return [self.dataList count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = _dataList[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Animations" bundle:nil];
    UIViewController *Vc = nil;
    
    switch (indexPath.row) {
        case 0:
           Vc  = [board instantiateViewControllerWithIdentifier:@"CABasicAnimate"];
            break;
        case 1:
           Vc  = [board instantiateViewControllerWithIdentifier:@"CAKeyFrameAnimate"];
            break;
        case 2:
            Vc  = [board instantiateViewControllerWithIdentifier:@"CAGroupAnimate"];
            break;
        case 3:
            Vc  = [[TransitionViewController alloc] init];
            break;
        default:
            break;
    }
    [self.navigationController pushViewController:Vc animated:YES];
}

- (NSArray *)dataList{
    if (!_dataList) {
        _dataList = @[@"基础动画",@"关键帧动画",@"组动画",@"过渡动画"];
    }
    return _dataList;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
