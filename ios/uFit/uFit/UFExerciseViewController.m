//
//  UFExerciseViewController.m
//  uFit
//
//  Created by Daniel Shteremberg on 11/2/13.
//  Copyright (c) 2013 uFit. All rights reserved.
//

#import "UFExerciseViewController.h"
#import "UFExerciseState.h"

@interface UFExerciseViewController ()
@property(strong) NSString *exerciseName;
@property(strong) NSTimer *timer;
@property(assign) NSInteger timerOfViewPresentation;

@end

@implementation UFExerciseViewController

- (id)initWithExerciseName:(NSString *)exerciseName {
    self = [super initWithNibName:@"UFExerciseViewController" bundle:[NSBundle mainBundle]];
    self.exerciseName = exerciseName;
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.exerciseLabel.text = self.exerciseName;
    // Do any additional setup after loading the view from its nib.
    
    
    NSURL *url = [NSURL URLWithString:[[UFExerciseState sharedInstance] exerciseURLForName:self.exerciseName]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    self.webView.scrollView.scrollEnabled = NO;
    self.webView.scrollView.bounces = NO;
    [self.webView loadRequest:request];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    self.timerOfViewPresentation = [[NSDate date] timeIntervalSinceReferenceDate];
}

- (void)timerFired:(NSTimer *)timer {
    NSInteger timerInterval = [[NSDate date] timeIntervalSinceReferenceDate] - self.timerOfViewPresentation;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timerInterval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"mm:ss"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    NSString *formattedDate = [dateFormatter stringFromDate:date];
    self.timerLabel.text = formattedDate;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickedDone:(id)sender {
    [[[UFExerciseState sharedInstance] completedExercises] addObject:self.exerciseName];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ExerciseCompleted" object:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO; //I've also tried YES
}

@end
