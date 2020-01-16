//
//  RestClient.h
//  EX1
//
//  Created by Study on 2020/01/15.
//  Copyright © 2020 Study. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RestClient : NSObject

- (void)get:(NSInteger) index with:(void(^)(NSArray *))callback;

-(void)post:(NSString *)title with:(NSString *)contents with:(NSString *)img;
@end

NS_ASSUME_NONNULL_END
