//
//  GOTimerViewController.m
//  unit-1-final-project
//
//  Created by Jamaal Sedayao on 8/23/15.
//  Copyright © 2015 apps. All rights reserved.
//

#import "GOTimerViewController.h"
#import "Exercises.h"

@interface GOTimerViewController ()

@property (nonatomic) NSTimer *timer;
@property (nonatomic) Exercises *thisExercise;

@property (weak, nonatomic) IBOutlet UIButton *endButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;
@property (weak, nonatomic) IBOutlet UIButton *continueButton;


@end

@implementation GOTimerViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.continueButton.hidden = YES;

    NSLog(@"Exercise Index: %lu", self.currentExerciseIndex);

    // This the timer for the workout
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                  target:self
                                                selector:@selector(updateExerciseTimer)
                                                userInfo:nil
                                                 repeats:YES];
    
//timer starts when viewLoads
    [self initializeTimer];
    
//setting fonts
    
    self.totalTimeExerciseLabel.font = [UIFont fontWithName:@"NikeTotal90" size:15.0];
    self.exerciseNameLabel.font = [UIFont fontWithName:@"NikeTotal90" size:15.0];
    self.exerciseTimeLabel.font = [UIFont fontWithName:@"NikeTotal90" size:15.0];

    
    self.thisExercise = [self.currentWorkout.exercises objectAtIndex: (NSUInteger)self.currentExerciseIndex];
    self.currentExerciseName = self.thisExercise.nameOfExercise;
    self.currentExerciseTime = self.thisExercise.exerciseTime;
   
  // Updates based on exercise
    self.exerciseTimeLabel.text = [NSString stringWithFormat:@"%f",self.currentExerciseTime];
    
    self.exerciseNameLabel.text = self.thisExercise.nameOfExercise;
    
    NSString *imageName = self.thisExercise.exerciseImageString;
    UIImageView *view = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    self.exerciseImageView.image = view.image;
   
    
    if (self.currentExerciseIndex == (NSInteger)nil){
        self.currentExerciseIndex = 0;
    }
    
    NSInteger count = [self.currentWorkout.exercises count];
    NSLog(@"This workout has %lu exercises", count);
    
}
- (void) initializeTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                  target:self
                                                selector:@selector(updateExerciseTimer)
                                                userInfo:nil
                                                 repeats:YES];
    
    
}

//method pushes to next exercise in array
- (void) initializeNextExerciseScreen {
    
    GOTimerViewController *nextViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"WorkoutController"];
    nextViewController.currentWorkout = self.currentWorkout;
    nextViewController.currentExerciseIndex = self.currentExerciseIndex+1;
    [self.timer invalidate];
    [self.navigationController pushViewController:nextViewController animated:YES];
    
}


- (void) updateExerciseTimer {
    NSLog(@"%@", self.exerciseTimeLabel.text);
    NSInteger count = [self.currentWorkout.exercises count];
    NSInteger one = 1.0;
    NSInteger currentExerciseTime = [self.exerciseTimeLabel.text integerValue];
    NSInteger nextNumber = currentExerciseTime - one;
    self.exerciseTimeLabel.text = [NSString stringWithFormat:@"%lu", nextNumber];
    if (nextNumber == 0 && self.currentExerciseIndex < count - 1) {
        NSLog(@"Next exercise");
        
        [self initializeNextExerciseScreen];
        
    } else if (nextNumber == 0 && self.currentExerciseIndex == count - 1) {
        
        [self.timer invalidate];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
}


- (IBAction)pausePressed:(UIButton *)sender {
    
    [self.timer invalidate];
    
    self.pauseButton.hidden = YES;
    self.continueButton.hidden = NO;
    
}
- (IBAction)continuePressed:(UIButton *)sender {
    [self initializeTimer];
    
    self.pauseButton.hidden = NO;
    self.continueButton.hidden = YES;
    
}

- (IBAction)end:(UIButton *)sender {
    [self.timer invalidate];
    [self.navigationController popToRootViewControllerAnimated:YES];
}





/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
