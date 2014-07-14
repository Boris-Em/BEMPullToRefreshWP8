# BEMPullToRefreshWP8

[![Build Status](https://travis-ci.org/Boris-Em/BEMPullToRefreshWP8.svg?branch=master)](https://travis-ci.org/Boris-Em/BEMPullToRefreshWP8)

<p align="center"><img src="http://img19.imageshack.us/img19/6028/pulltorefresh.gif"/></p>

<p align="center">Simple Pull to Refresh Control for iOS. Inspired by WP8.</p>

### Requirements
- Requires iOS 6 or later. The sample project is optimized for iOS 7.
- Requires Automatic Reference Counting (ARC).

### License
See the [License](https://github.com/Boris-Em/BEMPullToRefreshWP8/blob/master/LICENSE). You are free to make changes and use this in either personal or commercial projects. Attribution is not required, but it appreciated. A little Thanks! (or something to that affect) would be much appreciated. If you use BEMSimpleLineGraph in your app, let us know.
Please note that Microsoft might not be really happy if you use this control as it looks exactly like what is used on Windows Phone.

### Contributions
Any contribution is more than welcome! You can contribute through pull requests and issues on GitHub. 

### Sample App
The iOS Sample App included with this project demonstrates how to correctly setup and use BEMPullToRefreshWP8. You can refer to the sample app for an understanding of how to use and setup BEMPullToRefreshWP8.

### Installation
To install BEMPullToRefreshWP8 simply drag and drop the *PullToRefreshControl* folder into your Xcode project. When you do so, check the "*Copy items into destination group's folder*" box.

### Setup
To setup BEMPullToRefreshWP8, follow the steps below.

1. Import `"BEMPullToRefresh.h"` to the header of your TableViewController:

         #import "BEMPullToRefresh.h"

2. Implement the `BEMPullToRefreshDelegate` to the same TableViewController:

         @interface YourViewController : UITableViewController <BEMPullToRefreshDelegate>

3. Add the following code to your implementation (usually the `viewDidLoad` method).
         
         BEMPullToRefresh *myPTR = [[BEMPullToRefresh alloc] initWithNumberOfDots:5];
         myPTR.delegate = self;
         [self.view addSubview:myPTR];

4. Call the method `viewDidScroll:` in `scrollViewDidScroll:`to inform the control when the view is scrolled by the user.

         - (void)scrollViewDidScroll:(UIScrollView *)scrollView  {
            [self.myPTR viewDidScroll:scrollView];
         }
         
5. Implement the requiered method `Refresh`

         - (void)Refresh {
                  // Perform here the required actions to refresh the data (call a JSON API for example).
                  // Once the data has been updated, call the method isDoneRefreshing:
                  [self.myPTR isDoneRefreshing];
         }

### Properties

The `dotColor` property controls the color of the dots.

The `thresholdToTrigger` property controls how far the user needs to pull down the tableview for the refresh to be triggered. A value close to 0 will make it really easy to be triggered while a value above 100 will make it really hard.

The `animationSpeed` property controls the speed of the dots during the animation. The default value is 1. A value between 0 and 1 will speed up the animation while a value superior to 1 will slow it down.
