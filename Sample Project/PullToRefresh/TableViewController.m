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

//Hide status bar for iOS 7
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

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
    
        //Initialization of the control
    self.myPTR = [[BEMPullToRefresh alloc] initWithNumberOfDots:5];
    self.myPTR.delegate = self;
    [self.view addSubview:self.myPTR];
    
        //Optional properties
    self.myPTR.dotColor = [UIColor lightGrayColor];
    self.myPTR.thresholdToTrigger = 90;
    self.myPTR.animationSpeed = 1;
    
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


#pragma mark - BEMPullToRefresh Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView  {
	
    [self.myPTR viewDidScroll:scrollView];
}

- (void)Refresh {
    
    NSLog(@"Refreshing...");
    
    // Perform here the necessary to refresh the data (calling a JSON API for example). Once the data has been refreshed and display, call isDoneRefreshing.
    // For the example here, we used an NSTimer.
    [NSTimer scheduledTimerWithTimeInterval:7 target:self.myPTR selector:@selector(isDoneRefreshing) userInfo:nil repeats:NO];
}

@end
