//
//  CatsViewController.h
//  PetMyCat
//
//  Created by Muhammad Hassan on 18/09/2015.
//  Copyright (c) 2015 Hassan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

#import "MyCatViewController.h"
#import "CropImageViewController.h"

@interface CatsViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, CropImageViewControllerDelegate> {
    
    IBOutlet UIButton   *btnCamera;
    
}

- (IBAction)btnCat_action:(UIButton *)sender;
- (IBAction)btnCamera_action:(id)sender;

@end
