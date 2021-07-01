//
//  ProfileViewController.m
//  twitter
//
//  Created by Elizabeth Ke on 7/1/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "ProfileViewController.h"
#import "UIImageView+AFNetworking.h"

@interface ProfileViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UIImageView *backdropImageView;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *profileDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *followingCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *followersCountLabel;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view bringSubviewToFront:self.profileImageView];
    [self.profileImageView setImageWithURL:[NSURL URLWithString:self.user.profilePictureString]];
    [self.backdropImageView setImageWithURL:[NSURL URLWithString:self.user.backdropPictureString]];
    self.profileImageView.layer.borderColor = UIColor.whiteColor.CGColor;
    
    self.usernameLabel.text = self.user.name;
    self.screenNameLabel.text = [@"@" stringByAppendingString:self.user.screenName];
    self.profileDescriptionLabel.text = self.user.profileDescription;
    
    self.followersCountLabel.text = [NSString stringWithFormat:@"%i", self.user.followersCount];
    self.followingCountLabel.text = [NSString stringWithFormat:@"%i", self.user.followingCount];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
