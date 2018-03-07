//
//  MainViewController.m
//  RSADemo
//
//  Created by qixin on 2018/3/7.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "MainViewController.h"
#import "SpeechToTextViewController.h"
#import "Contants.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"main";
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50, 100, 100, 30)];
    [btn setTitle:@"speech" forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(toSpeech:) forControlEvents:(UIControlEventTouchUpInside)];
    [btn setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:btn];
    
    NSLog(@"device width :%lf", DEVICE_WIDTH);
    NSLog(@"device height :%lf", DEVICE_HEIGHT);
    NSLog(@"device status bar height :%lf", STATUS_BAR_HEIGHT);
    NSLog(@"device navigation bar height :%lf", NAVIGATION_BAR_HEIGHT);
}

-(void)toSpeech:(id)sender{
    SpeechToTextViewController *spVC = [SpeechToTextViewController new];
    [self.navigationController pushViewController:spVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
