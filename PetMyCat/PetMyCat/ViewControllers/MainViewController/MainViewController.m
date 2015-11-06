//
//  ViewController.m
//  PetMyCat
//
//  Created by Muhammad Hassan on 18/09/2015.
//  Copyright (c) 2015 Hassan. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@end

@implementation MainViewController

#pragma mark - View life cycle
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self performSelector:@selector(pushToCatsViewController) withObject:nil afterDelay:5.0];

}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];

}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = true;
    
}

- (void)pushToCatsViewController {
    
    CatsViewController *catsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CatsViewController"];
    
    [self.navigationController pushViewController:catsVC animated:true];
    
}

@end
