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
            NSPredicate *filter = [NSPredicate predicateWithFormat: @"type = 'image'"];
            NSArray *temp = [[NSArray alloc] initWithArray:[photos filteredArrayUsingPredicate: filter]];
            if (temp.count > 0) {
//                NSLog(@"first_photo.url is: %@", ((Photo *)photos[0]).hiResURL);
                self.photos = temp;
                callback();
            }
            else [self displayErrorMessage:@"No photos found."];
        } failure:^(RKObjectRequestOperation *operation, NSError *error) {
            NSLog(@"error occured: %@", error);
            [self displayErrorMessage:@"Error trying to load the photos."];
        }];
        
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"error occured: %@", error);
        [self displayErrorMessage:@"Error trying to find the user."];
    }];
}

- (void) makeCollage {
}

- (void) displayErrorMessage:(NSString *)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
