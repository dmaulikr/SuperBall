//
//  MainMenuLayer.m
//  SuperBall
//
//  Created by Thomas Fankhauser on 13.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "MainMenuLayer.h"

@implementation MainMenuLayer

- (id)init {
    self = [super init];
    if (self) {
        
        self.isTouchEnabled = true;
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        // setup player
        CCLabelTTF *playerLabel = [CCLabelTTF labelWithString:@"Configure Player" 
                                                           fontName:@"Marker Felt" 
                                                           fontSize:50.0];
        CCMenuItemLabel *playPlayer = [CCMenuItemLabel itemWithLabel:playerLabel 
                                                                     target:self 
                                                                   selector:@selector(playScene:)];
        [playPlayer setTag:kPlayerScene];
        
        // setup accelerometer
        CCLabelTTF *accelerometerLabel = [CCLabelTTF labelWithString:@"Accelerometer: Ball" 
                                                            fontName:@"Marker Felt" 
                                                            fontSize:50.0];
        CCMenuItemLabel *playAccelerometer = [CCMenuItemLabel itemWithLabel:accelerometerLabel 
                                                                     target:self 
                                                                   selector:@selector(playScene:)];
        [playAccelerometer setTag:kAccelerometerScene];
        
        // setup accelerometer
        CCLabelTTF *accelerometerAngleLabel = [CCLabelTTF labelWithString:@"Accelerometer: Angle" 
                                                            fontName:@"Marker Felt" 
                                                            fontSize:50.0];
        CCMenuItemLabel *playAccelerometerAngle = [CCMenuItemLabel itemWithLabel:accelerometerAngleLabel 
                                                                     target:self 
                                                                   selector:@selector(playScene:)];
        [playAccelerometerAngle setTag:kAccelerometerAngleScene];
        
        // setup gyro
        CCLabelTTF *gyroscopeLabel = [CCLabelTTF labelWithString:@"Gyroscope: Ball" 
                                                                 fontName:@"Marker Felt" 
                                                                 fontSize:50.0];
        CCMenuItemLabel *playGyroscope = [CCMenuItemLabel itemWithLabel:gyroscopeLabel 
                                                                          target:self 
                                                                        selector:@selector(playScene:)];
        [playGyroscope setTag:kGyroscopeScene];
        
        // setup gyro
        CCLabelTTF *gyroscopeAngleLabel = [CCLabelTTF labelWithString:@"Gyroscope: Angle" 
                                                             fontName:@"Marker Felt" 
                                                             fontSize:50.0];
        CCMenuItemLabel *playGyroscopeAngle = [CCMenuItemLabel itemWithLabel:gyroscopeAngleLabel 
                                                                      target:self 
                                                                    selector:@selector(playScene:)];
        [playGyroscopeAngle setTag:kGyroscopeAngleScene];
        
        // setup core motion
        CCLabelTTF *coreMotionLabel = [CCLabelTTF labelWithString:@"CoreMotion: Ball" 
                                                        fontName:@"Marker Felt" 
                                                        fontSize:50.0];
        CCMenuItemLabel *playCoreMotion = [CCMenuItemLabel itemWithLabel:coreMotionLabel 
                                                                 target:self 
                                                               selector:@selector(playScene:)];
        [playCoreMotion setTag:kCoreMotionScene];
        
        // setup core motion
        CCLabelTTF *coreMotionAngleLabel = [CCLabelTTF labelWithString:@"CoreMotion: Angle" 
                                                             fontName:@"Marker Felt" 
                                                             fontSize:50.0];
        CCMenuItemLabel *playCoreMotionAngle = [CCMenuItemLabel itemWithLabel:coreMotionAngleLabel 
                                                                      target:self 
                                                                    selector:@selector(playScene:)];
        [playCoreMotionAngle setTag:kCoreMotionAngleScene];
        
        
        // setup core motion
        CCLabelTTF *coreLocationFieldLabel = [CCLabelTTF labelWithString:@"CoreLocation: Magnetic Field" 
                                                              fontName:@"Marker Felt" 
                                                              fontSize:50.0];
        CCMenuItemLabel *playCoreLocationField = [CCMenuItemLabel itemWithLabel:coreLocationFieldLabel 
                                                                       target:self 
                                                                     selector:@selector(playScene:)];
        [playCoreLocationField setTag:kCoreLocationFieldScene];

        
        // setup menu
        mainMenu = [CCMenu menuWithItems:
                    playPlayer, 
                    playAccelerometer, 
                    playAccelerometerAngle, 
                    playGyroscope, 
                    playGyroscopeAngle, 
                    playCoreMotion, 
                    playCoreMotionAngle,
                    playCoreLocationField,
                    nil];
        [mainMenu alignItemsVerticallyWithPadding:size.height * 0.02];
        [mainMenu setPosition:ccp(size.width / 2, size.height / 2)];
        
        // add
        [self addChild:mainMenu];
        
    }
    return self;
}

-(void)playScene:(CCMenuItemFont *)sender{
    [SceneManager playScene:sender];
}

@end
