//
//  AngleLayer.m
//  SuperBall
//
//  Created by Thomas Fankhauser on 19.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "AngleLayer.h"

@implementation AngleLayer

- (id)init {
    self = [super init];
    if (self) {
        
        // enable accelerometer
        self.isAccelerometerEnabled = YES;
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        // create angleX
        angleYLabel = [CCLabelTTF labelWithString:@"0.00" fontName:@"Marker Felt" fontSize:40];
        [self addChild:angleYLabel z:1 tag:1];
        angleYLabel.position = ccp(size.width/2 ,size.height/2 + 40);
        
        angleYBar = [CCSprite spriteWithFile:@"obstacle.png"];
        [self addChild:angleYBar z:0];
        angleYBar.position =  ccp(size.width/2 , size.height/2 - 70);
        angleYBar.flipY = YES;
        
        // create Accelerometer Y Values
        labelY = [CCLabelTTF labelWithString:@"0.00" fontName:@"Marker Felt" fontSize:30];
        [self addChild:labelY z:1 tag:3];
        labelY.position = ccp(size.width/2 ,size.height/2 + 300);
        
        labelYBar = [CCSprite spriteWithFile:@"bar.png"];
        [self addChild:labelYBar z:2 tag:4];
        labelYBar.position = ccp(size.width/2 + 300, size.height/2 + 300);
        labelYBar.anchorPoint = CGPointMake(0.0, 0.5);
        
        // setup view tick
        [self schedule:@selector(update:)];
    }
    return self;
}

- (void) accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    
    // calculate angle
    accelerationY = -acceleration.y;
    angleY = accelerationY * 90;
    
}

-(void)update:(ccTime)dt {
    
    // update rotation label and bar
    angleYLabel.string = [NSString stringWithFormat:@"%f°", angleY];
    angleYLabel.rotation = angleY;
    angleYBar.rotation = angleY;
    
    // update acceleration label and bar
    labelY.string = [NSString stringWithFormat:@"Acceleration Y: %fg", accelerationY];
    labelYBar.scaleX = accelerationY;
    
}

@end
