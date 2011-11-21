//
//  AccelerometerAngleScene.m
//  SuperBall
//
//  Created by Thomas Fankhauser on 19.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "AccelerometerAngleScene.h"

@implementation AccelerometerAngleScene

- (id)init {
    self = [super init];
    if (self) {
        
        // create and add angle layer
        AngleLayer *angleLayer = [AngleLayer node];
        [self addChild:angleLayer];
        
    }
    return self;
}

@end
