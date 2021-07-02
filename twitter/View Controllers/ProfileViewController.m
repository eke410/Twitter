//
//  ProfileViewController.m
//  twitter
//
//  Created by Elizabeth Ke on 7/1/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "ProfileViewController.h"
#import "APIManager.h"
#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"

@interface ProfileViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UIImageView *backdropImageView;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *profileDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *followingCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *followersCountLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *tweets;
@property (strong, nonatomic) UIColor *navBarColor;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    if (self.user) {
        // user passed in
        [self refreshData];
        
    } else {
        // user not passed in, should show own info
        NSLog(@"coming from tab");
        [[APIManager shared] getLoggedInUserWithCompletion:^(User *user, NSError *error) {
            self.user = user;
            [self refreshData];
            [self.view setAlpha:1];
        }];
    }
}

- (void)refreshData {
    [self.view bringSubviewToFront:self.profileImageView];
    [self.profileImageView setImageWithURL:[NSURL URLWithString:self.user.profilePictureString]];
    [self.backdropImageView setImageWithURL:[NSURL URLWithString:self.user.backdropPictureString]];
    self.profileImageView.layer.borderColor = UIColor.whiteColor.CGColor;
    
    self.usernameLabel.text = self.user.name;
    self.screenNameLabel.text = [@"@" stringByAppendingString:self.user.screenName];
    self.profileDescriptionLabel.text = self.user.profileDescription;
    
    self.followersCountLabel.text = [NSString stringWithFormat:@"%i", self.user.followersCount];
    self.followingCountLabel.text = [NSString stringWithFormat:@"%i", self.user.followingCount];
    
    [[APIManager shared] getUserTimelineWithUserId:self.user.userID completion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            NSLog(@"Successfully loaded %@'s timeline", self.user.name);
            self.tweets = tweets;
            [self.tableView reloadData];
        } else {
            NSLog(@"Error getting %@'s timeline: %@", self.user.name, error.localizedDescription);
        }
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.tweets) {
        return self.tweets.count;
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.tweets) {
        TweetCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"TweetCell"];
        Tweet *tweet = self.tweets[indexPath.row];
        cell.tweet = tweet;
        [cell refreshData];
        return cell;
    } else {
        return [UITableViewCell new];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    self.navBarColor = self.navigationController.navigationBar.barTintColor;
    [self.navigationController.navigationBar setBarTintColor: [UIColor colorNamed:@"white"]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController.navigationBar setBarTintColor: self.navBarColor];
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
