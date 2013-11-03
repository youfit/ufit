//
//  UFDetailViewController.m
//  uFit
//
//  Created by Daniel Shteremberg on 11/2/13.
//  Copyright (c) 2013 uFit. All rights reserved.
//

#import "UFDetailViewController.h"
#import "UFExerciseState.h"

@interface UFDetailViewController ()

@end

@implementation UFDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *demoExercises = [UFExerciseState sharedInstance].exerciseNames;
    NSArray *demoExercisesArea =[UFExerciseState sharedInstance].exerciseMuscleGroups;

    NSString *identifier = @"DetailCellView";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = demoExercises[[indexPath indexAtPosition:1]];
    cell.detailTextLabel.text = demoExercisesArea[[indexPath indexAtPosition:1]];
    cell.imageView.image = [[UFExerciseState sharedInstance] imageForExerciseName:cell.textLabel.text];

    return cell;
}

- (IBAction)startClicked:(id)sender {
    [[UFExerciseState sharedInstance] startWorkout];
}

@end
