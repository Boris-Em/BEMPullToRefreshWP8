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
    
    _PTR.frame = CGRectMake(0, scrollView.contentOffset.y, [[UIScreen mainScreen]bounds].size.height, scrollView.contentOffset.y * (-1));  
    
    if (([[UIApplication sharedApplication] statusBarOrientation] == 0) || ([[UIApplication sharedApplication] statusBarOrientation] == 1))
    {
        xWidth = [[UIScreen mainScreen] bounds].size.width;
        xHeight = [[UIScreen mainScreen] bounds].size.height;
        
        if (scrollView.contentOffset.y < -100 && scrollView.isTracking == NO && isRefreshing == NO)   {
            [self triggeredRefresh:scrollView];
            
            [delegate Refresh];
            
            stopRefresh = NO;
        }
    }
    
    if (([UIDevice currentDevice].orientation == 3) || ([UIDevice currentDevice].orientation == 4))
    {
        xWidth = [[UIScreen mainScreen] bounds].size.height;
        xHeight = [[UIScreen mainScreen] bounds].size.width;
        
        if (scrollView.contentOffset.y < -80 && scrollView.isTracking == NO && isRefreshing == NO)   {//In landscape mode, the treshold to start the refresh should be a little bit lower.
            [self triggeredRefresh:scrollView];
            
            [delegate Refresh];
            
            stopRefresh = NO;
        }
    }                
}

- (void)triggeredRefresh:(UIScrollView *)scrollView   {
    
    _dot1.hidden = NO;
    _dot2.hidden = NO;
    _dot3.hidden = NO;
    _dot4.hidden = NO;
    _dot5.hidden = NO;
    
    isRefreshing = YES;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2];
    scrollView.contentInset = UIEdgeInsetsMake(10, 0.0f, 0.0f, 0.0f);
    [UIView commitAnimations];
    
    [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        _dot1.frame = CGRectMake(xWidth/4, 0, 3, 3);
    } completion:^(BOOL finished){
        [UIView animateWithDuration:1.9f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            _dot1.frame = CGRectMake(xWidth/1.333, 0, 3, 3);
        } completion:^(BOOL finished){
            [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                _dot1.frame = CGRectMake(xWidth, 0, 3, 3);
            } completion:^(BOOL finished){
                _dot1.frame = CGRectMake(-3, 0, 3, 3);
                _dot1.hidden = YES;
            }];
        }];
    }];
    
    
        [UIView animateWithDuration:0.3f delay:0.2 options:UIViewAnimationOptionCurveLinear animations:^{
            _dot2.frame = CGRectMake(xWidth/4, 0, 3, 3);
        } completion:^(BOOL finished){            
            [UIView animateWithDuration:1.9f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                _dot2.frame = CGRectMake(xWidth/1.333, 0, 3, 3);
            } completion:^(BOOL finished){
                [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                    _dot2.frame = CGRectMake(xWidth, 0, 3, 3);
                } completion:^(BOOL finished){
                    _dot2.frame = CGRectMake(-3, 0, 3, 3);
                    _dot2.hidden = YES;
                }];
            }];
        }];
    
    [UIView animateWithDuration:0.3f delay:0.4 options:UIViewAnimationOptionCurveLinear animations:^{
        _dot3.frame = CGRectMake(xWidth/4, 0, 3, 3);
    } completion:^(BOOL finished){
        [UIView animateWithDuration:1.9f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            _dot3.frame = CGRectMake(xWidth/1.333, 0, 3, 3);
        } completion:^(BOOL finished){
            [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                _dot3.frame = CGRectMake(xWidth, 0, 3, 3);
            } completion:^(BOOL finished){
                _dot3.frame = CGRectMake(-3, 0, 3, 3);
                _dot3.hidden = YES;
            }];
        }];
    }];
    
    [UIView animateWithDuration:0.3f delay:0.6 options:UIViewAnimationOptionCurveLinear animations:^{
        _dot4.frame = CGRectMake(xWidth/4, 0, 3, 3);
    } completion:^(BOOL finished){
        [UIView animateWithDuration:1.9f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            _dot4.frame = CGRectMake(xWidth/1.333, 0, 3, 3);
        } completion:^(BOOL finished){
            [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                _dot4.frame = CGRectMake(xWidth, 0, 3, 3);
            } completion:^(BOOL finished){
                _dot4.frame = CGRectMake(-3, 0, 3, 3);
                _dot4.hidden = YES;
            }];
        }];
    }];
    
    [UIView animateWithDuration:0.3f delay:0.8 options:UIViewAnimationOptionCurveLinear animations:^{
        _dot5.frame = CGRectMake(xWidth/4, 0, 3, 3);
    } completion:^(BOOL finished){
        [UIView animateWithDuration:1.9f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            _dot5.frame = CGRectMake(xWidth/1.333, 0, 3, 3);
        } completion:^(BOOL finished){
            [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                _dot5.frame = CGRectMake(xWidth, 0, 3, 3);
            } completion:^(BOOL finished){
                _dot5.frame = CGRectMake(-3, 0, 3, 3);
                _dot5.hidden = YES;
                
                if(stopRefresh == NO)  {                    
                    
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
                
            }];
        }];
    }];

}

- (void)initPTR:(UIView *)view {    
        
    _PTR = [[UIView alloc] init];
    _PTR.backgroundColor = [UIColor blackColor];
    [view addSubview:_PTR];
    
    _dot1 = [[UIView alloc] initWithFrame: CGRectMake(-3, 0, 3, 3)];
    _dot1.backgroundColor = [UIColor lightGrayColor];
    
    [_PTR addSubview: _dot1];
    
    _dot2 = [[UIView alloc] initWithFrame: CGRectMake(-3, 0, 3, 3)];
    _dot2.backgroundColor = [UIColor lightGrayColor];
    [_PTR addSubview: _dot2];
    
    _dot3 = [[UIView alloc] initWithFrame: CGRectMake(-3, 0, 3, 3)];
    _dot3.backgroundColor = [UIColor lightGrayColor];
    [_PTR addSubview: _dot3];
    
    _dot4 = [[UIView alloc] initWithFrame: CGRectMake(-3, 0, 3, 3)];
    _dot4.backgroundColor = [UIColor lightGrayColor];
    [_PTR addSubview: _dot4];
    
    _dot5 = [[UIView alloc] initWithFrame: CGRectMake(-3, 0, 3, 3)];
    _dot5.backgroundColor = [UIColor lightGrayColor];
    [_PTR addSubview: _dot5];
    
    _dot1.hidden = YES;
    _dot2.hidden = YES;
    _dot3.hidden = YES;
    _dot4.hidden = YES;
    _dot5.hidden = YES;
}

- (void)isDoneRefreshing:(BOOL)isDoneRefreshing     {
    stopRefresh = YES;
}


@end
