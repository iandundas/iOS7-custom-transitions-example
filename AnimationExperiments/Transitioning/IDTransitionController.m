//
//  IDTransitionController.m
//  AnimationExperiments
//
//  Created by Ian Dundas on 24/09/2013.
//  Copyright (c) 2013 Ian Dundas. All rights reserved.
//

#import "IDTransitionController.h"

@implementation IDTransitionController

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return self.reverse ? 0.8 : 1.6;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)context
{
    UIView *inView = [context containerView];
    UIView *toView = [[context viewControllerForKey:UITransitionContextToViewControllerKey]view];
    UIView *fromView = [[context viewControllerForKey:UITransitionContextFromViewControllerKey]view];

    if (self.reverse) {
        [inView insertSubview:toView belowSubview:fromView];
    }
    else {
        toView.frame = CGRectMake(100, 100, 200, 300);
        toView.transform = CGAffineTransformMakeScale(0, 0);
        [inView addSubview:toView];
    }
    
    CGFloat damping = self.reverse ? 1 : 0.6;
    NSTimeInterval duration = [self transitionDuration:context];

    [toView setUserInteractionEnabled: true];
    [fromView setUserInteractionEnabled: false];
    
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:damping initialSpringVelocity:10.0 options:0 animations:^{
        if (self.reverse) {
            fromView.transform = CGAffineTransformMakeScale(0, 0);
        }
        else {
            toView.transform = CGAffineTransformIdentity; // i.e. CGAffineTransformMakeScale(1, 1);
        }

    } completion:^(BOOL finished) {
        [context completeTransition:finished]; // vital
    }];
}


@end
