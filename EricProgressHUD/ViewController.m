//
//  ViewController.m
//  WechatDemo
//
//  Created by eric on 16/10/31.
//  Copyright © 2016年 eric. All rights reserved.
//

#import "ViewController.h"
#import "EricProgressView.h"

//屏幕的宽度
#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height

/**
 * 宏定义颜色，使用16进制表示
 */
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define UIColorFromRGBWithAlpha(rgbValue,alp) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alp]


@interface ViewController ()


@property (nonatomic, weak) UIView* ball_1;
@property (nonatomic, weak) UIView* ball_2;
@property (nonatomic, weak) UIView* ball_3;

@property (nonatomic, strong) NSTimer* timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configurebuttons];
}


//围绕中心点旋转
-(void)configurebuttons
{
    UIButton* button = [[UIButton alloc]init];
    [button setImage:[UIImage imageNamed:@"qq"] forState:UIControlStateNormal];
    button.frame = CGRectMake(screenW*0.5-50, screenH*0.5-50, 100, 100);
    button.adjustsImageWhenHighlighted = NO;
    [button addTarget:self action:@selector(didclickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

-(void)didclickButton
{
    [SharedEricProgressView show];
    
    NSTimer* timer = [NSTimer timerWithTimeInterval:10 target:self selector:@selector(hiddenButton) userInfo:nil repeats:NO];
    self.timer = timer;
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
}

-(void)hiddenButton
{
    [SharedEricProgressView dismiss];
}

@end
