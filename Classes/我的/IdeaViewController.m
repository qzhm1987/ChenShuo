//
//  IdeaViewController.m
//  Elevator
//
//  Created by Mac on 2017/1/12.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "IdeaViewController.h"
#import "QTextView.h"

@interface IdeaViewController ()<UITextViewDelegate>
{
    QTextView *textView;
}
@end

@implementation IdeaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor groupTableViewBackgroundColor];
    self.title = @"意见反馈";
    textView = [[QTextView alloc]initWithFrame:CGRectMake(25, 20*PIX, SCREEN_WIDTH-50, 200*PIX)];
    textView.placeholder=@"意见反馈信息";
    textView.delegate = self;
    textView.font = [UIFont systemFontOfSize:15.0f];
    textView.layer.cornerRadius = 5.0f;
    textView.layer.borderWidth = 1.0f;
    textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    
    [self.view addSubview:textView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(30, 300*PIX, SCREEN_WIDTH-60, 40*PIX);
    button.layer.cornerRadius = 5.0f;
    button.titleLabel.font =[UIFont systemFontOfSize:16*PIX];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    button.backgroundColor =Theme_Color;
    
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
    
    
    
    // Do any additional setup after loading the view.
}

-(void)btnClick:(UIButton *)button{
    if (textView.text.length<1) {
        [self.view makeToast:@"暂无意见反馈信息"];
        return;
        
    }
    if (textView.text.length>450) {
         [self.view makeToast:@"内容不超过450字"];
        return;
    }
    else{
    }
    
    
    
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
