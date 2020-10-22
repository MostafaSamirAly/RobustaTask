//
//  MovieFetcher.h
//  Movies-ObjC
//
//  Created by Mostafa Samir on 10/21/20.
//  Copyright © 2020 Mostafa Samir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RepositoryModel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol RepositoryFetcherProtocol <NSObject>
- (void)fetchReposWithSuccess:(void (^)(NSArray<RepositoryModel *> *repos))successCompletion error:(void (^)(NSError *error))errorCompletion;
@end

NS_ASSUME_NONNULL_END
