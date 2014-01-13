//
//  TableViewController.h
//  PullToRefresh
//
//  Created by Bobo on 6/4/13.
//  Copyright (c) 2013 Bobo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BEMPullToRefresh.h"

@interface TableViewController : UITableViewController <BEMPullToRefreshDelegate>

@property(strong, nonatomic) BEMPullToRefresh * myPTR;

@end
