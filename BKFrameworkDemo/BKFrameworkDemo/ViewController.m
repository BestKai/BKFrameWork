//
//  ViewController.m
//  BKFrameworkDemo
//
//  Created by bestkai on 2017/3/15.
//  Copyright © 2017年 bestkai. All rights reserved.
//

#import "ViewController.h"
#import "BKFramework/BKFramework.h"

@interface ViewController ()

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 60,self.view.frame.size.width , 200)];
    textView.layer.borderColor = [UIColor redColor].CGColor;
    textView.layer.borderWidth = 0.5;
    textView.placeholder = @"I‘m placeHolder";
    [self.view addSubview:textView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
