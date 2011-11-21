//
//  CoreMotionNeedleLayer.m
//  SuperBall
//
//  Created by Thomas Fankhauser on 21.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "CoreLocationNeedleLayer.h"

@implementation CoreLocationNeedleLayer


- (id)init {
    self = [super init];
    if (self) {
        
        // setup location manager
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
        [locationManager startUpdatingHeading];
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        // setup earth needle
        earthNeedle = [CCSprite spriteWithFile:@"needle.png"];
        [self addChild:earthNeedle z:3];
        earthNeedle.position =  ccp(size.width/2 , size.height/2);
        
        // setup field needle
        fieldNeedle = [CCSprite spriteWithFile:@"needle2.png"];
        [self addChild:fieldNeedle z:2];
        fieldNeedle.position =  ccp(size.width/2 , size.height/2);
        
        // setup view tick
        [self schedule:@selector(update:)];
    }
    return self;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading{
    if(isReferenceFieldSet) return;
    
    // set reference point
    referenceX = locationManager.heading.x;
    referenceY = locationManager.heading.y;
    referenceZ = locationManager.heading.z;
    isReferenceFieldSet = YES;
    
}

-(void)update:(ccTime)dt {
    
    // set earth needle
    earthNeedle.rotation = -1.0 * locationManager.heading.magneticHeading + 270.0;
    
    // set field needle
    CGFloat fieldAngle = -1.0 * atan2f(locationManager.heading.x - referenceX, locationManager.heading.y - referenceY) * (180/PI) + 270.0;
    fieldNeedle.rotation = fieldAngle;
}

- (void)dealloc {
    [locationManager release];
    [super dealloc];
}

@end
