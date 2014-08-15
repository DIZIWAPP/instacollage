//
//  PhotoManager.m
//  instacollage
//
//  Created by Dmitry Stankul on 15/08/14.
//  Copyright (c) 2014 Dmitry Stankul. All rights reserved.
//

#import "PhotoManager.h"
#import <RestKit.h>
#import "MappingProvider.h"
#import "Photo.h"

@implementation PhotoManager

- (void) findPhotos:(NSString *)userId success:(void (^)(NSArray *photos))success failure:(void (^) (RKObjectRequestOperation *operation, NSError * error))failure {
    
    NSString *path = [NSString stringWithFormat:@"users/%@/media/recent", userId, nil];
    [self getObjectsAtPath:path parameters: @{@"client_id": CLIENT_ID} success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        if (success) {
            NSArray *photos = mappingResult.array;
            success(photos);
        }
    } failure:
     ^(RKObjectRequestOperation *operation, NSError *error) {
         if (failure) {
             failure(operation, error);
         }
     }];
}

- (void) setupResponseDescriptors {
    [super setupResponseDescriptors];
    
    RKResponseDescriptor *loadPhotosResponseDescriptors = [RKResponseDescriptor responseDescriptorWithMapping:[MappingProvider photoMapping] method:RKRequestMethodGET pathPattern:@"users/:id/media/recent" keyPath:@"data" statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [self addResponseDescriptor:loadPhotosResponseDescriptors];
}

@end
