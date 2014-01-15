
//
//  BEMPullToRefresh.m
//  PullToRefresh
//
//  Created by Bobo on 1/12/14.
//  Copyright (c) 2014 Bobo. All rights reserved.
//

#import "BEMPullToRefresh.h"

@interface BEMPullToRefresh ()
{
//    / The width of the screen. Updated according to the orientation.
    float screenWidth;
    
//    / The height of the screen. Updated according to the orientation.
    float screenHeight;
    
//    / BOOL used at the end of the animation to see if the new data has been displayed or not. If the new data is not here, the animation will continue.
    BOOL isRefreshing;
}

@end

@implementation BEMPullToRefresh

- (id)initWithFrame:(CGRect)frame
{
    return [self initWithNumberOfDots:5];
}

- (id)initWithNumberOfDots:(int)numberOfDots
{
    self = [super initWithFrame:CGRectMake(0, 0, 0, 0)];
    if (self) {
        // Initialization code
        
        // Default values.
        isRefreshing = NO;
        _thresholdToTrigger = 100;
        _dotColor = [UIColor lightGrayColor];
        _animationSpeed = 1;
        
        
        if (numberOfDots <= 0) {
            NSLog(@"ERROR - numberOfDots should be at least 1.");
        }
        
        else    {
            
            self.backgroundColor = [UIColor blackColor];
            
            for (int i = 0; i < numberOfDots; i++) {
                UIView *dot = [[UIView alloc] initWithFrame:CGRectMake(-3, 0, 3, 3)];
                dot.tag = i+1;
                dot.hidden = YES;
                [self addSubview: dot];
            }
        }
    }
    return (self);
}

- (void)viewDidScroll:(UIScrollView *)scrollView {
    
    self.frame = CGRectMake(0, scrollView.contentOffset.y, [[UIScreen mainScreen]bounds].size.height, scrollView.contentOffset.y * (-1));
    
    if (([[UIApplication sharedApplication] statusBarOrientation] == 0) || ([[UIApplication sharedApplication] statusBarOrientation] == 1))
    {
        screenWidth = self.superview.frame.size.width;
        screenHeight = self.superview.frame.size.height;
        
        if (scrollView.contentOffset.y < (-self.thresholdToTrigger) && scrollView.isTracking == NO && isRefreshing == NO)   {
            [self triggeredRefresh:scrollView];
            
            [self.delegate Refresh];
            
        }
    }
    
    else if (([UIDevice currentDevice].orientation == 3) || ([UIDevice currentDevice].orientation == 4))
    {
        screenWidth = self.superview.frame.size.height;
        screenHeight = self.superview.frame.size.width;
        
        if (scrollView.contentOffset.y < (-self.thresholdToTrigger - 20) && scrollView.isTracking == NO && isRefreshing == NO)   {//In landscape mode, the threshold to trigger the refresh should be a little bit lower.
            [self triggeredRefresh:scrollView];
            
            [self.delegate Refresh];
            
        }
    }
}

- (void)triggeredRefresh:(UIScrollView *)scrollView   {
    
    isRefreshing = YES;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2];
    scrollView.contentInset = UIEdgeInsetsMake(10, 0.0f, 0.0f, 0.0f);
    [UIView commitAnimations];
    
    
    for (int i = 0; i < self.subviews.count; i++) {
        
        for (UIView *dot in self.subviews) {
            
            dot.hidden = NO;
            dot.backgroundColor = self.dotColor;
            
            if (dot.tag == i + 1) {
                [UIView animateWithDuration:(0.3f * self.animationSpeed) delay:(i * 0.2 * self.animationSpeed) options:UIViewAnimationOptionCurveLinear animations:^{
                    dot.frame = CGRectMake(screenWidth/4, 0, 3, 3);
                } completion:^(BOOL finished){
                    [UIView animateWithDuration:(1.9f* self.animationSpeed) delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                        dot.frame = CGRectMake(screenWidth/1.333, 0, 3, 3);
                    } completion:^(BOOL finished){
                        [UIView animateWithDuration:(0.3f* self.animationSpeed) delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                            dot.frame = CGRectMake(screenWidth, 0, 3, 3);
                        } completion:^(BOOL finished){
                            dot.frame = CGRectMake(-3, 0, 3, 3);
                            dot.hidden = YES;
                            
                            if (dot.tag == self.subviews.count) {
                                
                                if(isRefreshing == YES)  {  // Still refreshing.
                                    
                                    if (([[UIApplication sharedApplication] statusBarOrientation] == 0) || ([[UIApplication sharedApplication] statusBarOrientation] == 1))
                                    {
                                        screenWidth = self.superview.frame.size.width;
                                        screenHeight = self.superview.frame.size.height;
                                    }
                                    
                                    if (([UIDevice currentDevice].orientation == 3) || ([UIDevice currentDevice].orientation == 4))
                                    {
                                        screenWidth = self.superview.frame.size.height;
                                        screenHeight = self.superview.frame.size.width;
                                    }
                                    
                                    [self triggeredRefresh:scrollView];
                                }
                                
                                else    {   // Done refreshing
                                    isRefreshing = NO;
                                    [UIView beginAnimations:nil context:NULL];
                                    [UIView setAnimationDuration:0.2];
                                    scrollView.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f);
                                    [UIView commitAnimations];
                                }
                            }
                        }];
                    }];
                }];
            }
        }
    }
}

- (void)isDoneRefreshing{
    isRefreshing = NO;
}

@end
