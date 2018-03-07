//
//  SpeechToTextViewController.m
//  RSADemo
//
//  Created by qixin on 2018/3/7.
//  Copyright © 2018年 qixin. All rights reserved.
//

#import "SpeechToTextViewController.h"
#import "Contants.h"

@interface SpeechToTextViewController ()<UITextViewDelegate>

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UIButton *btn;

@end

@implementation SpeechToTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"speech test";
    // 标题
    _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 100, 50)];
    [_label setText:@"语音测试"];
    [_label setTextColor:[UIColor blueColor]];
    [_label setFont:[UIFont systemFontOfSize:18.0]];
    [_label setTextAlignment:(NSTextAlignmentCenter)];
    [self.view addSubview:_label];
    
    _textView = [[UITextView alloc]initWithFrame:(CGRectMake(50, 150, 300, 200))];
    [_textView setFont:[UIFont systemFontOfSize:16.0]];
    [_textView setTextColor:[UIColor blackColor]];
    _textView.layer.borderColor = [UIColor grayColor].CGColor;
    _textView.layer.borderWidth = 1.0;
    _textView.delegate = self;
    [self.view addSubview:_textView];
    
    _btn = [[UIButton alloc]initWithFrame:CGRectMake(50, 400, 100, 30)];
    [_btn setTitle:@"microphone" forState:(UIControlStateNormal)];
    [_btn setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    [_btn addTarget:self action:@selector(btnTap:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_btn];
}

-(void)btnTap:(id)sender{
    [SFSpeechRecognizer requestAuthorization:^(SFSpeechRecognizerAuthorizationStatus status) {
        
        switch (status) {
            case SFSpeechRecognizerAuthorizationStatusAuthorized:
            {
                NSLog(@"语音识别授权成功");
                [self toNext:nil];
            }
                break;
                
            default:
            {
                NSLog(@"语音识别授权未成功， status:%ld", status);
                
                // TODO
                // 引导用户打开语音授权
            }
                break;
        }
    }];
}

-(void)toNext:(id)sender{
    //创建语音识别操作类对象
    SFSpeechRecognizer * rec = [[SFSpeechRecognizer alloc]init];
    //通过一个音频路径创建音频识别请求
    SFSpeechRecognitionRequest * request = [[SFSpeechURLRecognitionRequest alloc]initWithURL:[[NSBundle mainBundle] URLForResource:@"7011" withExtension:@"m4a"]];
    //进行请求
    [rec recognitionTaskWithRequest:request resultHandler:^(SFSpeechRecognitionResult * _Nullable result, NSError * _Nullable error) {
        //打印语音识别的结果字符串
        NSLog(@"%@",result.bestTranscription.formattedString);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --- UITextViewDelegate ---
-(void)textViewDidBeginEditing:(UITextView *)textView{
    NSLog(@"textView Did begin editing.");
}
- (void)textViewDidChange:(UITextView*)textView {
    NSLog(@"textViewDidChange");
}
- (void)textViewDidChangeSelection:(UITextView*)textView {
    NSLog(@"textViewDidChangeSelection");
}
- (void)textViewDidEndEditing:(UITextView*)textView {
    NSLog(@"textViewDidEndEditing");
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [_textView resignFirstResponder];
}
#pragma mark --- ---

@end
