//
//  TamNoticeView.h
//  TamNoticeViewDemo
//
//  Created by xin chen on 2017/8/10.
//  Copyright © 2017年 涂怀安. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TamNoticeView : UIView

/**
 *  简单的广告弹框信息
 *
 *  @param view    添加在视图
 *  @param title   主题
 *  @param content 内容
 *
 *  @return 自己
 */
+(TamNoticeView *)showNoticeViewInView:(UIView *)view title:(NSString *)title content:(NSString *)content;

@end
