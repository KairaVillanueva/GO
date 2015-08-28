//
//  CustomTableViewCell.h
//  unit-1-final-project
//
//  Created by Jamaal Sedayao on 8/28/15.
//  Copyright © 2015 apps. All rights reserved.
//

#import "GOBuildTableViewController.h"
#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *workoutNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *setLabel;
@property (weak, nonatomic) IBOutlet UILabel *repLabel;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;




@end
