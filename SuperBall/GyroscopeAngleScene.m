//
//  GyrsoscopeAngleScene.m
//  SuperBall
//
//  Created by Thomas Fankhauser on 20.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "GyroscopeAngleScene.h"

@implementation GyroscopeAngleScene

- (id)init {
    self = [super init];
    if (self) {
        
        // create and add angle layer
        GyroAngleLayer *gyroAngleLayer = [GyroAngleLayer node];
        [self addChild:gyroAngleLayer];
        
    }
    return self;
}

@end
