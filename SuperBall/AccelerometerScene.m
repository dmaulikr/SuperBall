//
//  AccelerometerScene.m
//  SuperBall
//
//  Created by Thomas Fankhauser on 13.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "AccelerometerScene.h"

@implementation AccelerometerScene

- (id)init {
    self = [super init];
    if (self) {
        
        // enable accelerometer
        [[UIAccelerometer sharedAccelerometer] setDelegate:self];
        
        // create and add headsup layer
        HeadsupLayer *headsupLayer = [HeadsupLayer node];
        [self addChild:headsupLayer z:0 tag:0];
        
        // create and add obstacle layer
        ObstacleLayer *obstacleLayer = [ObstacleLayer node];
        [self addChild:obstacleLayer z:1 tag:2];
        
        // create and add ball layer
        BallLayer *ballLayer = [BallLayer node];
        ballLayer.obstacles = obstacleLayer.obstacles;
        [self addChild:ballLayer z:2 tag:1];
        
    }
    return self;
}

- (void) accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {    
    HeadsupLayer *headsupLayer = (HeadsupLayer *)[self getChildByTag:0];
    [headsupLayer accelerometer:[UIAccelerometer sharedAccelerometer] didAccelerate:acceleration];
    
    BallLayer *ballLayer = (BallLayer *)[self getChildByTag:1];
    [ballLayer accelerometer:[UIAccelerometer sharedAccelerometer] didAccelerate:acceleration];
}

@end
