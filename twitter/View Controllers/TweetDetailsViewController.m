//
//  TweetDetailsViewController.m
//  twitter
//
//  Created by Elizabeth Ke on 6/29/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "TweetDetailsViewController.h"
#import "Tweet.h"
#import "DateTools.h"
#import "UIImageView+AFNetworking.h"

@interface TweetDetailsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *authorUsernameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *authorScreenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdAtLabel;
@property (weak, nonatomic) IBOutlet UILabel *retweetCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoriteCountLabel;
@property (weak, nonatomic) IBOutlet UIButton *retweetButton;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;

@end

@implementation TweetDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.tweet) {
        [self refreshData];
    }
}

- (void)refreshData {
    NSString *URLString = self.tweet.user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    [self.profileImageView setImageWithURL:url];
    self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2;;
    
    self.authorUsernameLabel.text = self.tweet.user.name;
    self.authorScreenNameLabel.text = [@"@" stringByAppendingString:self.tweet.user.screenName];

    self.createdAtLabel.text = [self.tweet.createdAtDate formattedDateWithFormat:@"h:mm a ⋅ M/dd/yy"];

    self.tweetTextLabel.text = self.tweet.text;
    self.retweetCountLabel.text = [NSString stringWithFormat:@"%i", self.tweet.retweetCount];
    self.favoriteCountLabel.text = [NSString stringWithFormat:@"%i", self.tweet.favoriteCount];

    self.tweet.favorited ? [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon-red"] forState:UIControlStateNormal] : [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon"] forState:UIControlStateNormal];
    self.tweet.retweeted ? [self.retweetButton setImage:[UIImage imageNamed:@"retweet-icon-green"] forState:UIControlStateNormal] : [self.retweetButton setImage:[UIImage imageNamed:@"retweet-icon"] forState:UIControlStateNormal];
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
