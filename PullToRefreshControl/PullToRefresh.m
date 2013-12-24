//
//  PullToRefresh.m
//  PullToRefresh
//
//  Created by Bobo on 6/4/13.
//  Copyright (c) 2013 Bobo. All rights reserved.
//

#import "PullToRefresh.h"

int xWidth;
int xHeight;

@implementation PullToRefresh

@synthesize delegate;

- (void)PTRdidScroll:(UIScrollView *)scrollView {
    
    self.PTR.frame = CGRectMake(0, scrollView.contentOffset.y, [[UIScreen mainScreen]bounds].size.height, scrollView.contentOffset.y * (-1));  
    
    if (([[UIApplication sharedApplication] statusBarOrientation] == 0) || ([[UIApplication sharedApplication] statusBarOrientation] == 1))
    {
        xWidth = [[UIScreen mainScreen] bounds].size.width;
        xHeight = [[UIScreen mainScreen] bounds].size.height;
        
        if (scrollView.contentOffset.y < -100 && scrollView.isTracking == NO && isRefreshing == NO)   {
            [self triggeredRefresh:scrollView];
            
            [delegate Refresh];
            
            self.stopRefresh = NO;
        }
    }
    
    else if (([UIDevice currentDevice].orientation == 3) || ([UIDevice currentDevice].orientation == 4))
    {
        xWidth = [[UIScreen mainScreen] bounds].size.height;
        xHeight = [[UIScreen mainScreen] bounds].size.width;
        
        if (scrollView.contentOffset.y < -80 && scrollView.isTracking == NO && isRefreshing == NO)   {//In landscape mode, the threshold to trigger the refresh should be a little bit lower.
            [self triggeredRefresh:scrollView];
            
            [delegate Refresh];
            
            self.stopRefresh = NO;
        }
    }                
}

- (void)triggeredRefresh:(UIScrollView *)scrollView   {
    
    isRefreshing = YES;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2];
    scrollView.contentInset = UIEdgeInsetsMake(10, 0.0f, 0.0f, 0.0f);
    [UIView commitAnimations];
    
    
    for (int i = 0; i < self.PTR.subviews.count; i++) {

        for (UIView *dot in self.PTR.subviews) {
            
            dot.hidden = NO;
            
            if (dot.tag == i + 1) {
                [UIView animateWithDuration:0.3f delay:i*0.2 options:UIViewAnimationOptionCurveLinear animations:^{
                    dot.frame = CGRectMake(xWidth/4, 0, 3, 3);
                } completion:^(BOOL finished){
                    [UIView animateWithDuration:1.9f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                        dot.frame = CGRectMake(xWidth/1.333, 0, 3, 3);
                    } completion:^(BOOL finished){
                        [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                            dot.frame = CGRectMake(xWidth, 0, 3, 3);
                        } completion:^(BOOL finished){
                            dot.frame = CGRectMake(-3, 0, 3, 3);
                            dot.hidden = YES;
                            
                            if (dot.tag == self.PTR.subviews.count) {
                                
                                if(self.stopRefresh == NO)  {

                                    if (([[UIApplication sharedApplication] statusBarOrientation] == 0) || ([[UIApplication sharedApplication] statusBarOrientation] == 1))
                                    {
                                        xWidth = [[UIScreen mainScreen] bounds].size.width;
                                        xHeight = [[UIScreen mainScreen] bounds].size.height;
                                    }
                                    
                                    if (([UIDevice currentDevice].orientation == 3) || ([UIDevice currentDevice].orientation == 4))
                                    {
                                        xWidth = [[UIScreen mainScreen] bounds].size.height;
                                        xHeight = [[UIScreen mainScreen] bounds].size.width;
                                    }
                                    
                                    [self triggeredRefresh:scrollView];
                                }
                                
                                else    {
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

- (void)initPTR:(UIView *)view withNumberOfDots:(int)numberOfDots{
    
    if (numberOfDots <= 0) {
        NSLog(@"ERROR - numberOfDots should be at least 1.");
    }
    
    else    {
        
        self.PTR = [[UIView alloc] init];
        self.PTR.backgroundColor = [UIColor blackColor];
        [view addSubview:self.PTR];
    
        for (int i = 0; i < numberOfDots; i++) {
            UIView *dot = [[UIView alloc] initWithFrame:CGRectMake(-3, 0, 3, 3)];
            dot.tag = i+1;
        
            if (self.dotColor) {
                dot.backgroundColor = self.dotColor;
            }
        
            else   {
                dot.backgroundColor = [UIColor lightGrayColor];
            }
        
            dot.hidden = YES;
            [self.PTR addSubview: dot];
        }
    }
}

@end
