//
//  TableViewController.m
//  PullToRefresh
//
//  Created by Bobo on 6/4/13.
//  Copyright (c) 2013 Bobo. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.PTR = [[PullToRefresh alloc] init];    
    self.PTR.delegate = self;
    self.PTR.dotColor = [UIColor lightGrayColor]; //Optional, default color is lightGrayColor
    [self.PTR initPTR:self.view withNumberOfDots:5];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}


//The 3 methods necessary for PullToRefresh.

- (void)scrollViewDidScroll:(UIScrollView *)scrollView  {
	
    [self.PTR PTRdidScroll:scrollView];
}

- (void)Refresh {
    
    NSLog(@"Refreshing...");
    
    //Replace the NSTimer by the API call to get the refreshed data. When done, call "doneRefreshing"
    [NSTimer scheduledTimerWithTimeInterval:7 target:self selector:@selector(doneRefreshing) userInfo:nil repeats:NO];
}

- (void)doneRefreshing  {
    
    NSLog(@"Done Refreshing");
    
    self.PTR.stopRefresh = YES;//Let the control that it should stop being displayed
    
    //Update the tableview here with the new data.
}


//Hide status bar for iOS 7

- (BOOL)prefersStatusBarHidden
{
    return YES;
}


@end
