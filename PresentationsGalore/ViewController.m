//
//  ViewController.m
//  PresentationsGalore
//
//  Created by Smule on 7/30/15.
//  Copyright (c) 2015 Smule. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "ModalViewController.h"
#import "ModalTransitioningDelegate.h"

@interface ViewController ()

@property (nonatomic, strong) ModalTransitioningDelegate * modalTransitioningDelegate;
@property (nonatomic, strong) UIViewController *modalVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.definesPresentationContext = YES;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    _modalVC = [storyboard instantiateViewControllerWithIdentifier:@"ModalViewController"];
    _modalVC.modalPresentationStyle = UIModalPresentationCustom;
    _modalTransitioningDelegate = [[ModalTransitioningDelegate alloc] init];
    _modalVC.transitioningDelegate = _modalTransitioningDelegate;
    
}


#pragma mark IBActions

- (IBAction)launchModel:(id)sender {
    [self presentViewController:_modalVC animated:YES completion:^{}];
}

#pragma mark IBActions

- (IBAction)launchSearch:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
