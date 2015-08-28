//
//  BuildWorkout.h
//  unit-1-final-project
//
//  Created by Jamaal Sedayao on 8/28/15.
//  Copyright © 2015 apps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BuildWorkout : NSObject

@property (nonatomic) NSDictionary * exercises;
@property (nonatomic) NSString *exerciseName;
@property (nonatomic) NSInteger sets;
@property (nonatomic) NSInteger reps;
@property (nonatomic) NSInteger weight;
-(void) initializeData;

@end
