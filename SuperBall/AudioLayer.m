//
//  AudioLayer.m
//  SuperBall
//
//  Created by Thomas Fankhauser on 15.11.11.
//  Copyright (c) 2011 southdesign.de. All rights reserved.
//

#import "AudioLayer.h"
#import <CoreAudio/CoreAudioTypes.h>

@implementation AudioLayer

@synthesize background;

- (id)init {
    self = [super init];
    if (self) {
        
        // respond to touch
        self.isTouchEnabled = YES;
        isRecording = NO;
        isPlaying = NO;
        
    }
    return self;
}

- (void)ccTouchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    UITouch* touch = [touches anyObject];
    CGPoint location = [self convertTouchToNodeSpace: touch];
    
    // handle buttons
    if(location.y > 256 && location.y < 512){
        if(location.x > 850) [self record];
        else [self play];
    };
}

#pragma mark - Record
-(void)record{
    if(isPlaying) return;
    isRecording = YES;
    
    [background popMessage:@"Recording"];
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryRecord error:nil];
    [audioSession setActive:YES error:nil];
    
    NSMutableDictionary *settings = [[NSMutableDictionary alloc] init];
    [settings setValue:[NSNumber numberWithInt:kAudioFormatAppleIMA4] forKey:AVFormatIDKey];
    [settings setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    [settings setValue:[NSNumber numberWithInt:2] forKey:AVNumberOfChannelsKey];
    
    tmpRecording = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:@"name.caf"]];
    
    audioRecorder = [[AVAudioRecorder alloc] initWithURL:tmpRecording settings:settings error:nil];
    [audioRecorder setDelegate:self];
    [audioRecorder prepareToRecord];
    [audioRecorder recordForDuration:2.0];
    
    
}

- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag{
    isRecording = NO;
    [background popMessage:@"Done"];
}

#pragma mark - Play
-(void)play{
    if(isRecording) return;
    isPlaying = YES;
    
    [background popMessage:@"Play"];
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
    [audioSession setActive:YES error:nil];
    
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:tmpRecording error:nil];
    [player setDelegate:self];
    [player prepareToPlay];
    [player play];
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    isPlaying = NO;
    [player release];
}



#pragma mark - Memory

- (void)dealloc {
    [audioRecorder release];
    [tmpRecording release];
    [super dealloc];
}

@end
