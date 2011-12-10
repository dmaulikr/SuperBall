//
//  GyroBallLayer.h
//  SuperBall
//
//  Created by Thomas Fankhauser on 20.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "Constants.h"
#import <CoreMotion/CoreMotion.h>

@interface GyroBallLayer : CCLayer{
    float nextX;
    float nextY;
    float accelerationX;
    float accelerationY;
    CCAction *moveAction;
    CCSpriteBatchNode *obstacles;
    CMMotionManager *motionManager;
}

@property (nonatomic, retain) CCAction *moveAction;
@property (nonatomic, retain) CCSpriteBatchNode *obstacles;
@property (nonatomic, retain) CMMotionManager *motionManager;

-(void)update:(ccTime)dt;

@end
