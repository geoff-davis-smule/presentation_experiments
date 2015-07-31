//
//  ModalPresentationController.m
//  PresentationsGalore
//
//  Created by Smule on 7/30/15.
//  Copyright (c) 2015 Smule. All rights reserved.
//

#import "ModalPresentationController.h"

@implementation ModalPresentationController



#pragma mark - Custom Methods

- (void)prepareDimmingView
{
    _dimView = [[UIView alloc] init];
    [_dimView setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.7]];
    [_dimView setAlpha:0.0];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dimmingViewTapped:)];
    [_dimView addGestureRecognizer:tap];
}

- (void)dimmingViewTapped:(UIGestureRecognizer *)gesture
{
    if(gesture.state == UIGestureRecognizerStateRecognized)
    {
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
}


#pragma mark - Overridden Methods

- (void)presentationTransitionWillBegin {
    UIView* containerView = self.containerView;
    UIViewController* presentedViewController = self.presentedViewController;
    [self prepareDimmingView];
    [_dimView setFrame:[containerView bounds]];
    [_dimView setAlpha:0.0];
    
    [containerView insertSubview:_dimView atIndex:0];
    
    if( presentedViewController.transitionCoordinator )
    {
        [presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
            
            [_dimView setAlpha:1.0];
        } completion:nil];
    }
    else
    {
        [_dimView setAlpha:1.0];
    }
}

//- (void)presentationTransitionDidEnd:(BOOL)completed {
//    if ( completed ) {
//        _dimView.alpha = 1.0;
//    }
//}

- (void)dismissalTransitionWillBegin {
    if([self.presentedViewController transitionCoordinator])
    {
        [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
            [_dimView setAlpha:0.0];
        } completion:nil];
    }
    else
    {
        [_dimView setAlpha:0.0];
    }
}

- (UIModalPresentationStyle)adaptivePresentationStyle
{
    return UIModalPresentationOverFullScreen;
}

- (void)containerViewWillLayoutSubviews
{
    _dimView.frame = self.containerView.bounds;
    self.presentedView.frame = [self frameOfPresentedViewInContainerView];
}

- (BOOL)shouldPresentInFullscreen {
    return YES;
}

- (CGRect)frameOfPresentedViewInContainerView
{
    CGRect presentedViewFrame = CGRectZero;
    CGRect containerBounds = self.containerView.bounds;
    
    presentedViewFrame.size = [self sizeForChildContentContainer:self.presentedViewController withParentContainerSize:containerBounds.size];
    
    presentedViewFrame.origin.x = 40.0; // containerBounds.size.width - presentedViewFrame.size.width;
    presentedViewFrame.origin.y = 50.0; // containerBounds.size.height - presentedViewFrame.size.height;
    
    return presentedViewFrame;
}

- (CGSize)sizeForChildContentContainer:(id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
    return CGSizeMake(floorf(parentSize.width - 80.0), floorf(parentSize.height - 100.0));
}

@end




