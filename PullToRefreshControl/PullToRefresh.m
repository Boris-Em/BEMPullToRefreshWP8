//
//  PullToRefresh.m
//  PullToRefresh
//
//  Created by Bobo on 6/4/13.
//  Copyright (c) 2013 Bobo. All rights reserved.
//

#import "PullToRefresh.h"

@implementation PullToRefresh

@synthesize delegate;

- (void)PTRdidScroll:(UIScrollView *)scrollView {
    
    _PTR.frame = CGRectMake(0, scrollView.contentOffset.y, [[UIScreen mainScreen] bounds].size.width, scrollView.contentOffset.y * (-1));
    
    if (scrollView.contentOffset.y < -100 && scrollView.isTracking == NO && isRefreshing == NO)   {
        [self triggeredRefresh:scrollView];
        
        [delegate Refresh];
        
        stopRefresh = NO;
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
        _dot1.frame = CGRectMake(80, 0, 3, 3);
    } completion:^(BOOL finished){
        [UIView animateWithDuration:1.9f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            _dot1.frame = CGRectMake(240, 0, 3, 3);
        } completion:^(BOOL finished){
            [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                _dot1.frame = CGRectMake(320, 0, 3, 3);
            } completion:^(BOOL finished){
                _dot1.frame = CGRectMake(-3, 0, 3, 3);
                _dot1.hidden = YES;
            }];
        }];
    }];
    
    
        [UIView animateWithDuration:0.3f delay:0.2 options:UIViewAnimationOptionCurveLinear animations:^{
            _dot2.frame = CGRectMake(80, 0, 3, 3);
        } completion:^(BOOL finished){            
            [UIView animateWithDuration:1.9f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                _dot2.frame = CGRectMake(240, 0, 3, 3);
            } completion:^(BOOL finished){
                [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                    _dot2.frame = CGRectMake(320, 0, 3, 3);
                } completion:^(BOOL finished){
                    _dot2.frame = CGRectMake(-3, 0, 3, 3);
                    _dot2.hidden = YES;
                }];
            }];
        }];
    
    [UIView animateWithDuration:0.3f delay:0.4 options:UIViewAnimationOptionCurveLinear animations:^{
        _dot3.frame = CGRectMake(80, 0, 3, 3);
    } completion:^(BOOL finished){
        [UIView animateWithDuration:1.9f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            _dot3.frame = CGRectMake(240, 0, 3, 3);
        } completion:^(BOOL finished){
            [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                _dot3.frame = CGRectMake(320, 0, 3, 3);
            } completion:^(BOOL finished){
                _dot3.frame = CGRectMake(-3, 0, 3, 3);
                _dot3.hidden = YES;
            }];
        }];
    }];
    
    [UIView animateWithDuration:0.3f delay:0.6 options:UIViewAnimationOptionCurveLinear animations:^{
        _dot4.frame = CGRectMake(80, 0, 3, 3);
    } completion:^(BOOL finished){
        [UIView animateWithDuration:1.9f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            _dot4.frame = CGRectMake(240, 0, 3, 3);
        } completion:^(BOOL finished){
            [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                _dot4.frame = CGRectMake(320, 0, 3, 3);
            } completion:^(BOOL finished){
                _dot4.frame = CGRectMake(-3, 0, 3, 3);
                _dot4.hidden = YES;
            }];
        }];
    }];
    
    [UIView animateWithDuration:0.3f delay:0.8 options:UIViewAnimationOptionCurveLinear animations:^{
        _dot5.frame = CGRectMake(80, 0, 3, 3);
    } completion:^(BOOL finished){
        [UIView animateWithDuration:1.9f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
            _dot5.frame = CGRectMake(240, 0, 3, 3);
        } completion:^(BOOL finished){
            [UIView animateWithDuration:0.3f delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                _dot5.frame = CGRectMake(320, 0, 3, 3);
            } completion:^(BOOL finished){
                _dot5.frame = CGRectMake(-3, 0, 3, 3);
                _dot5.hidden = YES;
                
                if(stopRefresh == NO)  {
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
        
    _PTR = [[UIView alloc] initWithFrame:CGRectMake(0, -300, [[UIScreen mainScreen] bounds].size.width, 300)];
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
