//
//  TempViewController.m
//  twitter
//
//  Created by Elizabeth Ke on 7/1/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "TempViewController.h"
#import "ProfileViewController.h"
#import "APIManager.h"

@interface TempViewController ()

@end

@implementation TempViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [[APIManager shared] getLoggedInUserWithCompletion:^(User *user, NSError *error) {
        [self performSegueWithIdentifier:@"profileSegue" sender:user];
    }];
    [self.navigationController.navigationBar setHidden:YES];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    ProfileViewController *profileViewController = [segue destinationViewController];
    profileViewController.user = sender;
}


@end
