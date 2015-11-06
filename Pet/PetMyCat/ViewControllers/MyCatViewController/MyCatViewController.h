//
//  MyCatViewController.h
//  PetMyCat
//
//  Created by Muhammad Hassan on 18/09/2015.
//  Copyright (c) 2015 Hassan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface MyCatViewController : UIViewController <AVAudioPlayerDelegate> {
    
    NSString            *meowFilePath;
    NSString            *catPurrFilePath;
    
    AVAudioPlayer                           *audioPlayer;
    
    IBOutlet UIButton   *btnPlayCat;
}

@property (nonatomic, strong) UIImage       *catImage;

- (IBAction)longPress_action:(UILongPressGestureRecognizer *)sender;
- (IBAction)btnPlayCat_action:(UIButton *)sender;

@end
