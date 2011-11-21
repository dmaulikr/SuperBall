//
//  CoreMotionFieldScene.m
//  SuperBall
//
//  Created by Thomas Fankhauser on 21.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "CoreLocationFieldScene.h"

@implementation CoreLocationFieldScene

- (id)init {
    self = [super init];
    if (self) {
        
        // create and add angle layer
        CoreLocationNeedleLayer *coreMotionNeedleLayer = [CoreLocationNeedleLayer node];
        [self addChild:coreMotionNeedleLayer];
        
    }
    return self;
}

@end
