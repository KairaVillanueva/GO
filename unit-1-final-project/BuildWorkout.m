//
//  BuildWorkout.m
//  unit-1-final-project
//
//  Created by Jamaal Sedayao on 8/28/15.
//  Copyright © 2015 apps. All rights reserved.
//

#import "BuildWorkout.h"

@implementation BuildWorkout

-(void) initializeData{
    self.exercises = [[NSDictionary alloc]init];
    
    
    NSArray *legs = @[@"squat",
                      @"leg press",
                      @"leg curls",
                      @"calf raises",
                      @"leg extension",
                      @"box jumps"
                      ];
    
    NSArray *chest = @[@"bench press",
                       @"chest fly",
                       @"incline dumbell press",
                       @"push-ups",
                       @"dips",
                       @"cable crossovers"
                       ];
    
    
    
    NSArray *back = @[@"dumbell rows",
                      @"lat pulldown",
                      @"deadlifts",
                      @"barbell rows",
                      @"close-grip pulldown",
                      @"pull-ups"
                      ];
    
    self.exercises = @{
                       @"Legs": legs,
                       @"Chest": chest,
                       @"Back" : back,
                       };
    
    
    
}


@end
