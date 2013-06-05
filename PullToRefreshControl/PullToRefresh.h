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
    BOOL stopRefresh;
    __weak id <PTRdelegate> delegate;
}

- (void)PTRdidScroll:(UIScrollView *)scrollView;
- (void)initPTR:(UIView *)view;
- (void)triggeredRefresh:(UIScrollView *)scrollView;
- (void)isDoneRefreshing:(BOOL)isDoneRefreshing;

@property(strong, nonatomic)UIView * PTR;
@property(strong, nonatomic)UIView * dot1;
@property(strong, nonatomic)UIView * dot2;
@property(strong, nonatomic)UIView * dot3;
@property(strong, nonatomic)UIView * dot4;
@property(strong, nonatomic)UIView * dot5;

@property (nonatomic, weak) id <PTRdelegate> delegate;

@end