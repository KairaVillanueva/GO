//
//  GOBuildTableViewController.h
//  unit-1-final-project
//
//  Created by Jamaal Sedayao on 8/28/15.
//  Copyright © 2015 apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTableViewCell.h"
#import "BuildManager.h"
#import "BuildWorkout.h"


@interface GOBuildTableViewController : UITableViewController

@property (nonatomic) BuildWorkout * exercise;
@property (nonatomic,retain) NSIndexPath * checkedIndexPath;


@end
