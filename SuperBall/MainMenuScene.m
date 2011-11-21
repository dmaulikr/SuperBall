//
//  MainMenuScene.m
//  SuperBall
//
//  Created by Thomas Fankhauser on 13.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "MainMenuScene.h"
#import "MainMenuLayer.h"

@implementation MainMenuScene

-(id)init {
    self = [super init];
    if (self != nil) {
        
        // simply add main menu layer
        mainMenuLayer = [MainMenuLayer node];
        [self addChild:mainMenuLayer];
        
    }
    return self;
}

@end
