//
//  CameraLayer.h
//  SuperBall
//
//  Created by Thomas Fankhauser on 15.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "Constants.h"
#import "AppDelegate.h"
#import "PlayerBackgroundLayer.h"
#import "GeoLayer.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface CameraLayer : CCLayer <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    UIImageView *imageView;
    UIImagePickerController *imagePickerController;
    RootViewController *viewController;
    PlayerBackgroundLayer *background;
    GeoLayer *geoLayer;
}

@property (nonatomic, retain) PlayerBackgroundLayer *background;
@property (nonatomic, retain) GeoLayer *geoLayer;

-(void)capture;

@end
