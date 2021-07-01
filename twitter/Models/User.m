//
//  User.m
//  twitter
//
//  Created by Elizabeth Ke on 6/28/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        self.profilePicture = [dictionary[@"profile_image_url_https"] stringByReplacingOccurrencesOfString:@"_normal" withString:@""];
        // Initialize any other properties
    }
    return self;
}

@end
