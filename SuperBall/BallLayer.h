//
//  BallLayer.h
//  SensorAccelerometer
//
//  Created by Thomas Fankhauser on 11.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "Constants.h"

@interface BallLayer : CCLayer{
    float nextX;
    float nextY;
    float accelerometerAX;
    float accelerometerAY;
    float obstacleAX;
    float obstacleAY;
    CCAction *moveAction;
    CCSpriteBatchNode *obstacles;
}

@property (nonatomic, retain) CCAction *moveAction;
@property (nonatomic, retain) CCSpriteBatchNode *obstacles;

-(void)update:(ccTime)dt;

@end
