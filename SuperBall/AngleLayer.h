//
//  AngleLayer.h
//  SuperBall
//
//  Created by Thomas Fankhauser on 19.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"

@interface AngleLayer : CCLayer <UIAccelerometerDelegate> {
    CGFloat angleY;
    CGFloat accelerationY;
    CCLabelTTF *angleYLabel;
    CCLabelTTF *labelY;
    CCSprite *angleYBar;
    CCSprite *labelYBar;
}

-(void)update:(ccTime)dt;

@end
