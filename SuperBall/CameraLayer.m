//
//  CameraLayer.m
//  SuperBall
//
//  Created by Thomas Fankhauser on 15.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "CameraLayer.h"

@implementation CameraLayer

@synthesize background, geoLayer;

- (id)init {
    self = [super init];
    if (self) {
        
        // respond to touch
        self.isTouchEnabled = YES;
        
        // root view controller for popovers
        viewController = [(AppDelegate*)[[UIApplication sharedApplication] delegate] viewController];
        
    }
    return self;
}

- (void)ccTouchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    UITouch* touch = [touches anyObject];
    CGPoint location = [self convertTouchToNodeSpace: touch];
    
    // take photo
    if(location.y > 512) [self capture];
}

#pragma mark - Capture photo
-(void)capture{
    [geoLayer removeMap];
    [background popMessage:@"Loading Camera"];
    
    // clean up
    imageView.image = nil;
    [imageView release];
    [imagePickerController release];
    
    // setup image picker controller
    imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.allowsEditing = NO;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePickerController.delegate = self;
    
    // setup image view
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 240, 190)];
    CCUIViewWrapper *wrapper = [CCUIViewWrapper wrapperForUIView:imageView];
    wrapper.contentSize = CGSizeMake(240, 190);
    wrapper.rotation = 90.0;
    wrapper.position = ccp(425,165);
    [self addChild:wrapper];
    
    // display
    [viewController presentModalViewController:imagePickerController animated:YES];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    [background popMessage:@"Captured"];

    // set image
    imageView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    // continue
    [viewController dismissModalViewControllerAnimated:YES];
}

#pragma mark - Memory

- (void)dealloc {
    [imageView release];
    [imagePickerController release];
    [viewController release];
    [super dealloc];
}

@end
