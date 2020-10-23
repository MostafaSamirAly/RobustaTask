//
//  MovieParser.h
//  RobustaTask
//
//  Created by Mostafa Samir on 10/22/20.
//  Copyright © 2020 Mostafa Samir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RepositoryModel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol RepositoryParserProtocol <NSObject>
- (void)parseRepositories:(id)data withSuccess:(void (^)(NSArray<RepositoryModel *> *repos))successCompletion error:(void (^)(NSError *error))errorCompletion;
@end

NS_ASSUME_NONNULL_END
