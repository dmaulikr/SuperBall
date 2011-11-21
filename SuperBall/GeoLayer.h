//
//  GeoLayer.h
//  SuperBall
//
//  Created by Thomas Fankhauser on 15.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "Constants.h"
#import "PlayerBackgroundLayer.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface GeoLayer : CCLayer <MKMapViewDelegate, CLLocationManagerDelegate, MKAnnotation>{
    CLLocationManager *locationManager;
    MKMapView *mapView;
    CCUIViewWrapper *wrapper;
    PlayerBackgroundLayer *background;
    CLLocationCoordinate2D coordinate;
    BOOL isUpdatingLocation;
}

@property (nonatomic, retain) PlayerBackgroundLayer *background;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

-(void)locate;
-(void)removeMap;

@end
