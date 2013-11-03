//
//  UFExerciseState.h
//  uFit
//
//  Created by Daniel Shteremberg on 11/2/13.
//  Copyright (c) 2013 uFit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UFExerciseState : NSObject
@property(readonly) NSArray *exerciseNames;
@property(readonly) NSArray *exerciseMuscleGroups;
@property(readonly) NSArray *exerciseTimes;

@property(strong) NSMutableSet *completedExercises;

+ (UFExerciseState *)sharedInstance;
- (NSString *)exerciseURLForName:(NSString *)name;
- (UIImage *)imageForExerciseName:(NSString *)name;

- (void)startWorkout;
- (void)endWorkout;
- (NSInteger)workoutDuration;

@end
