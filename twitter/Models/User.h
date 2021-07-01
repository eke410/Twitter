//
//  User.h
//  twitter
//
//  Created by Elizabeth Ke on 6/28/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *screenName;
@property (nonatomic, strong) NSString *profileDescription;
@property (nonatomic, strong) NSString *profilePictureString;
@property (nonatomic, strong) NSString *backdropPictureString;
@property (nonatomic) int followingCount;
@property (nonatomic) int followersCount;
@property (nonatomic, strong) NSArray *tweets;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
