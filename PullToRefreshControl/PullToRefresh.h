//
//  PullToRefresh.h
//  PullToRefresh
//
//  Created by Bobo on 6/4/13.
//  Copyright (c) 2013 Bobo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol PTRdelegate
@required
-(void)Refresh;
@end

@interface PullToRefresh : NSObject {
    BOOL isRefreshing;
    __weak id <PTRdelegate> delegate;
}

- (void)PTRdidScroll:(UIScrollView *)scrollView;
- (void)initPTR:(UIView *)view withNumberOfDots:(int)numberOfDots;
- (void)triggeredRefresh:(UIScrollView *)scrollView;

@property (strong, nonatomic) UIColor *dotColor;

@property(strong, nonatomic) UIView * PTR;

@property (assign, nonatomic) BOOL stopRefresh;

@property (nonatomic, weak) id <PTRdelegate> delegate;

@end