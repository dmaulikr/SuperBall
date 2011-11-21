//
//  MainMenuLayer.h
//  SuperBall
//
//  Created by Thomas Fankhauser on 13.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "Constants.h"
#import "SceneManager.h"

@interface MainMenuLayer : CCLayer {
    CCMenu *mainMenu;
}

-(void)playScene:(CCMenuItemFont *)sender;

@end
