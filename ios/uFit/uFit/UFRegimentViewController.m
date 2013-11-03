//
//  UFRegimentViewController.m
//  uFit
//
//  Created by Daniel Shteremberg on 11/2/13.
//  Copyright (c) 2013 uFit. All rights reserved.
//

#import "UFRegimentViewController.h"
#import "UFExerciseState.h"
#import "UFExerciseViewController.h"

@implementation UFRegimentTableViewCell

@end

@interface UFRegimentViewController ()

@end

@implementation UFRegimentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(exerciseCompleted:) name:@"ExerciseCompleted" object:nil];
}

- (void)exerciseCompleted:(NSNotification *)notification {
    [[self tableView] reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"RegimentCell";
    UFRegimentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UFRegimentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSArray *demoExercises = [UFExerciseState sharedInstance].exerciseNames;
    NSArray *demoExerciseTimes = [UFExerciseState sharedInstance].exerciseTimes;
    NSString *exerciseName = demoExercises[[indexPath indexAtPosition:1]];
    cell.textLabel.text = exerciseName;
    cell.detailTextLabel.text = demoExerciseTimes[[indexPath indexAtPosition:1]];
    cell.imageView.image = [[UFExerciseState sharedInstance] imageForExerciseName:exerciseName];
    
    if ([[UFExerciseState sharedInstance].completedExercises containsObject:exerciseName]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *demoExercises = [UFExerciseState sharedInstance].exerciseNames;
    NSString *exerciseName = demoExercises[[indexPath indexAtPosition:1]];

    UFExerciseViewController *controller = [[UFExerciseViewController alloc] initWithExerciseName:exerciseName];
    [[self navigationController] presentViewController:controller animated:YES completion:nil];
    
    return nil;
}


@end
