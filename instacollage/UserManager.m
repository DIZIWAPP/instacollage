//
//  UserManager.m
//  instacollage
//
//  Created by Dmitry Stankul on 15/08/14.
//  Copyright (c) 2014 Dmitry Stankul. All rights reserved.
//

#import "UserManager.h"
#import <RestKit.h>
#import "MappingProvider.h"
#import "User.h"

@implementation UserManager

- (void) findUser:(NSString *)username success:(void (^)(User *))success failure:(void (^)(RKObjectRequestOperation *, NSError *))failure {
    [self getObjectsAtPath:@"users/search" parameters:@{@"q": username, @"count": @"1", @"client_id": CLIENT_ID} success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        if (success) {
            User *currentUser = (User *)[mappingResult.array firstObject];
            success(currentUser);
        }
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(operation, error);
        }
    }];
}

- (void) setupResponseDescriptors {
    [super setupResponseDescriptors];
    
    RKResponseDescriptor *findUserResponseDescriptors = [RKResponseDescriptor responseDescriptorWithMapping:[MappingProvider userMapping] method:RKRequestMethodGET pathPattern:@"users/search" keyPath:@"data" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [self addResponseDescriptor:findUserResponseDescriptors];
}

@end
