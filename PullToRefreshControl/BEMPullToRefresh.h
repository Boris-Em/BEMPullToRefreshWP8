//
//  BEMPullToRefresh.h
//  PullToRefresh
//
//  Created by Bobo on 1/12/14.
//  Copyright (c) 2014 Bobo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BEMPullToRefreshDelegate

@required

/// Initilalize the refreshing process in this method. For example, call the JSON API to get the updated data. Once done, call isDoneRefreshing (see below) to stop the animation.
- (void)Refresh;

@end

@interface BEMPullToRefresh : UIView



//------------------------------------------------------------------------------------//
//----- DELEGATE ---------------------------------------------------------------------//
//------------------------------------------------------------------------------------//


/// The delegate for BEMPullToRefresh.
@property (nonatomic, weak) id <BEMPullToRefreshDelegate> delegate;



//------------------------------------------------------------------------------------//
//----- METHODS ----------------------------------------------------------------------//
//------------------------------------------------------------------------------------//


/// Initialize the graph with a number of dots.
- (id)initWithNumberOfDots:(int)numberOfDots;


/// Informs the delegate that the scrollView has been pulled by the user. This method should be called in – scrollViewDidScroll:
- (void)viewDidScroll:(UIScrollView *)scrollView;


/// Call this method when the data has been updated. The animation will stop after its current cycle.
- (void)isDoneRefreshing;



//------------------------------------------------------------------------------------//
//----- PROPERTIES -------------------------------------------------------------------//
//------------------------------------------------------------------------------------//


/// The color of the dots. The default is lightGray.
@property (strong, nonatomic) UIColor *dotColor;


/// The threshold to detect if the refresh process should be triggered. A value close to 0 means that the user needs to bearly pull the tableView to trigger the refreshing process. A value superior at 100 makes it really hard to trigger. The default value is 100.
@property (nonatomic) float thresholdToTrigger;

/// The speed of the dots during the animation. Default value is 1, a value between 0 and 1 will speed up the animation while a value superior to 1 will slow it down.
@property (nonatomic) float animationSpeed;

@end
