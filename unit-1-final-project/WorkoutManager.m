//
//  WorkoutManager.m
//  unit-1-final-project
//
//  Created by Fatima Zenine Villanueva on 8/22/15.
//  Copyright © 2015 apps. All rights reserved.
//

#import "WorkoutManager.h"
#import "Workout.h"
#import "Exercises.h"

@implementation WorkoutManager

#pragma mark Singleton Methods

@synthesize workouts;
@synthesize calendarDates;

+ (WorkoutManager *) sharedManager{
    static WorkoutManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
        sharedMyManager.workouts = [[NSMutableArray alloc] init];
        [sharedMyManager preLoadedWorkouts];
    });
    return sharedMyManager;
}

+ (WorkoutManager *) calendarManager{
    static WorkoutManager *calendarMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        calendarMyManager = [[self alloc] init];
        calendarMyManager.calendarDates = [[NSMutableDictionary alloc] init];
    });
    return calendarMyManager;
}

- (void)preLoadedWorkouts {
    
//Exercise List - GO HARD

    
    Exercises *warmup = [[Exercises alloc] init];
    warmup.nameOfExercise = @"Exercise Will Begin In:";
    warmup.exerciseTime = 5.0;
    warmup.exerciseImageString = @"warmup";
    
    
    Exercises *gohard1 = [[Exercises alloc] init];
    gohard1.nameOfExercise = @"Push-ups";
    gohard1.exerciseTime = 5.0;
    gohard1.exerciseImageString = @"pushup";
    
    Exercises *gohard2 = [[Exercises alloc] init];
    gohard2.nameOfExercise = @"Pull-ups";
    gohard2.exerciseTime = 7.0;
    gohard2.exerciseImageString = @"pullup";
    
    Exercises *gohard3 = [[Exercises alloc] init];
    gohard3.nameOfExercise = @"Sit-ups";
    gohard3.exerciseTime = 10.0;
    gohard3.exerciseImageString = @"situp";
    
    Exercises *gohard4 = [[Exercises alloc] init];
    gohard4.nameOfExercise = @"Squats";
    gohard4.exerciseTime = 20.0;
   // gohard4.exerciseImageString = @"squats";
    
    Exercises *gohard5 = [[Exercises alloc] init];
    gohard5.nameOfExercise = @"Burpees";
    gohard5.exerciseTime = 15.0;
   // gohard5.exerciseImageString = @"burpees";
    
    Exercises *gohard6 = [[Exercises alloc] init];
    gohard6.nameOfExercise = @"Lunges";
    gohard6.exerciseTime = 12.0;
   // gohard6.exerciseImageString = @"lunges";
    
    Exercises *gohard7 = [[Exercises alloc] init];
    gohard7.nameOfExercise = @"Dips";
    gohard7.exerciseTime = 10.0;
   // gohard7.exerciseImageString = @"dips";
    
    
    
//Exercise List - GO LEAN
    
    Exercises *golean1 = [[Exercises alloc]init];
    golean1.nameOfExercise = @"Jog";
    golean1.exerciseTime = 10.0;
    golean1.exerciseImageString = @"jog";
    
    Exercises *golean2 = [[Exercises alloc]init];
    golean2.nameOfExercise = @"Jump Rope";
    golean2.exerciseTime = 10.0;
    golean2.exerciseImageString = @"jumprope";
    
    Exercises *golean3 = [[Exercises alloc]init];
    golean3.nameOfExercise = @"Jumping Jacks";
    golean3.exerciseTime = 10.0;
    golean3.exerciseImageString = @"jumpingjacks";

    Exercises *golean4 = [[Exercises alloc]init];
    golean4.nameOfExercise = @"Plank";
    golean4.exerciseTime = 10.0;
    golean4.exerciseImageString = @"plank";

    Exercises *golean5 = [[Exercises alloc]init];
    golean5.nameOfExercise = @"Mountain-Climbers";
    golean5.exerciseTime = 10.0;
    golean5.exerciseImageString = @"mountainclimber";
    
    Exercises *golean6 = [[Exercises alloc]init];
    golean6.nameOfExercise = @"Sprints";
    golean6.exerciseTime = 10.0;
    golean6.exerciseImageString = @"sprints";

    Exercises *golean7 = [[Exercises alloc]init];
    golean7.nameOfExercise = @"Step Runs";
    golean7.exerciseTime = 10.0;
    golean7.exerciseImageString = @"steprun";

//Workout List - (Array of Exercises)
    
    // 1st Workout
    
    Workout *workout1 = [[Workout alloc] init];
    workout1.exercises = [[NSMutableArray alloc] init];
    workout1.workoutName = @"Go Hard!";
    
    [workout1.exercises addObject:warmup];
    [workout1.exercises addObject:gohard1];
    [workout1.exercises addObject:gohard2];
    [workout1.exercises addObject:gohard3];
    [workout1.exercises addObject:gohard4];
    [workout1.exercises addObject:gohard5];
    [workout1.exercises addObject:gohard6];
    [workout1.exercises addObject:gohard7];
    
    
    // 2nd Workout
    
    Workout *workout2 = [[Workout alloc] init];
    workout2.exercises = [[NSMutableArray alloc] init];
    workout2.workoutName = @"Go Lean!";
    
    [workout2.exercises addObject: warmup];
    [workout2.exercises addObject:golean1];
    [workout2.exercises addObject:golean2];
    [workout2.exercises addObject:golean3];
    [workout2.exercises addObject:golean4];
    [workout2.exercises addObject:golean5];
    [workout2.exercises addObject:golean6];
    [workout2.exercises addObject:golean7];

    
// Adding Workouts to GOWorkoutViewController Array
    
    [self.workouts addObject:workout1];
    [self.workouts addObject:workout2];
}




@end
