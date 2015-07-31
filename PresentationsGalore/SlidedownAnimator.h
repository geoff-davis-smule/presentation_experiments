//
//  SlidedownAnimator.h
//  PresentationsGalore
//
//  Created by Smule on 7/30/15.
//  Copyright (c) 2015 Smule. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface SlidedownAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic) BOOL isPresentation;

@end
