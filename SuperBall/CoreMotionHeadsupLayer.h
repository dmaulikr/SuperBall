//
//  CoreMotionHeadsupDisplay.h
//  SuperBall
//
//  Created by Thomas Fankhauser on 20.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "Constants.h"
#import <CoreMotion/CoreMotion.h>

@interface CoreMotionHeadsupLayer : CCLayer{
    CMMotionManager *motionManager;
    
    CGFloat yaw, pitch, roll;
    CGFloat aX, aY, aZ;
    
    CCLabelTTF *labelPitch;
    CCLabelTTF *labelYaw;
    CCLabelTTF *labelRoll;
    CCLabelTTF *labelX;
    CCLabelTTF *labelY;
    CCLabelTTF *labelZ;
    
    CCSprite *barPitch;
    CCSprite *barYaw;
    CCSprite *barRoll;
    CCSprite *barX;
    CCSprite *barY;
    CCSprite *barZ;
}

@property (nonatomic, retain) CMMotionManager *motionManager;

-(void)update:(ccTime)dt;

@end
