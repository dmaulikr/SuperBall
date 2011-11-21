//
//  SceneManager.h
//  SuperBall
//
//  Created by Thomas Fankhauser on 20.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Constants.h"

#import "MainMenuScene.h"
#import "MainMenuLayer.h"
#import "AccelerometerAngleScene.h"
#import "AccelerometerScene.h"
#import "PlayerScene.h"
#import "GyroscopeScene.h"
#import "GyroscopeAngleScene.h"
#import "CoreMotionScene.h"
#import "CoreMotionAngleScene.h"
#import "CoreLocationFieldScene.h"

@interface SceneManager : NSObject

+(void)playScene:(CCMenuItemFont *)sender;
+(void)playSceneByTag:(int)tag;

@end
