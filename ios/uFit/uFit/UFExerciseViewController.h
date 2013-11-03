//
//  UFExerciseViewController.h
//  uFit
//
//  Created by Daniel Shteremberg on 11/2/13.
//  Copyright (c) 2013 uFit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UFExerciseViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *exerciseLabel;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIView *keyboardPlate;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;

- (id)initWithExerciseName:(NSString *)exerciseName;

@end
