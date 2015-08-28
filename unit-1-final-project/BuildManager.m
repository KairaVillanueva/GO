//
//  BuildManager.m
//  unit-1-final-project
//
//  Created by Jamaal Sedayao on 8/28/15.
//  Copyright © 2015 apps. All rights reserved.
//

#import "BuildManager.h"

@implementation BuildManager

+ (BuildManager *) sharedInstance{
    
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
- (void) initializeModel {
    
    if (self.workoutList == nil){
        self.workoutList = [[NSMutableArray alloc] init];
    } else {
        nil;
    }
}


@end
