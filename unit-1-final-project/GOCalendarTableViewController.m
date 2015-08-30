//
//  GOCalendarTableViewController.m
//  unit-1-final-project
//
//  Created by Fatima Zenine Villanueva on 8/24/15.
//  Copyright © 2015 apps. All rights reserved.
//

#import "GOCalendarTableViewController.h"
#import "GOCalendarResults.h"
#import "BackgroundGradient.h"
#import "WorkoutManager.h"

@interface GOCalendarTableViewController ()

@end

@implementation GOCalendarTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Go Goals";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    CAGradientLayer *bgLayer = [BackgroundGradient greenGradient];
    bgLayer.frame = self.view.bounds;
    [self.tableView.layer insertSublayer:bgLayer atIndex:0];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSMutableDictionary *calendarDates = [WorkoutManager calendarManager].calendarDates;
    NSInteger rowsCalendarDates = [calendarDates count];
    return rowsCalendarDates;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CalendarList" forIndexPath:indexPath];
    NSMutableDictionary *calendarDates = [WorkoutManager calendarManager].calendarDates;
    //    NSString *key = [calendarDates obj
    
    NSArray *keys = [calendarDates allKeys];
    NSString *key = keys[indexPath.row];
    cell.textLabel.text = key;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}


// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"CalendarListToResults"]){
        
        GOCalendarResults *resultsVC = segue.destinationViewController;
        NSIndexPath *indexPath;
        NSMutableDictionary *calendarDates = [WorkoutManager calendarManager].calendarDates;
        NSArray *values = [calendarDates allValues];
        NSDate *value = values[indexPath.row];
        resultsVC.scheduledDate =  value;
        
    }
    
}

@end
