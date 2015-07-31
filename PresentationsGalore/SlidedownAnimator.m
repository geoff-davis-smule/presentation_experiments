//
//  SlidedownAnimator.m
//  PresentationsGalore
//
//  Created by Smule on 7/30/15.
//  Copyright (c) 2015 Smule. All rights reserved.
//

#import "SlidedownAnimator.h"

@implementation SlidedownAnimator



- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 1.25;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = [fromVC view];
    UIViewController *toVC   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = [toVC view];
    
    UIView *containerView = [transitionContext containerView];
    
    BOOL isPresentation = [self isPresentation];
    
    if(isPresentation)
    {
        [containerView addSubview:toView];
    }
    
    UIViewController *animatingVC = isPresentation? toVC : fromVC;
    UIView *animatingView = [animatingVC view];
    
    [animatingView setFrame:[transitionContext finalFrameForViewController:animatingVC]];
    
    CGAffineTransform presentedTransform = CGAffineTransformIdentity;
    CGAffineTransform dismissedTransform = CGAffineTransformMakeTranslation(0, -[UIScreen mainScreen].bounds.size.height);
    //CGAffineTransform dismissedTransform = CGAffineTransformMakeScale(0.001, 0.001);
    //CGAffineTransform dismissedTransform = CGAffineTransformConcat(CGAffineTransformMakeScale(0.001, 0.001), CGAffineTransformMakeRotation(8 * M_PI));
    
    
    [animatingView setTransform:isPresentation ? dismissedTransform : presentedTransform];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0
         usingSpringWithDamping:300.0
          initialSpringVelocity:5.0
                        options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         
                         animatingView.transform = isPresentation ? presentedTransform : dismissedTransform;
                         
                     }
                     completion:^(BOOL finished){
                         if(![self isPresentation])
                         {
                             [fromView removeFromSuperview];
                         }
                         [transitionContext completeTransition:YES];
                     }];
    
}

@end
