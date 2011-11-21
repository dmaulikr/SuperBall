//
//  GyroAngleLayer.h
//  SuperBall
//
//  Created by Thomas Fankhauser on 20.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"
#import <CoreMotion/CoreMotion.h>

@interface GyroAngleLayer : CCLayer {
    CGFloat angleY;
    CCLabelTTF *angleYLabel;
    CCSprite *angleYBar;
    CMMotionManager *motionManager;
}

-(void)update:(ccTime)dt;

@end
