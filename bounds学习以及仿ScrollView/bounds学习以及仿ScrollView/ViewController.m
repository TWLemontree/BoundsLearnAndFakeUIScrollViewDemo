//
//  ViewController.m
//  bounds学习以及仿ScrollView
//
//  Created by 抬头看见柠檬树 on 2017/2/14.
//  Copyright © 2017年 csip. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 仿scrollView
    UIView *myScrollView = [[UIView alloc] initWithFrame:self.view.bounds];
    myScrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:myScrollView];
    
    // 滑动手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGes:)];
    [myScrollView addGestureRecognizer:pan];
    
    // scrollView的内容
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 10, 10)];
    blueView.backgroundColor = [UIColor blueColor];
    [myScrollView addSubview:blueView];
}

- (void)panGes:(UIPanGestureRecognizer *)gesture
{
    UIView *myScrollView = gesture.view;
    
    // 获取滑动的位移量
    CGPoint transPoint = [gesture translationInView:myScrollView];
    NSLog(@"%@",NSStringFromCGPoint(transPoint));
    
    // 这里总感觉写错了，我脑子笨，有点绕不过来了。头疼
    CGRect bounds = myScrollView.bounds;
    bounds.origin.x -= transPoint.x;
    bounds.origin.y -= transPoint.y;
    myScrollView.bounds = bounds;
    
    // 复位
    [gesture setTranslation:CGPointZero inView:myScrollView];
}

#pragma mark - 演示bounds效果的Demo

- (void)testBounds
{
    // 红色的背景view
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    // 单击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick:)];
    [tap setNumberOfTouchesRequired:1];
    [view addGestureRecognizer:tap];
    
    // 蓝色的子view
    UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(0, 190, 10, 10)];
    subView.backgroundColor = [UIColor blueColor];
    [view addSubview:subView];
}

- (void)viewClick:(UITapGestureRecognizer *)gesture
{
    // 获取红色view
    UIView *view = gesture.view;
    
    // 修改bounds的值
    CGRect bounds = view.bounds;
    bounds.origin.y += 5;
    view.bounds = bounds;
    
    // 展示bounds的值
    NSLog(@"bounds:%@",NSStringFromCGRect(view.bounds));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
