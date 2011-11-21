//
//  AppDelegate.h
//  SensorAccelerometer
//
//  Created by Thomas Fankhauser on 11.11.11.
//  Copyright southdesign.de 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) RootViewController *viewController;

@end
