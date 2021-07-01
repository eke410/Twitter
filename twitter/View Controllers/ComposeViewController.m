//
//  ComposeViewController.m
//  twitter
//
//  Created by Elizabeth Ke on 6/28/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"

@interface ComposeViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textViewLabel;
@property (weak, nonatomic) IBOutlet UIButton *tweetButton;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tweetButton.layer.cornerRadius = 15;
    self.textViewLabel.textContainerInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
}

- (IBAction)discardTweet:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)postTweet:(id)sender {
    [[APIManager shared] postStatusWithText:self.textViewLabel.text completion:^(Tweet *tweet, NSError *error) {
        if (tweet) {
            NSLog(@"Tweeted!");
            [self.delegate didTweet:tweet];
        } else {
            NSLog(@"Error posting tweet: %@", error.localizedDescription);
        }
        [self dismissViewControllerAnimated:true completion:nil];
    }];
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
