//
//  YYAnimationView.m
//  YYAnimation
//
//  Created by yunyunzhang on 2018/8/7.
//  Copyright © 2018年 yunyunzhang. All rights reserved.
//

#import "YYAnimationView.h"
#import "UIView+Additions.h"

@interface YYAnimationView()<CAAnimationDelegate>
@property (nonatomic,strong) UIImageView * bigStar;
@property (nonatomic,strong) UIImageView * smallStar;
@end

@implementation YYAnimationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI
{
    _bigStar = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"星星1"]];
    [self addSubview:_bigStar];
    
    _smallStar = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"星星2"]];
    _smallStar.left = 14;
    _smallStar.top = 13;
    [self addSubview:_smallStar];
}

- (void)startAnimation
{
    CABasicAnimation * rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    _smallStar.layer.anchorPoint = CGPointMake(0.5, 0.5);
    rotationAnimation.fromValue = [NSNumber numberWithFloat:2 * M_PI];
    rotationAnimation.toValue = [NSNumber numberWithFloat:0.0];
    rotationAnimation.duration = 1.0f;
    rotationAnimation.repeatCount = 6;
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    rotationAnimation.fillMode = kCAFillModeForwards;
    [_smallStar.layer addAnimation:rotationAnimation forKey:nil];
    
    CGPoint p1=CGPointMake(self.layer.position.x, self.layer.position.y);
    CGPoint p2=CGPointMake(self.layer.position.x, self.layer.position.y - 3);
    CGPoint p3=CGPointMake(self.layer.position.x, self.layer.position.y + 4);
    CGPoint p4=CGPointMake(self.layer.position.x, self.layer.position.y);
    NSArray *values=[NSArray arrayWithObjects:[NSValue valueWithCGPoint:p1],[NSValue valueWithCGPoint:p2],[NSValue valueWithCGPoint:p3],[NSValue valueWithCGPoint:p4], nil];
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.delegate = self;
    animation.values = values;
    animation.repeatCount = 3;
    animation.duration = 2.1f;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.layer addAnimation:animation forKey:nil];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    self.hidden = YES;
}

@end
