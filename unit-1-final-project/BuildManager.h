//
//  BuildManager.h
//  unit-1-final-project
//
//  Created by Jamaal Sedayao on 8/28/15.
//  Copyright © 2015 apps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BuildManager : NSObject

@property (nonatomic) NSMutableArray * workoutList;

- (void) initializeModel;

+ (BuildManager *) sharedInstance; //method that creates an instance of class

@end
