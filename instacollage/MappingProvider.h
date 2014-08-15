//
//  MappingProvider.h
//  instacollage
//
//  Created by Dmitry Stankul on 14/08/14.
//  Copyright (c) 2014 Dmitry Stankul. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RKObjectMapping;

@interface MappingProvider : NSObject

+ (RKObjectMapping *) userMapping;
+ (RKObjectMapping *) photoMapping;

@end
