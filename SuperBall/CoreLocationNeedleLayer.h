//
//  CoreMotionNeedleLayer.h
//  SuperBall
//
//  Created by Thomas Fankhauser on 21.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "Constants.h"
#import <CoreLocation/CoreLocation.h>

@interface CoreLocationNeedleLayer : CCLayer <CLLocationManagerDelegate>{
    CCSprite *earthNeedle;
    CCSprite *fieldNeedle;
    CLLocationManager *locationManager;
    
    CGFloat referenceX, referenceY, referenceZ;
    BOOL isReferenceFieldSet;
}

-(void)update:(ccTime)dt;

@end
