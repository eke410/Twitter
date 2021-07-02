# Project 3 - *Twitter*

**Twitter** is a basic twitter app to read and compose tweets the [Twitter API](https://apps.twitter.com/).

Time spent: **16** hours spent in total
## User Stories

The following **required** functionality is completed:

- [ ] User sees app icon in home screen and styled launch screen
- [ ] User can sign in using OAuth login flow
- [ ] User can Logout
- [ ] User can view last 20 tweets from their home timeline
- [ ] In the home timeline, user can view tweet with the user profile picture, username, tweet text, and timestamp.
- [ ] User can pull to refresh.
- [ ] User can tap the retweet and favorite buttons in a tweet cell to retweet and/or favorite a tweet.
- [ ] User can compose a new tweet by tapping on a compose button.
- [ ] Using AutoLayout, the Tweet cell should adjust its layout for iPhone 11, Pro and SE device sizes as well as accommodate device rotation.
- [ ] User should display the relative timestamp for each tweet "8m", "7h"
- [ ] Tweet Details Page: User can tap on a tweet to view it, with controls to retweet and favorite.

The following **optional** features are implemented:

- [ ] User can view their profile in a *profile tab*
  - Contains the user header view: picture and tagline
  - Contains a section with the users basic stats: # following, # followers
- [ ] Profile view should include that user's timeline
- [ ] User should be able to unretweet and unfavorite and should decrement the retweet and favorite count. 
- [ ] Links in tweets are clickable in details page.
- [ ] User can tap the profile image in any tweet on the home timeline to see another user's profile
  - Contains the user header view: picture and tagline
  - Contains a section with the users basic stats: # following, # followers
- [ ] After creating a new tweet, a user should be able to view it in the timeline immediately without refetching the timeline from the network.

The following **additional** features are implemented:

- [ ] None

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Better way to implement profile tab bar (mine was not ideal)
2. How to implement the tab selection bar that Twitter has on its profile pages. (their labels are Tweets, Tweets & replies, Media, Likes, etc.)

## Video Walkthrough

Here's a walkthrough of implemented user stories:

![](https://i.imgur.com/Mz2XClG.gif)
![](https://i.imgur.com/c3fQK8m.gif)
![](https://i.imgur.com/U1hBoDv.gif)
![](https://i.imgur.com/EdyLQK8.gif)
![](https://i.imgur.com/UBOV2G0.gif)

GIFs created with [ezgif](https://ezgif.com/video-to-gif).

## Notes

Describe any challenges encountered while building the app.

- understanding/using delegates and API calls at first
- writing new API requests
- incorporating outside libraries

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library
- BDBOAuth1Manager
- DateTools

## License

    Copyright 2021 Elizabeth Ke

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
