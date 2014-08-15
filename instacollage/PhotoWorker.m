//
//  PhotoWorker.m
//  instacollage
//
//  Created by Dmitry Stankul on 14/08/14.
//  Copyright (c) 2014 Dmitry Stankul. All rights reserved.
//

#import "PhotoWorker.h"
#import "UserManager.h"
#import "PhotoManager.h"
#import "User.h"
#import "Photo.h"

@implementation PhotoWorker

- (void) loadPhotos:(NSString *)username success: (void (^)(void))callback {
    [[UserManager sharedManager] findUser:username success:^(User *user) {
        [[PhotoManager sharedManager] findPhotos:user.userId success:^(NSArray *photos) {
            NSLog(@"first_photo.url is: %@", ((Photo *)photos[0]).hiResURL);
            self.photos = photos;
            callback();
        } failure:^(RKObjectRequestOperation *operation, NSError *error) {
            NSLog(@"error occured: %@", error);
        }];
        
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"error occured: %@", error);
    }];
}

- (void) makeCollage {
}

@end
