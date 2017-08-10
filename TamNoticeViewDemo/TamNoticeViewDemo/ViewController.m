//
//  ViewController.m
//  TamNoticeViewDemo
//
//  Created by xin chen on 2017/8/10.
//  Copyright © 2017年 涂怀安. All rights reserved.
//

#import "ViewController.h"
#import "TamNoticeView.h"

#define TamKey_window [UIApplication sharedApplication].keyWindow

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [TamNoticeView showNoticeViewInView:self.view title:@"主题" content:@"楼主帅的一批！\n楼主单身！\n楼主求女票一枚!\n哈哈！\n逗\n-.-"];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [TamNoticeView showNoticeViewInView:TamKey_window title:@"主题" content:@"楼主帅的一批！\n楼主单身！\n楼主求女票一枚!\n哈哈！\n逗\n-.-"];
}

@end
