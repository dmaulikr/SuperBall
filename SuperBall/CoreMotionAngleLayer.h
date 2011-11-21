//
//  CoreMotionAngleLayer.h
//  SuperBall
//
//  Created by Thomas Fankhauser on 21.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "Constants.h"
#import <CoreMotion/CoreMotion.h>

@interface CoreMotionAngleLayer : CCLayer {
    CGFloat angleY;
    CCLabelTTF *angleYLabel;
    CCSprite *angleYBar;
    CMMotionManager *motionManager;
}

-(void)update:(ccTime)dt;

@end
