//
//  TamNoticeView.m
//  TamNoticeViewDemo
//
//  Created by xin chen on 2017/8/10.
//  Copyright © 2017年 涂怀安. All rights reserved.
//

#import "TamNoticeView.h"

#define TamScreenH [UIScreen mainScreen].bounds.size.height
#define TamScreenW [UIScreen mainScreen].bounds.size.width

#define TamTitleFont [UIFont systemFontOfSize:20]//标题字体
#define TamContentFont [UIFont systemFontOfSize:18]//内容字体
static const CGFloat margin = 20;//关闭按钮与内容间距

@interface TamNoticeView()

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *content;

@property(nonatomic,strong)UIView *contentView;
@property(nonatomic,strong)UIButton *closeBtn;

@end

@implementation TamNoticeView

+(TamNoticeView *)showNoticeViewInView:(UIView *)view title:(NSString *)title content:(NSString *)content
{
    for (id sub in view.subviews) {
        if ([sub isKindOfClass:[TamNoticeView class]]) {
            [sub removeFromSuperview];
        }
    }
    TamNoticeView *noticeView = [[TamNoticeView alloc]init];
    noticeView.title = title;
    noticeView.content = content;
    noticeView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
    noticeView.frame = view.bounds;
    [view addSubview:noticeView];
   
    [noticeView setupUI];
    [UIView animateWithDuration:1.0 animations:^{
        CGRect rect1 = noticeView.contentView.frame;
        rect1.origin.y = TamScreenH/2-[noticeView getContentViewH]/2;
        noticeView.contentView.frame = rect1;
        
        CGRect rect2 = noticeView.closeBtn.frame;
        rect2.origin.y = noticeView.contentView.frame.origin.y+noticeView.contentView.frame.size.height+margin;
        noticeView.closeBtn.frame = rect2;
    }];
    return noticeView;
}

-(void)dismiss
{
    [UIView animateWithDuration:1.0 animations:^{
        CGRect rect1 = self.contentView.frame;
        rect1.origin.y = TamScreenH+40+margin;
        self.contentView.frame = rect1;
        
        CGRect rect2 = self.closeBtn.frame;
        rect2.origin.y = TamScreenH;
        self.closeBtn.frame = rect2;

    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

//获取内容高
-(CGFloat)getContentViewH
{
    NSDictionary *attrs = @{NSFontAttributeName : TamTitleFont};
    return 30+10+[self.content boundingRectWithSize:CGSizeMake(TamScreenW-30*2-10*2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.height;
}

-(void)setupUI
{
    UIView *contentView = [[UIView alloc]init];
    self.contentView = contentView;
    contentView.frame = CGRectMake(30, -[self getContentViewH]-margin-40, TamScreenW-30*2, [self getContentViewH]);
    contentView.backgroundColor = [UIColor whiteColor];
    contentView.layer.masksToBounds = YES;
    contentView.layer.cornerRadius = 5;
    [self addSubview:contentView];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    titleLabel.font = TamTitleFont;
    titleLabel.text = self.title;
    titleLabel.frame = CGRectMake(0, 0, contentView.frame.size.width, 30);
    [contentView addSubview:titleLabel];
    
    UILabel *contentLabel = [[UILabel alloc]init];
    if ([self getContentViewH] < 70) {
        contentLabel.textAlignment = NSTextAlignmentCenter;
    }else{
        contentLabel.textAlignment = NSTextAlignmentLeft;
    }
    contentLabel.numberOfLines = 0;
    contentLabel.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    contentLabel.text = self.content;
    contentLabel.frame = CGRectMake(10, CGRectGetMaxY(titleLabel.frame), contentView.frame.size.width-10*2, contentView.frame.size.height-titleLabel.frame.size.height-10);
    [contentView addSubview:contentLabel];

    UIButton *closeBtn = [[UIButton alloc]init];
    self.closeBtn = closeBtn;
    [closeBtn addTarget:self action:@selector(clickCloseBtn:) forControlEvents:UIControlEventTouchUpInside];
    closeBtn.frame = CGRectMake(TamScreenW/2-40/2, -40, 40, 40);
    [closeBtn setImage:[UIImage imageNamed:@"TamExit"] forState:UIControlStateNormal];
    [self addSubview:closeBtn];
}

-(void)clickCloseBtn:(UIButton *)sender
{
    [self dismiss];
}

@end
