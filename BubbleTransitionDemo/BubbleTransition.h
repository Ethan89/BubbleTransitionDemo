//
//  BubbleTransition.h
//  BubbleTransitionDemo
//
//  Created by Ethan Guo on 16/3/25.
//  Copyright © 2016年 Ethan Guo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

/**
 *  The posible directions of the transition.
 */
typedef NS_ENUM(NSUInteger, BubbleTransitionMode) {
    /**
     *  for presenting a modal controller.
     */
    Present = 0,
    /**
     *  for dismissing the current controller.
     */
    Dismiss,
};

@interface BubbleTransition : NSObject <UIViewControllerAnimatedTransitioning>

@property NSTimeInterval duration;
@property BubbleTransitionMode transitionMod;
@property (strong, nonatomic) UIColor  *bubbleColor;
@property (nonatomic) CGPoint startPoint;

@end
