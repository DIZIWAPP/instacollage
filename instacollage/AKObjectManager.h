//
//  AKObjectManager.h
//  instacollage
//
//  Created by Dmitry Stankul on 14/08/14.
//  Copyright (c) 2014 Dmitry Stankul. All rights reserved.
//

#import "RKObjectManager.h"

@interface AKObjectManager : RKObjectManager

+ (instancetype) sharedManager;

- (void) setupRequestDescriptors;
- (void) setupResponseDescriptors;

@end
