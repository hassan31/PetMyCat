//
//  MyCatViewController.m
//  PetMyCat
//
//  Created by Muhammad Hassan on 18/09/2015.
//  Copyright (c) 2015 Hassan. All rights reserved.
//

#import "MyCatViewController.h"

@interface MyCatViewController ()
@end

@implementation MyCatViewController

#pragma mark - View life cycle
- (void)viewDidLoad {
    
    [super viewDidLoad]; [self setUpView];

}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];

}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = false;
    
}

- (void)setUpView {
    
    self.navigationItem.title       = @"My Pet";
    
    [btnPlayCat                     setBackgroundImage:self.catImage forState:UIControlStateNormal];
    
    meowFilePath                    = [[NSBundle mainBundle] pathForResource:@"meow" ofType:@"mp3"];
    catPurrFilePath                 = [[NSBundle mainBundle] pathForResource:@"Cat-Purr" ofType:@"wav"];
    
}

- (IBAction)longPress_action:(UILongPressGestureRecognizer *)sender {
    
    [self playCatSound:catPurrFilePath];
    
}

- (IBAction)btnPlayCat_action:(UIButton *)sender {
    
    [self playCatSound:meowFilePath];
    
}

#pragma mark - Other methods
- (void)playCatSound:(NSString *)filePath {
    
    [audioPlayer stop];
    
    NSError *error;
    
    NSURL *url          = [NSURL fileURLWithPath:filePath];
    
    audioPlayer         = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    audioPlayer.delegate = self;
    
    audioPlayer.numberOfLoops = 0;
    
    audioPlayer.volume = 25;
    
    [audioPlayer prepareToPlay];
    
    if (error == nil) {
        
        [audioPlayer play];
        
    } else {
        
        [[[UIAlertView alloc] initWithTitle:@"Error!" message:@"Can't play sound!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        
    }
    
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    
    
}

@end
