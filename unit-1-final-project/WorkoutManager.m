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
//Exercise List
    
    Exercises *exercise1 = [[Exercises alloc] init];
    exercise1.nameOfExercise = @"Push-ups";
    exercise1.exerciseTime = 5.0;
    exercise1.exerciseImageString = @"pushup";
    
    Exercises *exercise2 = [[Exercises alloc] init];
    exercise2.nameOfExercise = @"Pull-ups";
    exercise2.exerciseTime = 7.0;
    exercise2.exerciseImageString = @"pullup";
    
    Exercises *exercise3 = [[Exercises alloc] init];
    exercise3.nameOfExercise = @"sit-ups";
    exercise3.exerciseTime = 10.0;
    exercise3.exerciseImageString = @"situp";
    
    
//Workout List - (Array of Exercises)
    
    // 1st Workout
    
    Workout *workout1 = [[Workout alloc] init];
    workout1.exercises = [[NSMutableArray alloc] init];
    workout1.workoutName = @"Go Lean!";
    
    
    [workout1.exercises addObject:exercise1];
    [workout1.exercises addObject:exercise2];
    [workout1.exercises addObject:exercise3];
    
    
    // 2nd Workout
    
    Workout *workout2 = [[Workout alloc] init];
    workout2.exercises = [[NSMutableArray alloc] init];
    workout2.workoutName = @"Go Hard!";
    
    [workout2.exercises addObject:exercise1];
    [workout2.exercises addObject:exercise2];
    
    
// Adding Workouts to GOWorkoutViewController Array
    
    [self.workouts addObject:workout1];
    [self.workouts addObject:workout2];
}




@end
