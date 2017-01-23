//
//  ViewController.m
//  SYLJLabel
//
//  Created by 刘俊 on 2017/1/23.
//  Copyright © 2017年 刘俊. All rights reserved.
//

#import "ViewController.h"
#import "SYLJLabel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet SYLJLabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.label.text = @"https://apple.com https://www.baidu.com ..............#######################";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
