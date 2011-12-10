//
//  GyroscopeScene.m
//  SuperBall
//
//  Created by Thomas Fankhauser on 20.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "GyroscopeScene.h"

@implementation GyroscopeScene

- (id)init {
    self = [super init];
    if (self) {
        
        // create core motion manager
        motionManager = [[CMMotionManager alloc] init];
        motionManager.gyroUpdateInterval = 1.0/60.0;
        [motionManager startGyroUpdates];
        
        // create and add obstacle layer
        ObstacleLayer *obstacleLayer = [ObstacleLayer node];
        [self addChild:obstacleLayer z:1 tag:2];
        
        // create and add ball layer
        GyroBallLayer *gyroBallLayer = [GyroBallLayer node];
        gyroBallLayer.motionManager = motionManager;
        gyroBallLayer.obstacles = obstacleLayer.obstacles;
        [self addChild:gyroBallLayer z:2 tag:1];
        
        // create and add ball layer
        GyroHeadsupLayer *gyroHeadsupLayer = [GyroHeadsupLayer node];
        gyroHeadsupLayer.motionManager = motionManager;
        [self addChild:gyroHeadsupLayer z:1 tag:4];
    }
    return self;
}

@end
