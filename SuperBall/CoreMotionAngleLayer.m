//
//  CoreMotionAngleLayer.m
//  SuperBall
//
//  Created by Thomas Fankhauser on 21.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "CoreMotionAngleLayer.h"

@implementation CoreMotionAngleLayer

- (id)init {
    self = [super init];
    if (self) {
        
        // create core motion manager
        motionManager = [[CMMotionManager alloc] init];
        motionManager.deviceMotionUpdateInterval = 1.0/60.0;
        [motionManager startDeviceMotionUpdates];
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        // create angleX
        angleYLabel = [CCLabelTTF labelWithString:@"0.00" fontName:@"Marker Felt" fontSize:40];
        [self addChild:angleYLabel z:1 tag:1];
        angleYLabel.position = ccp(size.width/2 ,size.height/2 + 40);
        
        angleYBar = [CCSprite spriteWithFile:@"obstacle.png"];
        [self addChild:angleYBar z:0];
        angleYBar.position =  ccp(size.width/2 , size.height/2 - 70);
        angleYBar.flipY = YES;
        
        // setup view tick
        [self schedule:@selector(update:)];
    }
    return self;
}

-(void)update:(ccTime)dt {
    
    // get current pitch value
    angleY = motionManager.deviceMotion.attitude.pitch * (180/PI);
    
    // update rotation label and bar
    angleYLabel.string = [NSString stringWithFormat:@"%f°", angleY];
    angleYLabel.rotation = angleY;
    angleYBar.rotation = angleY;
    
}

- (void)dealloc {
    [motionManager release];
    [super dealloc];
}

@end
