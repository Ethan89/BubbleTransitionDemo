//
//  BubbleTransition.m
//  BubbleTransitionDemo
//
//  Created by Ethan Guo on 16/3/25.
//  Copyright © 2016年 Ethan Guo. All rights reserved.
//

#import "BubbleTransition.h"

@interface BubbleTransition ()

@property (strong, nonatomic) UIView *bubble;

@end

@implementation BubbleTransition

@synthesize duration;
@synthesize bubbleColor;
@synthesize transitionMod;
@synthesize startPoint;

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        self.duration = 0.5;
        self.transitionMod = Present;
        self.bubbleColor = [UIColor whiteColor];
        self.startPoint  = CGPointZero;
    }
    
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return self.duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = nil;
    UIViewController *toVC   = nil;
    UIView *containerView    = nil;
    
    fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    containerView = [transitionContext containerView];
    
    if (!fromVC || !toVC || !containerView) {
        return;
    }
    
    UIView *fromView = fromVC.view;
    UIView *toView   = toVC.view;
    
    if (self.transitionMod == Present) {
        
        CGPoint originalCenter = toView.center;
        CGSize  originalSize   = toView.frame.size;
        
        self.bubble = [[UIView alloc] init];
        self.bubble.frame = [self frameForBubble:originalCenter
                                    originalSize:originalSize
                                      startPoint:self.startPoint];
        self.bubble.layer.cornerRadius = self.bubble.frame.size.height / 2;
        self.bubble.center = startPoint;
        self.bubble.transform = CGAffineTransformMakeScale(0.001, 0.001);
        self.bubble.backgroundColor = self.bubbleColor;
        [containerView addSubview:self.bubble];
        
        toView.center = startPoint;
        toView.transform = CGAffineTransformMakeScale(0.001, 0.001);
        toView.alpha = 0;
        [containerView addSubview:toView];
        
        [UIView animateWithDuration:self.duration
                         animations:^{
                         }];
        
        [UIView animateWithDuration:self.duration
                         animations:^{
                             self.bubble.transform = CGAffineTransformIdentity;
                             toView.transform = CGAffineTransformIdentity;
                             toView.alpha = 1;
                             toView.center = originalCenter;
                         }
                         completion:^(BOOL finished) {
                             [transitionContext completeTransition:YES];
                         }];
    } else {
        CGPoint originalCenter = fromView.center;
        CGSize  originalSize   = fromView.frame.size;
        
        self.bubble.frame = [self frameForBubble:originalCenter
                                    originalSize:originalSize
                                      startPoint:self.startPoint];
        self.bubble.layer.cornerRadius = self.bubble.frame.size.height / 2;
        self.bubble.center = startPoint;
        
        [UIView animateWithDuration:self.duration
                         animations:^{
                             self.bubble.transform = CGAffineTransformMakeScale(0.001, 0.001);
                             fromView.transform = CGAffineTransformMakeScale(0.001, 0.001);
                             fromView.center = self.startPoint;
                             fromView.alpha = 0;
                         }
                         completion:^(BOOL finished) {
                             fromView.center = originalCenter;
                             [fromView removeFromSuperview];
                             [self.bubble removeFromSuperview];
                             [transitionContext completeTransition:YES];
                         }];
    }
    
}

#pragma mark - private
- (CGRect)frameForBubble:(CGPoint)originalCenter
            originalSize:(CGSize)size
              startPoint:(CGPoint)aStartPoint {
    
    double lengthX = fmax(aStartPoint.x, size.width - aStartPoint.x);
    double lengthY = fmax(aStartPoint.y, size.height - aStartPoint.y);
    double offset  = (sqrt(lengthX * lengthX + lengthY * lengthY)) * 2;
    CGSize asize = CGSizeMake(offset, offset);
    CGPoint point = CGPointZero;
    
    return CGRectMake(point.x, point.y, asize.width, asize.height);
}

@end
