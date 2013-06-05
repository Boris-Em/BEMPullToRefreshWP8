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
    
    _PTR = [[PullToRefresh alloc] init];
    
    _PTR.delegate = self;
    
    [_PTR initPTR:self.view];
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


- (void)scrollViewDidScroll:(UIScrollView *)scrollView  {
	
    [_PTR PTRdidScroll:scrollView];
}

- (void)Refresh {
    NSLog(@"Refreshing...");
    [NSTimer scheduledTimerWithTimeInterval:7 target:self selector:@selector(doneRefreshing) userInfo:nil repeats:NO];
}

- (void)doneRefreshing  {
    NSLog(@"Done Refreshing");
    [_PTR isDoneRefreshing:YES];
}


@end
