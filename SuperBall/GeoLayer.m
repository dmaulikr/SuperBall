//
//  GeoLayer.m
//  SuperBall
//
//  Created by Thomas Fankhauser on 15.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "GeoLayer.h"

@implementation GeoLayer

@synthesize background, coordinate;

- (id)init {
    self = [super init];
    if (self) {
        
        // respond to touch
        self.isTouchEnabled = YES;
        isUpdatingLocation = NO;
        
    }
    return self;
}

- (void)ccTouchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    UITouch* touch = [touches anyObject];
    CGPoint location = [self convertTouchToNodeSpace: touch];
    
    // handle buttons
    if(location.y < 256) [self locate];
}

#pragma mark - Locate
-(void)locate{
    if(isUpdatingLocation) return;
    isUpdatingLocation = YES;
    [background popMessage:@"Locating"];
    
    // create location manager
    [locationManager release];
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    
    // start location update
    [locationManager startUpdatingLocation];
  
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    [background popMessage:[NSString stringWithFormat:@"%f %f", newLocation.coordinate.latitude, newLocation.coordinate.longitude]];
    
    // one position is enough
    [locationManager stopUpdatingLocation];
    isUpdatingLocation = NO;
    
    // create map view
    mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, 240, 190)];
    mapView.delegate = self;
    
    // create wrapper
    wrapper = [CCUIViewWrapper wrapperForUIView:mapView];
    wrapper.contentSize = CGSizeMake(240, 190);
    wrapper.position = ccp(-90,165);
    wrapper.rotation = 90.0;
    [self addChild:wrapper z:1];
    
    // create annotation
    coordinate = newLocation.coordinate;
    [mapView addAnnotation:self];
    
    // update map to location
    [mapView setRegion:MKCoordinateRegionMake(newLocation.coordinate, MKCoordinateSpanMake(0.01, 0.01)) animated:YES];
}

#pragma mark - Helper
-(void)removeMap{
    [wrapper removeFromParentAndCleanup:YES];
}


- (void)dealloc {
    [locationManager release];
    [mapView release];
    [super dealloc];
}

@end
