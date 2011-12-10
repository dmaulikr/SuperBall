//
//  GyroHeadsupLayer.h
//  SuperBall
//
//  Created by Thomas Fankhauser on 10.12.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "Constants.h"
#import <CoreMotion/CoreMotion.h>

@interface GyroHeadsupLayer : CCLayer{
    CMMotionManager *motionManager;
}

@property (nonatomic, retain) CMMotionManager *motionManager;

-(void)update:(ccTime)dt;

@end
