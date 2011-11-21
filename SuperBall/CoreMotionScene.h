//
//  CoreMotionScene.h
//  SuperBall
//
//  Created by Thomas Fankhauser on 20.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "CCScene.h"
#import "cocos2d.h"
#import "CoreMotionBallLayer.h"
#import "ObstacleLayer.h"
#import "CoreMotionHeadsupLayer.h"
#import <CoreMotion/CoreMotion.h>

@interface CoreMotionScene : CCScene{
    CMMotionManager *motionManager;
}

@end
