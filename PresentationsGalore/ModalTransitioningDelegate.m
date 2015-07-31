//
//  ModalTransitioningDelegate.m
//  PresentationsGalore
//
//  Created by Smule on 7/30/15.
//  Copyright (c) 2015 Smule. All rights reserved.
//

#import "ModalTransitioningDelegate.h"
#import "ModalPresentationController.h"
#import "SlidedownAnimator.h"

@implementation ModalTransitioningDelegate

- (ModalPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return [[ModalPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    SlidedownAnimator *animator = [[SlidedownAnimator alloc] init];
    animator.isPresentation = YES;
    return animator;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    SlidedownAnimator *animator = [[SlidedownAnimator alloc] init];
    animator.isPresentation = NO;
    return animator;
}

@end
