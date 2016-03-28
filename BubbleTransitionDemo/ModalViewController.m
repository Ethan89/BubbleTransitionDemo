//
//  ModalViewController.m
//  BubbleTransitionDemo
//
//  Created by Ethan Guo on 16/3/25.
//  Copyright © 2016年 Ethan Guo. All rights reserved.
//

#import "ModalViewController.h"

#import "Masonry.h"

@implementation ModalViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:182/255.0 green:81/255.0 blue:81/255.0 alpha:1.0];
    
    UIButton *button       = [[UIButton alloc] init];
    button.backgroundColor = [UIColor whiteColor];
    [button setTitle:@"+" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:187/255.0 green:81/255.0 blue:81/255.0 alpha:1.0]
                 forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont fontWithName:@"Avenir Next" size:30.0];
    [button setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [button.layer setMasksToBounds:YES];
    [button.layer setCornerRadius:30.0];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label = [[UILabel alloc] init];
    [label setTextColor:[UIColor whiteColor]];
    [label setText:@"Hello!"];
    [label setFont:[UIFont fontWithName:@"Avenir Next" size:50.0]];
    label.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:label];
    [self.view addSubview:button];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@137);
        make.height.equalTo(@69);
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(80);
    }];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(@60);
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
    }];
    
    button.transform = CGAffineTransformMakeRotation(M_PI_4);
    
}

- (void)buttonClick {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
