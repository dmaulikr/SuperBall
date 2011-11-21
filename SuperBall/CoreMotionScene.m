//
//  CoreMotionScene.m
//  SuperBall
//
//  Created by Thomas Fankhauser on 20.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "CoreMotionScene.h"

@implementation CoreMotionScene

- (id)init {
    self = [super init];
    if (self) {
        
        // create core motion manager
        motionManager = [[CMMotionManager alloc] init];
        motionManager.deviceMotionUpdateInterval = 1.0/60.0;
        [motionManager startDeviceMotionUpdates];
        
        // create and add obstacle layer
        ObstacleLayer *obstacleLayer = [ObstacleLayer node];
        [self addChild:obstacleLayer z:1 tag:2];
        
        // create and add ball layer
        CoreMotionBallLayer *coreMotionBallLayer = [CoreMotionBallLayer node];
        coreMotionBallLayer.motionManager = motionManager;
        coreMotionBallLayer.obstacles = obstacleLayer.obstacles;
        [self addChild:coreMotionBallLayer z:2 tag:1];
        
        // create and add headsup layer
        CoreMotionHeadsupLayer *coreMotionHeadsupLayer = [CoreMotionHeadsupLayer node];
        coreMotionHeadsupLayer.motionManager = motionManager;
        [self addChild:coreMotionHeadsupLayer z:2 tag:3];
    }
    return self;
}

- (void)dealloc {
    [motionManager release];
    [super dealloc];
}

@end
