//
//  PostController.m
//  RedditUnit3Test
//
//  Created by Nick Reichard on 5/31/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

#import "PostController.h"
#import "DVMPost.h"

static NSString * const baseURLString = @"https://www.reddit.com/r";

@implementation PostController

- (NSURL *)baseURL
{
    return [NSURL URLWithString:@"https://www.reddit.com/r"];
}

+ (instancetype) sharedController
{
    static PostController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[PostController alloc] init];
    });
    return sharedInstance;
}

- (void)searchForPostsWithSearchTerm:(NSString *)searchTerm completion:(void (^)(NSArray<DVMPost *> *posts, NSError *))completion
{
    NSURL *searchURL = [self baseURL];
    searchURL = [searchURL URLByAppendingPathComponent: searchTerm];
    searchURL = [searchURL URLByAppendingPathExtension:@"json"];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:searchURL completionHandler:^(NSData *data, NSURLResponse * response, NSError *error) {
        
        if (error) {
            NSLog(@"%@", error.localizedDescription);
            return completion(nil, [NSError errorWithDomain:@"error Fetching json" code:(NSInteger)-1 userInfo:nil]);
        }
        
        if (!data) {
            NSLog(@"Error: no data returned from task");
            return completion(nil, [NSError errorWithDomain:@"error Fetching Data" code:(NSInteger)-1 userInfo:nil]);
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]]) {
            NSDictionary *userInfo = nil;
            if (error) { userInfo = @{NSUnderlyingErrorKey : error}; }
            NSError *localError = [NSError errorWithDomain:@"com.DevMountain.RedditUnit3Test.ErrorDomain" code:-1 userInfo:userInfo];
            NSLog(@"%@", error.localizedDescription);
            return completion(nil, localError);
        }
        
        NSDictionary *postDataDictionaries = jsonDictionary[@"data"];
        NSArray *childrenArray = postDataDictionaries[@"children"];
        NSMutableArray *postsArray = [NSMutableArray array];
        
        for (NSDictionary *dataDictionary in childrenArray) {
            
            DVMPost *post = [[DVMPost alloc] initWithDictionary:dataDictionary];
            [postsArray addObject:post];
            
        }
        
        completion(postsArray, nil);
        
    }]resume];
}




@end
