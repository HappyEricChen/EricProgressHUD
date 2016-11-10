//
//  EricProgressView.h
//  WechatDemo
//
//  Created by eric on 16/11/9.
//  Copyright © 2016年 eric. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SharedEricProgressView [EricProgressView sharedView]

@interface EricProgressView : UIView

+(EricProgressView*)sharedView;

//显示
- (void) show;
//隐藏
- (void) dismiss;
@end
