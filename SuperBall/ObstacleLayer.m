//
//  ObstacleLayer.m
//  SuperBall
//
//  Created by Thomas Fankhauser on 13.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "ObstacleLayer.h"

@implementation ObstacleLayer

@synthesize obstacles;

- (id)init {
    self = [super init];
    if (self) {
        
        // create batch node container
        obstacles = [CCSpriteBatchNode batchNodeWithFile:@"obstacle.png"];
        [self addChild:obstacles];
        
        // add obstacles
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCSprite *top = [CCSprite spriteWithFile:@"obstacle.png"];
        [obstacles addChild:top];
        top.position =  ccp(size.width/2 , size.height - ([top boundingBox].size.height/2));
        
        CCSprite *bottom = [CCSprite spriteWithFile:@"obstacle.png"];
        [obstacles addChild:bottom];
        bottom.position =  ccp(size.width/2 , [bottom boundingBox].size.height/2);
        bottom.flipY = YES;
        
        CCSprite *left = [CCSprite spriteWithFile:@"obstacle.png"];
        [obstacles addChild:left];
        left.position =  ccp(([left boundingBox].size.height/2), size.height/2);
        left.rotation = -90.0;
        
        CCSprite *right = [CCSprite spriteWithFile:@"obstacle.png"];
        [obstacles addChild:right];
        right.position =  ccp(size.width - ([right boundingBox].size.height/2), size.height/2);
        right.rotation = 90.0;
    }
    return self;
}

@end
