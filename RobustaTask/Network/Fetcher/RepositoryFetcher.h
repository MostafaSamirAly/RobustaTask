//
//  MovieFetcherClass.h
//  Movies-ObjC
//
//  Created by Mostafa Samir on 10/21/20.
//  Copyright © 2020 Mostafa Samir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RepositoryFetcherProtocol.h"
#import "RepositoryParserProtocol.h"
#import "AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface RepositoryFetcher : NSObject<RepositoryFetcherProtocol>

@property (nonatomic, strong) id<RepositoryParserProtocol> parser;

- (instancetype)initWithParser:(id<RepositoryParserProtocol>)parser;
@end

NS_ASSUME_NONNULL_END
