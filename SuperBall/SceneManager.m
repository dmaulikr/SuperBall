//
//  SceneManager.m
//  SuperBall
//
//  Created by Thomas Fankhauser on 20.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "SceneManager.h"

@implementation SceneManager


+(void)playScene:(CCMenuItemFont *)sender{
    [self playSceneByTag:sender.tag];
}

+(void)playSceneByTag:(int)tag{
    
    // play scenes
    if(tag == kMainMenuScene)            [[CCDirector sharedDirector] replaceScene:[MainMenuScene node]];
    if(tag == kAccelerometerScene)       [[CCDirector sharedDirector] replaceScene:[AccelerometerScene node]];
    if(tag == kAccelerometerAngleScene)  [[CCDirector sharedDirector] replaceScene:[AccelerometerAngleScene node]];
    if(tag == kPlayerScene)              [[CCDirector sharedDirector] replaceScene:[PlayerScene node]];
    if(tag == kGyroscopeScene)           [[CCDirector sharedDirector] replaceScene:[GyroscopeScene node]];
    if(tag == kGyroscopeAngleScene)      [[CCDirector sharedDirector] replaceScene:[GyroscopeAngleScene node]];
    if(tag == kCoreMotionScene)          [[CCDirector sharedDirector] replaceScene:[CoreMotionScene node]];
    if(tag == kCoreMotionAngleScene)     [[CCDirector sharedDirector] replaceScene:[CoreMotionAngleScene node]];
    if(tag == kCoreLocationFieldScene)   [[CCDirector sharedDirector] replaceScene:[CoreLocationFieldScene node]];
    
}

@end
