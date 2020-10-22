//
//  RepositoryModel.h
//  RobustaTask
//
//  Created by Mostafa Samir on 10/22/20.
//  Copyright © 2020 Mostafa Samir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OwnerModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RepositoryModel : NSObject
@property NSNumber  *repoId;
@property NSString  *repoName;
@property NSString  *repoDescription;
@property OwnerModel *repoOwner;


@end

NS_ASSUME_NONNULL_END
