//
//  MovieFetcherClass.m
//  Movies-ObjC
//
//  Created by Mostafa Samir on 10/21/20.
//  Copyright © 2020 Mostafa Samir. All rights reserved.
//

#import "RepositoryFetcher.h"


@implementation RepositoryFetcher


- (instancetype)initWithParser:(id<RepositoryParserProtocol>)parser{
    self.parser = parser;
    return self;
}

- (void)fetchReposWithSuccess:(void (^)(NSArray<RepositoryModel *> *repos))successCompletion error:(void (^)(NSError *error))errorCompletion{
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

    NSURL *URL = [NSURL URLWithString:@"https://api.github.com/repositories"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];

    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:NULL downloadProgress:NULL completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {

        } else {
            [self.parser parseRepositories:responseObject withSuccess:successCompletion error:errorCompletion];
        }
    }];
    [dataTask resume];
    
}

@end
