//
//  PlayerBackgroundLayer.m
//  SuperBall
//
//  Created by Thomas Fankhauser on 15.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "PlayerBackgroundLayer.h"

@implementation PlayerBackgroundLayer

- (id)init {
    self = [super init];
    if (self) {
        
        // add obstacles
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        // setup sprite
        CCSprite *background = [CCSprite spriteWithFile:@"player.png"];
        [self addChild:background];
        background.position =  ccp(size.width/2 , size.height/2);
        
        
        // setup message
        message = [CCLabelTTF labelWithString:@"" fontName:@"Marker Felt" fontSize:30];
        message.position = ccp(size.width/2 ,size.height/2 + 40);
        [self addChild:message];
        
    }
    return self;
}

#pragma mark - Some message effects
-(void)popMessage:(NSString*)aMessage{
    [message stopAllActions];
    message.scale = 1.0;
    message.opacity = 1;
    message.string = aMessage;
    [message runAction: [CCScaleBy actionWithDuration:0.5 scale:5.0]];
    [message runAction: [CCFadeOut actionWithDuration:0.5]]; 
}

@end
