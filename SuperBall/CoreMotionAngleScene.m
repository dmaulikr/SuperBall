//
//  CoreMotionAngleScene.m
//  SuperBall
//
//  Created by Thomas Fankhauser on 20.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "CoreMotionAngleScene.h"

@implementation CoreMotionAngleScene

- (id)init {
    self = [super init];
    if (self) {
        
        // create and add angle layer
        CoreMotionAngleLayer *coreMotionAngleLayer = [CoreMotionAngleLayer node];
        [self addChild:coreMotionAngleLayer];
        
    }
    return self;
}

@end
