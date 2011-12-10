//
//  GyroHeadsupLayer.m
//  SuperBall
//
//  Created by Thomas Fankhauser on 10.12.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "GyroHeadsupLayer.h"

@implementation GyroHeadsupLayer

@synthesize motionManager;

- (id)init {
    self = [super init];
    if (self) {
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        // create Gyro X Values
        CCLabelTTF *labelX = [CCLabelTTF labelWithString:@"0.00" fontName:@"Marker Felt" fontSize:30];
        [self addChild:labelX z:1 tag:1];
        labelX.position = ccp(size.width/2 ,size.height/2 + 40);
        
        CCSprite *barX = [CCSprite spriteWithFile:@"bar.png"];
        [self addChild:barX z:2 tag:2];
        barX.position = ccp(size.width/2 + 200, size.height/2 + 40);
        barX.anchorPoint = CGPointMake(0.0, 0.5);
        
        // create Gyro Y Values
        CCLabelTTF *labelY = [CCLabelTTF labelWithString:@"0.00" fontName:@"Marker Felt" fontSize:30];
        [self addChild:labelY z:1 tag:3];
        labelY.position = ccp(size.width/2 ,size.height/2);
        
        CCSprite *barY = [CCSprite spriteWithFile:@"bar.png"];
        [self addChild:barY z:2 tag:4];
        barY.position = ccp(size.width/2 + 200, size.height/2);
        barY.anchorPoint = CGPointMake(0.0, 0.5);
        
        // create Gyro Z Values
        CCLabelTTF *labelZ = [CCLabelTTF labelWithString:@"0.00" fontName:@"Marker Felt" fontSize:30];
        [self addChild:labelZ z:1 tag:5];
        labelZ.position = ccp(size.width/2 ,size.height/2 - 40);
        
        CCSprite *barZ = [CCSprite spriteWithFile:@"bar.png"];
        [self addChild:barZ z:2 tag:6];
        barZ.position = ccp(size.width/2 + 200, size.height/2 - 40);
        barZ.anchorPoint = CGPointMake(0.0, 0.5);
        
        [self schedule:@selector(update:)];
    }
    return self;
}

-(void)update:(ccTime)dt {
    if(!self.motionManager) return;
    
    // Update X
    CCLabelTTF *labelX = (CCLabelTTF *)[self getChildByTag:1];
    CCSprite *barX = (CCSprite *)[self getChildByTag:2];
    labelX.string = [NSString stringWithFormat:@"X: %f", self.motionManager.gyroData.rotationRate.x];
    barX.scaleX = self.motionManager.gyroData.rotationRate.x;
    
    // Update Y
    CCLabelTTF *labelY = (CCLabelTTF *)[self getChildByTag:3];
    CCSprite *barY = (CCSprite *)[self getChildByTag:4];
    labelY.string = [NSString stringWithFormat:@"Y: %f", self.motionManager.gyroData.rotationRate.y];
    barY.scaleX = self.motionManager.gyroData.rotationRate.y;
    
    // Update Z
    CCLabelTTF *labelZ = (CCLabelTTF *)[self getChildByTag:5];
    CCSprite *barZ = (CCSprite *)[self getChildByTag:6];
    labelZ.string = [NSString stringWithFormat:@"Z: %f", self.motionManager.gyroData.rotationRate.z];
    barZ.scaleX = self.motionManager.gyroData.rotationRate.z;
}

@end
