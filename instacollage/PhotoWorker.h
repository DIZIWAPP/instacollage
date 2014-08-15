//
//  PhotoWorker.h
//  instacollage
//
//  Created by Dmitry Stankul on 14/08/14.
//  Copyright (c) 2014 Dmitry Stankul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoWorker : NSObject

@property (nonatomic, strong) NSArray *photos;

- (void) loadPhotos:(NSString *)username success: (void (^)(void))callback;
- (void) makeCollage;
- (void) displayErrorMessage:(NSString*)message;

@end
