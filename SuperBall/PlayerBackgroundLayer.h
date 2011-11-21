//
//  PlayerBackgroundLayer.h
//  SuperBall
//
//  Created by Thomas Fankhauser on 15.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "Constants.h"

@interface PlayerBackgroundLayer : CCLayer{
    CCLabelTTF *message;
}

-(void)popMessage:(NSString*)aMessage;

@end
