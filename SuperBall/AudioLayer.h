//
//  AudioLayer.h
//  SuperBall
//
//  Created by Thomas Fankhauser on 15.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "Constants.h"
#import "PlayerBackgroundLayer.h"
#import <AVFoundation/AVFoundation.h>

@interface AudioLayer : CCLayer <AVAudioRecorderDelegate, AVAudioPlayerDelegate>{
    BOOL isRecording;
    BOOL isPlaying;
    
    AVAudioRecorder *audioRecorder;
    NSURL *tmpRecording;
    
    PlayerBackgroundLayer *background;
}

@property (nonatomic, retain) PlayerBackgroundLayer *background;

-(void)record;
-(void)play;

@end
