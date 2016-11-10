//
//  EricProgressView.m
//  WechatDemo
//
//  Created by eric on 16/11/9.
//  Copyright © 2016年 eric. All rights reserved.
//  一个旋转的弹出窗口

#import "EricProgressView.h"
//屏幕的宽度
#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height


@interface EricProgressView()
@property (nonatomic, weak) UIImageView* imageViewMove;
//旋转动画
@property (nonatomic, strong) CABasicAnimation* animation;
@end
@implementation EricProgressView

+(EricProgressView*)sharedView
{
    static dispatch_once_t once;
    
    static EricProgressView* sharedView;
    
    dispatch_once(&once, ^{
        sharedView = [[self alloc]initWithFrame:[[[UIApplication sharedApplication] delegate] window].bounds];
    });
    return sharedView;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        
        UIView* baseView = [[UIView alloc]init];
        baseView.layer.cornerRadius = 15.f;
        baseView.clipsToBounds = YES;
        baseView.backgroundColor = [UIColor colorWithHue:99/255 saturation:99/255 brightness:99/255 alpha:0.5];
        baseView.frame = CGRectMake(screenW*0.5-50, screenH*0.5-50, 100, 100);
        [self addSubview:baseView];
        
        UIImageView* imageViewMove = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"media_point_HUD"]];
        imageViewMove.frame = CGRectMake(10, 10, 80, 80);
        [baseView addSubview:imageViewMove];
        self.imageViewMove = imageViewMove;
        
        
        UIImageView* imageViewStop = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"media_logo_HUD"]];
        imageViewStop.frame = CGRectMake(30, 30, 40, 40);
        [baseView addSubview:imageViewStop];
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        animation.duration = 2.5;
        animation.repeatCount = MAXFLOAT;
        animation.fromValue = [NSNumber numberWithFloat:0.0];//起始角度
        animation.toValue = [NSNumber numberWithFloat:2*M_PI];//终止角度
        self.animation = animation;
    }
    return self;
}


//围绕中心点旋转
-(void)show
{
    [[[UIApplication sharedApplication]keyWindow] addSubview:self];
    //添加动画
     [self.imageViewMove.layer addAnimation:self.animation forKey:@"button"];
}

//隐藏
-(void)dismiss
{
    [self removeFromSuperview];
    [self.imageViewMove.layer removeAllAnimations];
}
@end
