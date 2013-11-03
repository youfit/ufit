//
//  UFExerciseState.m
//  uFit
//
//  Created by Daniel Shteremberg on 11/2/13.
//  Copyright (c) 2013 uFit. All rights reserved.
//

#import "UFExerciseState.h"

@interface UFExerciseState ()
@property(assign) NSInteger workoutStartTime;
@end

@implementation UFExerciseState

+ (UFExerciseState *)sharedInstance {
    static UFExerciseState *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[UFExerciseState alloc] init];
        sharedInstance.completedExercises = [NSMutableSet new];
        [sharedInstance.completedExercises addObjectsFromArray:@[@"Biceps Curls", @"Lawnmowers"]];
    });
    return sharedInstance;
}

- (NSArray *)exerciseNames {
    return @[@"Biceps Curls", @"Lawnmowers", @"Benchpress", @"Wall climbs", @"Toes to bar"];
}

- (NSArray *)exerciseMuscleGroups {
    return @[@"Biceps", @"Triceps/Back", @"Pecs/Triceps", @"Triceps", @"Abs"];
}

- (NSArray *)exerciseTimes {
    return @[@"10 mins", @"5 mins", @"15 mins", @"7 mins", @"10 mins"];
}

- (NSString *)exerciseURLForName:(NSString *)name {
    static dispatch_once_t onceToken;
    static NSDictionary *URLs = nil;
    dispatch_once(&onceToken, ^{
        URLs = @{@"Biceps Curls": @"http://www.youtube.com/watch?v=uO_CNYidOw0",
                @"Lawnmowers": @"http://www.youtube.com/watch?v=oXGi3KJO2lo",
                @"Benchpress": @"http://www.youtube.com/watch?v=cwrL4pQLbYU",
                @"Wall climbs": @"http://www.youtube.com/watch?v=7sbEQmsVspg",
                @"Toes to bar": @"http://www.youtube.com/watch?v=1R_DICFsRWg"
                 };
    });

    return [URLs objectForKey:name];
}

- (UIImage *)imageForExerciseName:(NSString *)name {
    static dispatch_once_t onceToken;
    static NSDictionary *imageNames = nil;
    dispatch_once(&onceToken, ^{
        imageNames = @{@"Biceps Curls": @"biceps",
                 @"Lawnmowers": @"lawnmowers",
                 @"Benchpress": @"benchpress",
                 @"Wall climbs": @"wallclimbs",
                 @"Toes to bar": @"toestobar"
                 };
    });
    
    NSString *imageName = [imageNames objectForKey:name];
    UIImage *image = [UIImage imageNamed:imageName];
    return image;
}

- (void)startWorkout {
    self.workoutStartTime = [[NSDate date] timeIntervalSinceReferenceDate];
}

- (void)endWorkout {
    self.workoutStartTime = [[NSDate date] timeIntervalSinceReferenceDate];
}

- (NSInteger)workoutDuration {
    return [[NSDate date] timeIntervalSinceReferenceDate] - self.workoutStartTime;
}

@end
