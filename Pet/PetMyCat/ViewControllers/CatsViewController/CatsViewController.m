//
//  CatsViewController.m
//  PetMyCat
//
//  Created by Muhammad Hassan on 18/09/2015.
//  Copyright (c) 2015 Hassan. All rights reserved.
//

#import "CatsViewController.h"

@interface CatsViewController ()
@end

@implementation CatsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad]; [self setUpView];

}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];

}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = true;
    
}

- (void)setUpView {
    
    btnCamera.layer.cornerRadius    = 5.0;
    
}

#pragma mark - IBaction methods
- (IBAction)btnCat_action:(UIButton *)sender {
    
    MyCatViewController *myCatVC    = [self.storyboard instantiateViewControllerWithIdentifier:@"MyCatViewController"];
    
    myCatVC.catImage                = sender.imageView.image;
    
    [self.navigationController pushViewController:myCatVC animated:true];
    
}

- (IBAction)btnCamera_action:(id)sender {
    
    __block UIImagePickerController *imgPickerVC;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] == true) {
            
            imgPickerVC             = [[UIImagePickerController alloc] init];
            
            imgPickerVC.delegate    = self;
            imgPickerVC.sourceType  = UIImagePickerControllerSourceTypeCamera;
            
            [self                   presentViewController:imgPickerVC animated:YES completion:nil];
            
        }
        
    });
    
}

#pragma mark - UIImagePickerViewController delegate method
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^() {
        
        dispatch_async(dispatch_get_main_queue(), ^() {
            
            [self dismissViewControllerAnimated:false completion:^{
                
                CropImageViewController *cropImageViewCont  = [self.storyboard instantiateViewControllerWithIdentifier:@"CropImageViewController"];
                cropImageViewCont.delegate                  = self;
                cropImageViewCont.imgSelected               = [info objectForKey:UIImagePickerControllerOriginalImage];
                
                UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:cropImageViewCont];
                
                [self presentViewController:navController animated:YES completion:^{
                    
                }];
                
            }];
            
        });
        
    });
    
}

#pragma mar - CropImageViewController delegate method
- (void)selectedImage:(UIImage *)orignalImage croppedImage:(UIImage *)croppedImage {
    
    MyCatViewController *myCatVC    = [self.storyboard instantiateViewControllerWithIdentifier:@"MyCatViewController"];
    
    myCatVC.catImage                = croppedImage;
    
    [self.navigationController pushViewController:myCatVC animated:true];
    
}

@end
