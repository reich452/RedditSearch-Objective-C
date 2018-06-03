//
//  Post.h
//  RedditUnit3Test
//
//  Created by Nick Reichard on 5/31/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DVMPost : NSObject

NS_ASSUME_NONNULL_BEGIN

@property (nonatomic, copy) NSString *title;
@property (nonatomic, readonly) NSNumber *commentCount;
@property (nonatomic, readonly) NSNumber *ups;

- (instancetype)initWithTitle:(NSString *)title commentCount:(NSNumber *)commentCount ups:(NSNumber *)ups;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

NS_ASSUME_NONNULL_END

@end
