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
        
        // create and add obstacle layer
        ObstacleLayer *obstacleLayer = [ObstacleLayer node];
        [self addChild:obstacleLayer z:1 tag:2];
        
        // create and add ball layer
        GyroBallLayer *gyroBallLayer = [GyroBallLayer node];
        gyroBallLayer.obstacles = obstacleLayer.obstacles;
        [self addChild:gyroBallLayer z:2 tag:1];
    }
    return self;
}

@end
