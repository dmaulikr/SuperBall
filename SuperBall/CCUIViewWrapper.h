//
//  CCUIViewWrapper.h
//  SuperBall
//
//  Created by Thomas Fankhauser on 15.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "cocos2d.h"

@interface CCUIViewWrapper : CCSprite {
	UIView *uiItem;
	float rotation;
}

@property (nonatomic, retain) UIView *uiItem;

+ (id) wrapperForUIView:(UIView*)ui;
- (id) initForUIView:(UIView*)ui;

- (void) updateUIViewTransform;

@end
