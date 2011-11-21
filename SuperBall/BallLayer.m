//
//  BallLayer.m
//  SensorAccelerometer
//
//  Created by Thomas Fankhauser on 11.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "BallLayer.h"

@implementation BallLayer

@synthesize moveAction, obstacles;

-(id) init {
	if((self=[super init])) {
        
        // init animation
        accelerometerAX = 0.0;
        accelerometerAY = 0.0;
        obstacleAX = 0.0;
        obstacleAY = 0.0;
        [self schedule:@selector(update:)];
        
        CGSize size = [[CCDirector sharedDirector] winSize];
		
		// create ball
        CCSprite *ball = [CCSprite spriteWithFile:@"ball.png"];
		ball.position =  ccp(size.width/2 ,size.height/2);
        [self addChild: ball z:2 tag:2];
        
        CCSprite *ballArrow = [CCSprite spriteWithFile:@"ball_arrow.png"];
        ballArrow.position =  ccp(50,100);
        [ball addChild: ballArrow z:4 tag:3];
        
        CCSprite *ballArrowShadow = [CCSprite spriteWithFile:@"ball_arrow_shadow.png"];
        ballArrowShadow.position =  ccp(50,80);
        [ball addChild: ballArrowShadow z:3 tag:4];
	}
	return self;
}


- (void) accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    float accelerationDeltaY = (acceleration.x * kBallSpeed) - accelerometerAX;
    float accelerationDeltaX = (acceleration.y * kBallSpeed * -1) - accelerometerAY;
    
    accelerometerAX = accelerationDeltaX * kAccelerationFriction;
    accelerometerAY = accelerationDeltaY * kAccelerationFriction;
    
    //accelerometerAX = (acceleration.y * kBallSpeed) * -1;
    //accelerometerAY = (acceleration.x * kBallSpeed);
}

-(void)update:(ccTime)dt {
    CCSprite *ball = (CCSprite *)[self getChildByTag:2];
    
    nextX = ball.position.x + accelerometerAX;
    nextY = ball.position.y + accelerometerAY;
    
    // check collision with obstacles
    CGRect futureBoundingBox = [ball boundingBox];
    futureBoundingBox.origin = CGPointMake(nextX - ([ball boundingBox].size.width/2), nextY - ([ball boundingBox].size.height/2));
    
    for (CCSprite *obstacle in obstacles.children) {
        if (CGRectIntersectsRect([obstacle boundingBox], futureBoundingBox)){
            CGRect collisionIntersection = CGRectIntersection([obstacle boundingBox], futureBoundingBox);
            
            // verticallay
            if (collisionIntersection.size.width == [ball boundingBox].size.width) {
                
                // stop further acceleration
                accelerometerAY = 0.0;
                
                // correct position
                BOOL isBallAboveObstacle = (ball.position.y - obstacle.position.y) > 0;
                int direction = isBallAboveObstacle ? -1 : 1;
                float deltaY = ABS(ball.position.y - obstacle.position.y);
                deltaY -= (ball.contentSize.height/2) + (obstacle.contentSize.height/2);
                ball.position = CGPointMake(ball.position.x, ball.position.y + (deltaY * direction));
            }
            
            // horizontally
            if (collisionIntersection.size.height == [ball boundingBox].size.height) {
                
                // stop further acceleration
                accelerometerAX = 0.0;
                
                // correct position
                BOOL isBallRightFromObstacle = (ball.position.x - obstacle.position.x) > 0;
                int direction = isBallRightFromObstacle ? -1 : 1;
                float deltaX = ABS(ball.position.x - obstacle.position.x);
                deltaX -= (ball.contentSize.width/2) + (obstacle.contentSize.height/2);
                ball.position = CGPointMake(ball.position.x + (deltaX * direction), ball.position.y);
            }
        }
    }
    
    nextX = ball.position.x + accelerometerAX;
    nextY = ball.position.y + accelerometerAY;
    
    ball.position = CGPointMake(nextX, nextY);
    
    CCSprite *ballArrow = (CCSprite *)[ball getChildByTag:3];
    ballArrow.rotation = atan2f(accelerometerAX, accelerometerAY) * (180/PI);
    
    CCSprite *ballArrowShadow = (CCSprite *)[ball getChildByTag:4];
    ballArrowShadow.rotation = ballArrow.rotation;
}

- (void) dealloc {
	[super dealloc];
}

@end
