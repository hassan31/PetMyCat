
#import <UIKit/UIKit.h>
#import "SPUserResizableView.h"

@class CropImageViewController;
@protocol CropImageViewControllerDelegate <NSObject>

@optional

- (void)selectedImage:(UIImage *)orignalImage croppedImage:(UIImage *)croppedImage;

@end


@interface CropImageViewController : UIViewController < SPUserResizableViewDelegate,
                                                        UIGestureRecognizerDelegate> {
                                                            
    IBOutlet UIImageView    *imgViewSelected;
    SPUserResizableView     *userResizableView;
                                                            
    IBOutlet UIButton *btnClose;
    IBOutlet UIButton *btnSaveImg;
    
}

@property (nonatomic, retain) UIImage *imgSelected;
@property (nonatomic, retain) id <CropImageViewControllerDelegate> delegate;

- (IBAction)btnBack_action:(UIButton *)sender;
- (IBAction)btnCrop_action:(UIButton *)sender;

@end
