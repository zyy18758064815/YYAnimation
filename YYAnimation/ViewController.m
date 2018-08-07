//
//  ViewController.m
//  YYAnimation
//
//  Created by yunyunzhang on 2018/8/7.
//  Copyright © 2018年 yunyunzhang. All rights reserved.
//

#import "ViewController.h"
#import "YYAnimationView.h"
#import "UIView+Additions.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *start;
@property (nonatomic,strong) YYAnimationView * animateView;
@end

@implementation ViewController
- (IBAction)action:(id)sender
{
    _animateView.hidden = NO;
    [_animateView startAnimation];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _animateView = [[YYAnimationView alloc]initWithFrame:CGRectMake(0, 250, 28, 28)];
    _animateView.centerX = [UIScreen mainScreen].bounds.size.width/2;
    _animateView.hidden = YES;
    [self.view addSubview:_animateView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
