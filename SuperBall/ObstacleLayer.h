//
//  ObstacleLayer.h
//  SuperBall
//
//  Created by Thomas Fankhauser on 13.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "Constants.h"

@interface ObstacleLayer : CCLayer {
    CCSpriteBatchNode *obstacles;
}

@property (nonatomic, retain) CCSpriteBatchNode *obstacles;

@end
