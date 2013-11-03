//
//  UFDoneViewController.m
//  uFit
//
//  Created by Daniel Shteremberg on 11/2/13.
//  Copyright (c) 2013 uFit. All rights reserved.
//

#import "UFDoneViewController.h"
#import "UFExerciseState.h"

@interface UFDoneViewController ()

@end

@implementation UFDoneViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSInteger workoutDuration = [[UFExerciseState sharedInstance] workoutDuration];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:workoutDuration];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    self.workoutDuration.text = formattedDate;
    self.caloriesBurned.text = @"453";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[UFExerciseState sharedInstance] completedExercises] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *completedExercisesArray = [[[UFExerciseState sharedInstance] completedExercises] allObjects];
    
    NSString *identifier = @"DoneCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = completedExercisesArray[[indexPath indexAtPosition:1]];
    cell.imageView.image = [[UFExerciseState sharedInstance] imageForExerciseName:cell.textLabel.text];

    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (IBAction)shareClicked:(id)sender {
    NSString *achievement = @"Daniel has completed an achievement on UFit. He has totally rocked the same exercise for a whole week. Can you do better?";
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:@[[UIImage imageNamed:@"trophy-badge"], achievement] applicationActivities:nil];
    [self presentViewController:activityController animated:YES completion:nil];
}

@end
