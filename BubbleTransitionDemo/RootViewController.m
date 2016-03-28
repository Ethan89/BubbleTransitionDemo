//
//  RootViewController.m
//  BubbleTransitionDemo
//
//  Created by Ethan Guo on 16/3/25.
//  Copyright © 2016年 Ethan Guo. All rights reserved.
//

#import "RootViewController.h"
#import "ModalViewController.h"
#import "BubbleTransition.h"

#import "Masonry.h"

@interface RootViewController ()

@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) BubbleTransition *transition;

@end

@implementation RootViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.transition = [[BubbleTransition alloc] init];
    
    [self.view addSubview:self.button];
    
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.width.equalTo(@60);
        make.height.equalTo(@60);
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
    }];
}

- (void)buttonClick {
    
    ModalViewController *modalVC   = [[ModalViewController alloc] init];
    modalVC.modalPresentationStyle = UIModalPresentationCustom;
    modalVC.transitioningDelegate  = self;
    
    [self presentViewController:modalVC animated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    
    [self.transition setTransitionMod:Present];
    [self.transition setStartPoint:self.button.center];
    [self.transition setBubbleColor:self.button.backgroundColor];
    
    return self.transition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    [self.transition setTransitionMod:Dismiss];
    [self.transition setStartPoint:self.button.center];
    [self.transition setBubbleColor:self.button.backgroundColor];
    
    return self.transition;
}

#pragma mark - Getters
- (UIButton *)button {
    
    if (!_button) {
    
        _button = [[UIButton alloc] init];
        _button.backgroundColor = [UIColor colorWithRed:187/255.0 green:81/255.0 blue:81/255.0 alpha:1.0];
        [_button setTitle:@"+" forState:UIControlStateNormal];
        _button.titleLabel.font = [UIFont fontWithName:@"Avenir Next" size:30.0];
        [_button setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [_button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
        [_button.layer setMasksToBounds:YES];
        [_button.layer setCornerRadius:30.0];
        [_button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _button;
}

@end
