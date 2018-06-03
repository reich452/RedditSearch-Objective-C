//
//  Post.m
//  RedditUnit3Test
//
//  Created by Nick Reichard on 5/31/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

#import "DVMPost.h"

@implementation DVMPost

- (instancetype)initWithTitle:(NSString *)title
                 commentCount:(NSNumber *)commentCount
                          ups:(NSNumber *)ups
{
    self = [super init];
    if (self)
    {
        _title = [title copy];
        _commentCount = commentCount;
        _ups = ups;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    
    NSDictionary *dataDictionary = dictionary[@"data"];
    
    for (NSDictionary *postData in dataDictionary) {
        NSLog(@"%@", postData);
        NSString *title = dataDictionary[[DVMPost titleKey]];
        NSNumber *commentCount = dataDictionary[[DVMPost commentCountKey]];
        NSNumber *ups = dataDictionary[[DVMPost upsKey]];
        
        return [self initWithTitle:title commentCount: commentCount ups: ups];
        
    }
    
    return nil;
    
}

// MARK: - Keys

+ (NSString *) titleKey
{
    return @"title";
}

+ (NSString *) commentCountKey
{
    return @"num_comments";
}

+ (NSString *) upsKey
{
    return @"ups";
}

@end
