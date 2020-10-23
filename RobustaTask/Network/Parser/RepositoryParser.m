//
//  MovieParserClass.m
//  Movies-ObjC
//
//  Created by Mostafa Samir on 10/21/20.
//  Copyright © 2020 Mostafa Samir. All rights reserved.
//

#import "RepositoryParser.h"

@implementation RepositoryParser

- (void)parseRepositories:(id)data withSuccess:(void (^)(NSArray<RepositoryModel *> *repos))successCompletion error:(void (^)(NSError *error))errorCompletion {
    
    NSArray *fetchedArr = data;
    NSMutableArray<RepositoryModel *> *repos = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < fetchedArr.count ; i++ ){
        RepositoryModel *repo = [[RepositoryModel alloc] init];
        NSDictionary *ownerDictionary = [fetchedArr objectAtIndex:i][@"owner"];
        OwnerModel *owner = [[OwnerModel alloc] init];
        repo.repoId = [fetchedArr objectAtIndex:i][@"id"];
        repo.repoDescription = [fetchedArr objectAtIndex:i][@"description"];
        repo.repoName = [fetchedArr objectAtIndex:i][@"full_name"];
        owner.imagePath = ownerDictionary[@"avatar_url"];
        owner.name = ownerDictionary[@"login"];
        owner.ownerId = ownerDictionary[@"id"];
        owner.url = ownerDictionary[@"html_url"];
        repo.repoOwner = owner;
        [repos addObject:repo];
    }
    successCompletion(repos);
}

@end
