//
//  PlayerScene.m
//  SuperBall
//
//  Created by Thomas Fankhauser on 15.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "PlayerScene.h"

@implementation PlayerScene

- (id)init {
    self = [super init];
    if (self) {
        
        // create and add background layer
        PlayerBackgroundLayer *playerBackgroundLayer = [PlayerBackgroundLayer node];
        [self addChild:playerBackgroundLayer z:0 tag:0];

        // create and add audio layer
        AudioLayer *audioLayer = [AudioLayer node];
        audioLayer.background = playerBackgroundLayer;
        [self addChild:audioLayer z:2 tag:2];
        
        // create and add geo layer
        GeoLayer *geoLayer = [GeoLayer node];
        geoLayer.background = playerBackgroundLayer;
        [self addChild:geoLayer z:3 tag:3];
        
        // create and add camera layer
        CameraLayer *cameraLayer = [CameraLayer node];
        cameraLayer.background = playerBackgroundLayer;
        cameraLayer.geoLayer = geoLayer;
        [self addChild:cameraLayer z:1 tag:1];
        
    }
    return self;
}

@end
