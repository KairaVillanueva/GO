//
//  CreateWorkoutViewController.m
//  unit-1-final-project
//
//  Created by Jamaal Sedayao on 8/28/15.
//  Copyright © 2015 apps. All rights reserved.
//

#import "CreateWorkoutViewController.h"

@interface CreateWorkoutViewController () <UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerTwo;

@property (weak, nonatomic) IBOutlet UILabel *exerciseNameLabel;

//sets
@property (weak, nonatomic) IBOutlet UIStepper *setsStepper;
@property (weak, nonatomic) IBOutlet UILabel *setsLabel;

//reps
@property (weak, nonatomic) IBOutlet UIStepper *repsStepper;
@property (weak, nonatomic) IBOutlet UILabel *repsLabel;

//weights
@property (weak, nonatomic) IBOutlet UILabel *weightsLabel;
@property (weak, nonatomic) IBOutlet UISlider *weightsSlider;

//add button
@property (weak, nonatomic) IBOutlet UIButton *addButton;

@property (nonatomic) BuildManager * existingData;


@end

@implementation CreateWorkoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.existingData = [BuildManager sharedInstance];
    [self.existingData initializeModel];
    
    
    self.model = [[BuildWorkout alloc]init];
    [self.model initializeData];
    
    self.picker.delegate = self;
    self.picker.dataSource = self;
    
    self.pickerTwo.delegate = self;
    self.pickerTwo.dataSource = self;
    
    self.model.reps = 10;
    self.model.sets = 3;
    self.model.weight = 200;
}

//Picker View

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component

{
    if ([pickerView isEqual:self.picker]){
        NSArray *workoutTypes = [self.model.exercises allKeys];
        return workoutTypes.count;
    }
    else if ([pickerView isEqual:self.pickerTwo]){
        NSIndexPath *indexPath;
        NSArray *workoutTypes = [self.model.exercises allKeys];
        NSString *workoutType = [workoutTypes objectAtIndex:indexPath.row];
        NSArray *workoutsForType = [self.model.exercises objectForKey:workoutType];
        return workoutsForType.count;
    }
    return 1;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if ([pickerView isEqual:self.picker]){
        return [[self.model.exercises allKeys] objectAtIndex:row];
    }
    else if ([pickerView isEqual:self.pickerTwo]){
        //        NSIndexPath *indexPath;
        //        NSArray *workoutTypes = [self.model.exercises allKeys];
        //        NSString *workoutType = [workoutTypes objectAtIndex:indexPath.row];
        //        return [[self.model.exercises objectForKey:workoutType] objectAtIndex:row];
        NSInteger typeWorkoutRow = [self.picker selectedRowInComponent:0];
        NSArray *allExercises = [self.model.exercises allKeys];
        NSString *allExercisesType = [allExercises objectAtIndex:typeWorkoutRow];
        // self.exerciseNameLabel.text = [[self.model.exercises objectForKey:allExercisesType]objectAtIndex:row];
        self.exerciseNameString = [[self.model.exercises objectForKey:allExercisesType]objectAtIndex:row];
        self.exerciseNameLabel.text = self.exerciseNameString;
        self.model.exerciseName = self.exerciseNameString;
        
        return [[self.model.exercises objectForKey:allExercisesType]objectAtIndex:row];
        
    }
    
    return @"";
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if ([pickerView isEqual:self.picker]){
        [self.pickerTwo reloadAllComponents];
        
    } //else if ([pickerView isEqual:self.pickerTwo]){
    
 //   NSInteger typeWorkoutRow = [self.picker selectedRowInComponent:0];
    
  //  NSArray *allExercises = [self.model.exercises allKeys];
    //   NSString *allExercisesType = [allExercises objectAtIndex:typeWorkoutRow];
    
}
- (IBAction)setsValueChanged:(UIStepper *)sender {
    self.setsNumber = [sender value];
    self.model.sets = self.setsNumber;
    [self.setsLabel setText:[NSString stringWithFormat:@"%d", (int)[sender value]]];
    
}

- (IBAction)repsValueChanged:(UIStepper *)sender {
    
    self.repsNumber = [sender value];
    self.model.reps = self.repsNumber;
    [self.repsLabel setText:[NSString stringWithFormat:@"%d", (int)[sender value]]];
    
}
- (IBAction)weightsSliderValue:(UISlider *)sender {
    
    [sender setValue:((int)((sender.value + 2.5) / 5) * 5) animated:NO];
    
    self.weightNumber = [sender value];
    self.model.weight = self.weightNumber;
    [self.weightsLabel setText:[NSString stringWithFormat:@"%d", (int)[sender value]]];
    
}

- (IBAction)addPressed:(UIButton *)sender {
    
    [self.existingData.workoutList addObject:self.model];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}
@end
