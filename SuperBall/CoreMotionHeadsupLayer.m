//
//  CoreMotionHeadsupDisplay.m
//  SuperBall
//
//  Created by Thomas Fankhauser on 20.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "CoreMotionHeadsupLayer.h"

@implementation CoreMotionHeadsupLayer

@synthesize motionManager;

- (id)init {
    self = [super init];
    if (self) {
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        // create Accelerometer Pitch Values
        labelPitch = [CCLabelTTF labelWithString:@"0.00" fontName:@"Marker Felt" fontSize:30];
        [self addChild:labelPitch z:2 tag:3];
        labelPitch.position = ccp(size.width/2 ,size.height/2 - 40 - 150);
        
        barPitch = [CCSprite spriteWithFile:@"bar.png"];
        [self addChild:barPitch z:1 tag:4];
        barPitch.position = ccp(size.width/2 + 200, size.height/2 - 40 - 150);
        barPitch.anchorPoint = CGPointMake(0.0, 0.5);
        
        // create Accelerometer Roll Values
        labelRoll = [CCLabelTTF labelWithString:@"0.00" fontName:@"Marker Felt" fontSize:30];
        [self addChild:labelRoll z:2 tag:5];
        labelRoll.position = ccp(size.width/2 ,size.height/2 - 150);
        
        barRoll = [CCSprite spriteWithFile:@"bar.png"];
        [self addChild:barRoll z:1 tag:6];
        barRoll.position = ccp(size.width/2 + 200, size.height/2 - 150);
        barRoll.anchorPoint = CGPointMake(0.0, 0.5);
        
        // create Accelerometer Yaw Values
        labelYaw = [CCLabelTTF labelWithString:@"0.00" fontName:@"Marker Felt" fontSize:30];
        [self addChild:labelYaw z:2 tag:1];
        labelYaw.position = ccp(size.width/2 ,size.height/2 + 40 - 150);
        
        barYaw = [CCSprite spriteWithFile:@"bar.png"];
        [self addChild:barYaw z:1 tag:2];
        barYaw.position = ccp(size.width/2 + 200, size.height/2 + 40 - 150);
        barYaw.anchorPoint = CGPointMake(0.0, 0.5);
        
        
        
        
        // create Accelerometer X Values
        labelX = [CCLabelTTF labelWithString:@"0.00°" fontName:@"Marker Felt" fontSize:30];
        [self addChild:labelX z:2 tag:3];
        labelX.position = ccp(size.width/2 ,size.height/2 - 40 + 150);
        
        barX = [CCSprite spriteWithFile:@"bar.png"];
        [self addChild:barX z:1 tag:4];
        barX.position = ccp(size.width/2 + 200, size.height/2 - 40 + 150);
        barX.anchorPoint = CGPointMake(0.0, 0.5);
        
        // create Accelerometer Y Values
        labelY = [CCLabelTTF labelWithString:@"0.00°" fontName:@"Marker Felt" fontSize:30];
        [self addChild:labelY z:2 tag:5];
        labelY.position = ccp(size.width/2 ,size.height/2 + 150);
        
        barY = [CCSprite spriteWithFile:@"bar.png"];
        [self addChild:barY z:1 tag:6];
        barY.position = ccp(size.width/2 + 200, size.height/2 + 150);
        barY.anchorPoint = CGPointMake(0.0, 0.5);
        
        // create Accelerometer Z Values
        labelZ = [CCLabelTTF labelWithString:@"0.00" fontName:@"Marker Felt" fontSize:30];
        [self addChild:labelZ z:2 tag:1];
        labelZ.position = ccp(size.width/2 ,size.height/2 + 40 + 150);
        
        barZ = [CCSprite spriteWithFile:@"bar.png"];
        [self addChild:barZ z:1 tag:2];
        barZ.position = ccp(size.width/2 + 200, size.height/2 + 40 + 150);
        barZ.anchorPoint = CGPointMake(0.0, 0.5);
        
        // update
        [self schedule:@selector(update:)];
    }
    return self;
}

-(void)update:(ccTime)dt {
    if(!motionManager) return;
    
    yaw = motionManager.deviceMotion.attitude.yaw * (180 / PI);
    pitch = motionManager.deviceMotion.attitude.pitch * (180 / PI);
    roll = motionManager.deviceMotion.attitude.roll * (180 / PI);
    
    aX = -motionManager.deviceMotion.gravity.y;
    aY = motionManager.deviceMotion.gravity.x;
    aZ = motionManager.deviceMotion.gravity.z;
    
    // Update Pitch
    labelPitch.string = [NSString stringWithFormat:@"Pitch X: %f°", pitch];
    barPitch.scaleX = pitch / (180 / PI);
    
    // Update Roll
    labelRoll.string = [NSString stringWithFormat:@"Roll Y: %f°", roll];
    barRoll.scaleX = roll / (180 / PI);
    
    // Update Yaw
    labelYaw.string = [NSString stringWithFormat:@"Yaw Z: %f°", yaw];
    barYaw.scaleX = yaw / (180 / PI);
    
    
    // Update X
    labelX.string = [NSString stringWithFormat:@"aX: %f", aX];
    barX.scaleX = aX;
    
    // Update Y
    labelY.string = [NSString stringWithFormat:@"aY: %f", aY];
    barY.scaleX = aY;
    
    // Update Z
    labelZ.string = [NSString stringWithFormat:@"aZ: %f", aZ];
    barZ.scaleX = aZ;
    
}

@end
