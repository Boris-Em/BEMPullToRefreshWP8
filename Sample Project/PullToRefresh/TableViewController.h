//
//  TableViewController.h
//  PullToRefresh
//
//  Created by Bobo on 6/4/13.
//  Copyright (c) 2013 Bobo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullToRefresh.h"

@interface TableViewController : UITableViewController <PTRdelegate>

@property(strong, nonatomic)PullToRefresh * PTR;

@end
