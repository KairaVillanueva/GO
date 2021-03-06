//
//  GOBuildTableViewController.m
//  unit-1-final-project
//
//  Created by Jamaal Sedayao on 8/28/15.
//  Copyright © 2015 apps. All rights reserved.
//

#import "GOBuildTableViewController.h"
#import "BackgroundGradient.h"

@interface GOBuildTableViewController ()<UITabBarControllerDelegate>

@property (nonatomic) BuildManager * workoutsData;
@property (weak, nonatomic) IBOutlet UIButton *finishWorkoutButton;

@property (nonatomic) int checkedWorkouts;
@property (nonatomic) BOOL isSelected;

@end

@implementation GOBuildTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.hidesBackButton = YES;
    
    self.checkedWorkouts = 0;
    
    if ((self.workoutsData.workoutList.count == 0)||(self.workoutsData.workoutList.count != self.checkedWorkouts)){
        self.finishWorkoutButton.hidden = YES;
    }
    
    self.workoutsData = [BuildManager sharedInstance];
    [self.workoutsData initializeModel];
    
    [self.tableView reloadData];
    
    NSLog(@"%@", self.workoutsData.workoutList);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.workoutsData.workoutList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    CustomTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GoBuildIdentifier"];
    
    if (!cell){
        cell = [[CustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"GoBuildIdentifier"];
    }
    
    BuildWorkout *thisWorkout = [self.workoutsData.workoutList objectAtIndex:indexPath.row];
    
    
    cell.workoutNameLabel.text = thisWorkout.exerciseName;
    cell.setLabel.text = [NSString stringWithFormat:@"%ld sets",(long)thisWorkout.sets];
    cell.repLabel.text = [NSString stringWithFormat:@"%ld reps",(long)thisWorkout.reps];
    cell.weightLabel.text = [NSString stringWithFormat:@"%ld lbs",(long)thisWorkout.weight];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete && !self.isSelected){
        [self.workoutsData.workoutList removeObjectAtIndex:indexPath.row];
        
        UITableViewCell *tableCell = [tableView cellForRowAtIndexPath:indexPath];
        tableCell.accessoryType = UITableViewCellAccessoryNone;
        
        self.checkedWorkouts -= 1;
        NSLog(@"checked deleted");
        
        [self countCheck];
        
        [tableView reloadData];
        
    } else if (editingStyle == UITableViewCellEditingStyleDelete && self.isSelected){
        [self.workoutsData.workoutList removeObjectAtIndex:indexPath.row];
        NSLog(@"un-checked deleted");
        
        [self countCheck];
        
        [tableView reloadData];
    }
    
    NSLog(@"%lu", (unsigned long)self.workoutsData.workoutList.count);
}
- (void) countCheck {
    
    if (self.workoutsData.workoutList.count == self.checkedWorkouts){
        self.finishWorkoutButton.hidden = NO;
    } else {
        self.finishWorkoutButton.hidden = YES;
    }
    
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
     [self.tableView reloadData];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell *tableCell = [tableView cellForRowAtIndexPath:indexPath];
    self.isSelected = (tableCell.accessoryType == UITableViewCellAccessoryCheckmark);
   
    
    if (self.isSelected) {
        tableCell.accessoryType = UITableViewCellAccessoryNone;
        self.checkedWorkouts -= 1;
    }
    else {
        tableCell.accessoryType = UITableViewCellAccessoryCheckmark;
        NSLog (@"selected: %ld", (long)indexPath.row);
        self.checkedWorkouts += 1;
    }
    NSLog(@"checked workouts: %d", self.checkedWorkouts);
    
    if (self.checkedWorkouts == self.workoutsData.workoutList.count){
        self.finishWorkoutButton.hidden = NO;
        NSLog(@"YES!");
         NSLog(@"checked workouts: %d", self.checkedWorkouts);
    } else {
        self.finishWorkoutButton.hidden = YES;
    }
    
    [self.tableView reloadData];
    
}
- (void) viewDidAppear:(BOOL)animated{
    if ((self.workoutsData.workoutList.count == 0)||(self.workoutsData.workoutList.count != self.checkedWorkouts)){
        self.finishWorkoutButton.hidden = YES;
    }
    [self.tableView reloadData];
}
- (void) viewWillAppear:(BOOL)animated{
    
    
    [super viewWillAppear:animated];
    
    CAGradientLayer *bgLayer = [BackgroundGradient greenGradient];
    bgLayer.frame = self.view.bounds;
    [self.view.layer insertSublayer:bgLayer atIndex:0];
    
    [self.navigationController setNavigationBarHidden:NO];
    
    self.tabBarController.tabBar.hidden = NO;
    
    self.navigationController.navigationBar.hidden = NO;
}

- (IBAction)finishWorkoutPressed:(UIButton *)sender {
    
    [self clearAccessoryMarks];
    self.workoutsData.workoutList = nil;
    self.finishWorkoutButton.hidden = YES;
    self.checkedWorkouts = 0;
    
    [self.tableView reloadData];
    
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];

    
    NSLog(@"checked workouts: %d", self.checkedWorkouts);
}
- (void) clearAccessoryMarks {
    
    NSIndexPath *indexPath;
    
    NSInteger count = self.workoutsData.workoutList.count;
    
    //  UITableViewCell *tableCell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    for (int i = 0; i < count; i++){
        
        UITableViewCell *tableCell = [self.tableView cellForRowAtIndexPath:indexPath];
        tableCell.accessoryType = UITableViewCellAccessoryNone;
        tableCell.accessoryView = nil;
        NSLog(@"deleted check mark");
        
        [self.tableView reloadData];
    }
    
}


@end
