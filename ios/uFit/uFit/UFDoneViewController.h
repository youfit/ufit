//
//  UFDoneViewController.h
//  uFit
//
//  Created by Daniel Shteremberg on 11/2/13.
//  Copyright (c) 2013 uFit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UFDoneViewController : UIViewController <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *workoutDuration;
@property (weak, nonatomic) IBOutlet UILabel *caloriesBurned;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
