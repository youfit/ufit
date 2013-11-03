//
//  UFRegimentViewController.h
//  uFit
//
//  Created by Daniel Shteremberg on 11/2/13.
//  Copyright (c) 2013 uFit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UFRegimentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *exerciseName;

@end

@interface UFRegimentViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
