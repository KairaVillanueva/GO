//
//  CreateWorkoutViewController.h
//  unit-1-final-project
//
//  Created by Jamaal Sedayao on 8/28/15.
//  Copyright © 2015 apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BuildWorkout.h"
#import "BuildManager.h"

@interface CreateWorkoutViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>


@property (nonatomic) NSDictionary * exercises;
@property (nonatomic) NSString *exerciseNameString;
@property (nonatomic) BuildWorkout *model;

@property (nonatomic) NSInteger setsNumber;
@property (nonatomic) NSInteger repsNumber;
@property (nonatomic) NSInteger weightNumber;

@property (nonatomic) NSMutableArray * workoutList;

@end
