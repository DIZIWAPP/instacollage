//
//  UserManager.h
//  instacollage
//
//  Created by Dmitry Stankul on 15/08/14.
//  Copyright (c) 2014 Dmitry Stankul. All rights reserved.
//

#import "AKObjectManager.h"

@class User;

@interface UserManager : AKObjectManager

- (void) findUser:(NSString *)username success:(void (^)(User *user))success failure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure;

@end
