# RedditSearch-Objective-C
# Instructions for Unit 5 Challenge

## Requirements

**Note**: You **may not** copy and paste code from previous projects.

You will have 3 hours and 30 minutes to complete this challenge.

The documentation for the API you should use can be found at https://www.reddit.com/dev/api/. The documentation for this API is a little harder to navigate than what you might be used to so be sure to spend a sufficient amount of time going over the documentation to make sure you find the correct URL to use and that you can get sample JSON. 

Note the following requirements:

1. Initial screen shows a table view with a search bar.
2. Entering a text in the search bar triggers a search for subreddits using The Reddit API.
3. If the API returns results for the search, they are shown in the table view.
4. The cell for a post includes the title of the subreddit.
5. The cell for a post includes the likes count.
6. The cell for a movie includes a comment count.
7. The view controller for the main screen (e.g. UITableViewController subclass) *must* be written in Swift.
8. Objective-C code that is used by Swift must be properly annotated for nullability, and generics.

### Black Diamonds
  - Add a poster image for the post to the table view cell.
  - Tapping on a post shows a detail view with more information.
  - Allow marking a post as a favorite.
  - Add a tab that shows all favorited posts.

## Covered Concepts

This challenge is intended to assess your ability to build applications using Objective-C instead of Swift. It covers the following Objective-C concepts, and builds upon concepts learned in previous units:

- Class declarations in Objective-C (@interface)
- Class definitions in Objective-C (@implementation)
- Use of the singleton/shared instance pattern in Objective-C
- @properties and their attributes
- Custom property setters
- Primitives vs. objects
- Instantiation of Objective-C objects
- Use of blocks
- Declaring and implementing initializers.
- Protocol conformance syntax
- Use of Objective-C Foundation classes including NSArray, NSString, NSDictionary, etc.
- Using Swift and Objective-C in the same project
- Use of a bridging header to allow Swift code to access Objective-C code
