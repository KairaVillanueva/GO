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
@property (nonatomic) NSTimer *totalTimer;
@property (nonatomic) float mainTotalTime;
@property (nonatomic) float previousMainTotalTime;

@property (nonatomic) NSDate *mainPreviousTime;
@property (nonatomic) NSDate *currentTime;
//for exercise timer
@property (nonatomic) NSDate *timerMainPreviousTime;
@property (nonatomic) NSDate *timerCurrentTime;
@property (nonatomic) NSDate *timerDate;
@property (nonatomic) float timerMainTotalTime;

@property (nonatomic) Exercises *thisExercise;
@property (nonatomic) BOOL isRunning;

@property (weak, nonatomic) IBOutlet UIButton *endButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;
@property (weak, nonatomic) IBOutlet UIButton *continueButton;

@end

@implementation GOTimerViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    self.continueButton.hidden = YES;

    NSLog(@"Exercise Index: %lu", self.currentExerciseIndex);
    
//timer starts when viewLoads
    [self initializeTimer];
    
    
    NSLog(@"previous total time: %f", self.previousMainTotalTime);
    
    
    
//setting fonts
    
    self.totalTimeExerciseLabel.font = [UIFont fontWithName:@"NikeTotal90" size:15.0];
    self.exerciseNameLabel.font = [UIFont fontWithName:@"NikeTotal90" size:15.0];
    self.exerciseTimeLabel.font = [UIFont fontWithName:@"NikeTotal90" size:15.0];

    
    self.thisExercise = [self.currentWorkout.exercises objectAtIndex: (NSUInteger)self.currentExerciseIndex];
    self.currentExerciseName = self.thisExercise.nameOfExercise;
    self.currentExerciseTime = self.thisExercise.exerciseTime;
   
  // Updates based on exercise
   // self.exerciseTimeLabel.text = [NSString stringWithFormat:@"%f",self.currentExerciseTime];
    
    self.timerDate = [NSDate dateWithTimeIntervalSince1970:self.currentExerciseTime];
    
    NSDateFormatter *timerFormatter = [[NSDateFormatter alloc]init];
    [timerFormatter setDateFormat:@"mm : ss"];
    [timerFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    NSString *timerString = [timerFormatter stringFromDate:self.timerDate];
    self.exerciseTimeLabel.text = timerString;

    
    
    self.exerciseNameLabel.text = self.thisExercise.nameOfExercise;
    
    NSString *imageName = self.thisExercise.exerciseImageString;
    UIImageView *view = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    self.exerciseImageView.image = view.image;
   
    
    self.mainTotalTime = self.mainTotalTime + self.previousMainTotalTime;
    
    self.currentTime = [NSDate dateWithTimeIntervalSince1970:self.mainTotalTime];
    [timerFormatter setDateFormat:@"mm : ss"];
    [timerFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    NSString *totalTimerString = [timerFormatter stringFromDate:self.currentTime];
    
    self.totalTimeExerciseLabel.text = totalTimerString;
    
    if (self.currentExerciseIndex == (NSInteger)nil){
        self.currentExerciseIndex = 0;
    }
    
    if (self.currentExerciseIndex == 0){
        [self.totalTimer invalidate];
        self.totalTimeExerciseLabel.text = @"Get ready to GO!";
        self.mainTotalTime = self.mainTotalTime - 1;
    } else if (self.currentExerciseIndex >= 1){
        [self initializeTotalTimer];
    }
    
    
}

//method to initialize Total Workout Timer
- (void) initializeTotalTimer{
    self.totalTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                       target:self
                                                     selector:@selector(updateTotalTimer)
                                                     userInfo:nil
                                                      repeats:YES];
    
    self.mainPreviousTime = [[NSDate alloc] init];
}
//method to initialze Exercise Timer
- (void) initializeTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                  target:self
                                                selector:@selector(updateExerciseTimer)
                                                userInfo:nil
                                                 repeats:YES];
    
    self.timerMainPreviousTime = [[NSDate alloc]init];
}

- (void) updateTotalTimer {
    
    self.currentTime = [[NSDate alloc] init];
    
    NSTimeInterval elapsedTime = [self.currentTime timeIntervalSinceDate: self.mainPreviousTime];
    self.mainPreviousTime = self.currentTime;
   // double one = 1.0;
    
    self.mainTotalTime += elapsedTime;
    
    NSDate *timeDate = [NSDate dateWithTimeIntervalSince1970:self.mainTotalTime];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"mm : ss"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    NSString *timeString = [dateFormatter stringFromDate:timeDate];
    self.totalTimeExerciseLabel.text = timeString;
    
    
//    NSLog(@"main total: %f", self.mainTotalTime);
    
    
    
}
- (void) updateExerciseTimer {
    
//    NSDate *currentTimer = [[NSDate alloc] init];
//    
//    NSTimeInterval elapsedTime = [currentTimer timeIntervalSinceDate:self.timerMainPreviousTime];
//    self.timerMainPreviousTime = currentTimer;
    
    double one = 1.0;
    
    self.currentExerciseTime -= one;
    
    NSDate *timerDate = [NSDate dateWithTimeIntervalSince1970:self.currentExerciseTime];
    
    NSDateFormatter *timerFormatter = [[NSDateFormatter alloc]init];
    [timerFormatter setDateFormat:@"mm : ss"];
    [timerFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]];
    NSString *timerString = [timerFormatter stringFromDate:timerDate];
    self.exerciseTimeLabel.text = timerString;

    NSInteger count = [self.currentWorkout.exercises count];
    
    if (self.currentExerciseTime == 0 && self.currentExerciseIndex < count - 1) {
        NSLog(@"Next exercise");
        
        [self initializeNextExerciseScreen];
        
    } else if (self.currentExerciseTime == 0 && self.currentExerciseIndex == count - 1) {
        
        [self.timer invalidate];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
}
//method pushes to next exercise in array
- (void) initializeNextExerciseScreen {
    
    GOTimerViewController *nextViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"WorkoutController"];
    nextViewController.currentWorkout = self.currentWorkout;
    nextViewController.currentExerciseIndex = self.currentExerciseIndex+1;
    [self.timer invalidate];
    [self.navigationController pushViewController:nextViewController animated:YES];
    nextViewController.previousMainTotalTime = self.mainTotalTime + 1;
    NSLog(@"main total time: %f", (self.mainTotalTime + self.previousMainTotalTime));

}

- (IBAction)pausePressed:(UIButton *)sender {
    
    [self.timer invalidate];
    [self.totalTimer invalidate];
    
    self.pauseButton.hidden = YES;
    self.continueButton.hidden = NO;
    
}
- (IBAction)continuePressed:(UIButton *)sender {
    [self initializeTimer];
  
    
    if (self.currentExerciseIndex >= 1){
          [self initializeTotalTimer];
    }

    
    self.pauseButton.hidden = NO;
    self.continueButton.hidden = YES;
    
}

- (IBAction)end:(UIButton *)sender {
    [self.timer invalidate];
    [self.totalTimer invalidate];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void) viewDidDisappear:(BOOL)animated {
    [self.timer invalidate];
    [self.totalTimer invalidate];

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
