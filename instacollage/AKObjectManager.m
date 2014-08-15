//
//  AKObjectManager.m
//  instacollage
//
//  Created by Dmitry Stankul on 14/08/14.
//  Copyright (c) 2014 Dmitry Stankul. All rights reserved.
//

#import "AKObjectManager.h"
#import <RestKit.h>

@implementation AKObjectManager

+ (instancetype)sharedManager {
    NSURL *url = [NSURL URLWithString:BASE_URL];
    
    AKObjectManager *sharedManager  = [self managerWithBaseURL:url];
    sharedManager.requestSerializationMIMEType = RKMIMETypeJSON;
    
    [sharedManager setupRequestDescriptors];
    [sharedManager setupResponseDescriptors];
    
    // Set default client_id parameter somehow!
    
    return sharedManager;
}

- (void) setupRequestDescriptors {
    
}

- (void) setupResponseDescriptors {
    
}

@end
