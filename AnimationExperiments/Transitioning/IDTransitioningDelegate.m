//
//  IDTransitioningDelegate.m
//  AnimationExperiments
//
//  Created by Ian Dundas on 23/09/2013.
//  Copyright (c) 2013 Ian Dundas. All rights reserved.
//

#import "IDTransitioningDelegate.h"
#import "IDTransitionController.h"

@implementation IDTransitioningDelegate


- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    IDTransitionController *transitioning = [[IDTransitionController alloc]init];
    return transitioning;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    IDTransitionController *transitioning = [[IDTransitionController alloc]init];
    transitioning.reverse = YES;
    return transitioning;
}

// FOR A LATER EXAMPLE:

//- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator {
//    IDPercentDrivenInteractiveTransitionController *interactiveTransition = [[IDPercentDrivenInteractiveTransitionController alloc] init];
//    return interactiveTransition;
//}
//
//- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {
//    IDPercentDrivenInteractiveTransitionController *interactiveTransition = [[IDPercentDrivenInteractiveTransitionController alloc] init];
//    return interactiveTransition;
//}


@end
