//
//  PhotoManager.h
//  instacollage
//
//  Created by Dmitry Stankul on 15/08/14.
//  Copyright (c) 2014 Dmitry Stankul. All rights reserved.
//

#import "AKObjectManager.h"

@class Photo;

@interface PhotoManager : AKObjectManager

- (void) findPhotos:(NSString *)userId success:(void (^)(NSArray *photos))success failure:(void (^) (RKObjectRequestOperation *operation, NSError * error))failure;

@end
