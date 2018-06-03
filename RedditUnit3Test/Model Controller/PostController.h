//
//  PostController.h
//  RedditUnit3Test
//
//  Created by Nick Reichard on 5/31/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DVMPost;

@interface PostController : NSObject
NS_ASSUME_NONNULL_BEGIN

+ (instancetype)sharedController;


- (void) searchForPostsWithSearchTerm:(NSString *)searchTerm completion:(void(^)(NSArray<DVMPost *> *posts, NSError *error))completion;

NS_ASSUME_NONNULL_END

@end
