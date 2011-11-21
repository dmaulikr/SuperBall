//
//  CoreMotionBallLayer.m
//  SuperBall
//
//  Created by Thomas Fankhauser on 20.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "CoreMotionBallLayer.h"

@implementation CoreMotionBallLayer

@synthesize moveAction, obstacles, motionManager;

-(id) init {
	if((self=[super init])) {
        
        // init animation
        accelerationX = 0.0;
        accelerationY = 0.0;
        [self schedule:@selector(update:)];
        
        // enable flipping of control
        self.isTouchEnabled = YES;
        isControlledByAttitude = YES;
        
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
        
        // control type
        controlLabel = [CCLabelTTF labelWithString:@"Attitude: Pitch, Roll, Yaw" fontName:@"Marker Felt" fontSize:30];
        controlLabel.anchorPoint = CGPointMake(0.0, 0.0);
        [self addChild:controlLabel z:2];
        controlLabel.position = ccp(80 ,80);
	}
	return self;
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    isControlledByAttitude = !isControlledByAttitude;
    if(isControlledByAttitude) controlLabel.string = @"Attitude: Pitch, Roll, Yaw";
    else controlLabel.string = @"Gravity: aX, aY, aZ";
}

-(void)update:(ccTime)dt {
    if(!motionManager) return;
    
    CCSprite *ball = (CCSprite *)[self getChildByTag:2];
    
    
    if (isControlledByAttitude) {
        // x = pitch
        // y = roll
        // z = yaw
        // calculate acceleration from rotation rate
        accelerationX = motionManager.deviceMotion.attitude.pitch * kCoreMotionBallSpeed;
        accelerationY = motionManager.deviceMotion.attitude.roll * kCoreMotionBallSpeed;
    } else {
        accelerationX = motionManager.deviceMotion.gravity.y * -kCoreMotionBallSpeed;
        accelerationY = motionManager.deviceMotion.gravity.x * kCoreMotionBallSpeed;
    }
    
    
    nextX = ball.position.x + accelerationX;
    nextY = ball.position.y + accelerationY;
    
    // check collision with obstacles
    CGRect futureBoundingBox = [ball boundingBox];
    futureBoundingBox.origin = CGPointMake(nextX - ([ball boundingBox].size.width/2), nextY - ([ball boundingBox].size.height/2));
    
    for (CCSprite *obstacle in obstacles.children) {
        if (CGRectIntersectsRect([obstacle boundingBox], futureBoundingBox)){
            CGRect collisionIntersection = CGRectIntersection([obstacle boundingBox], futureBoundingBox);
            
            // verticallay
            if (collisionIntersection.size.width == [ball boundingBox].size.width) {
                
                // stop further acceleration
                accelerationY = 0.0;
                
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
                accelerationX = 0.0;
                
                // correct position
                BOOL isBallRightFromObstacle = (ball.position.x - obstacle.position.x) > 0;
                int direction = isBallRightFromObstacle ? -1 : 1;
                float deltaX = ABS(ball.position.x - obstacle.position.x);
                deltaX -= (ball.contentSize.width/2) + (obstacle.contentSize.height/2);
                ball.position = CGPointMake(ball.position.x + (deltaX * direction), ball.position.y);
            }
        }
    }
    
    nextX = ball.position.x + accelerationX;
    nextY = ball.position.y + accelerationY;
    
    ball.position = CGPointMake(nextX, nextY);
    
    CCSprite *ballArrow = (CCSprite *)[ball getChildByTag:3];
    ballArrow.rotation = atan2f(accelerationX, accelerationY) * (180/PI);
    
    CCSprite *ballArrowShadow = (CCSprite *)[ball getChildByTag:4];
    ballArrowShadow.rotation = ballArrow.rotation;
}

- (void)dealloc {
    [motionManager release];
    [super dealloc];
}

@end
