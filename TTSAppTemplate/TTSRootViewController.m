//
//  ViewController.m
//  TTSAppTemplate
//
//  Created by tieshan on 15/7/13.
//  Copyright (c) 2015年 铁山. All rights reserved.
//

#import "TTSRootViewController.h"
#import "CALineView.h"

#define MAIN_PAGE_COLUMNS       4
#define MAIN_PAGE_ITEMS_NUM     20

@interface TTSRootViewController ()

@end

@implementation TTSRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //添加UI
    [self addView];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 
#pragma mark - Private Action
/**
 *	@brief	添加UI 私有方法
 *
 */
- (void)addView
{
    //设置界面的背景颜色
    self.view.backgroundColor = WHITE_COLOR;
    
    //计算按钮的宽度
    CGFloat buttonWidth = [self.view viewWidth] / MAIN_PAGE_COLUMNS;
    
    //添加菜单按钮
    for (int i = 0; i < MAIN_PAGE_ITEMS_NUM; i++) {
        UIButton * oneItemButton = [UIButton buttonWithType:UIButtonTypeCustom];
        oneItemButton.frame = CGRectMake((i % MAIN_PAGE_COLUMNS) * buttonWidth, (i / MAIN_PAGE_COLUMNS) * buttonWidth, buttonWidth, buttonWidth);
        oneItemButton.tag = i + 1;
        [oneItemButton setTitle:[NSString stringWithFormat:@"item %d", i] forState:UIControlStateNormal];
        [oneItemButton setTitleColor:BLACK_COLOR forState:UIControlStateNormal];
        [self.view addSubview:oneItemButton];
    }
    
    //添加分割线
    CALineView * oneLine = [[CALineView alloc] initWithFrame:CGRectMake(80, 0, 1.0f, [self.view viewHeight]) andLinePosi:TTSLinePositionLeft];
    oneLine.lineType = TTSRealLine;
    oneLine.lineWidth = 0.5;
    oneLine.lineColor = COLOR_FROM_RGB(188, 188, 188, 1.0f);
    [self.view addSubview:oneLine];
    [oneLine release];
}

@end
