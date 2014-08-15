//
//  MappingProvider.m
//  instacollage
//
//  Created by Dmitry Stankul on 14/08/14.
//  Copyright (c) 2014 Dmitry Stankul. All rights reserved.
//

#import "MappingProvider.h"
#import <RestKit/RestKit.h>
#import "User.h"
#import "Photo.h"

@implementation MappingProvider

+ (RKObjectMapping *)userMapping {
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[User class]];
    NSDictionary *mappingDictionary = @{@"username": @"name",
                                        @"id": @"userId"};
    [mapping addAttributeMappingsFromDictionary:mappingDictionary];
    
    return mapping;
}

+ (RKObjectMapping *)photoMapping {
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[Photo class]];
    NSDictionary *mappingDictionary = @{@"likes.count": @"likes",
                                        @"images.low_resolution.url": @"lowResURL",
                                        @"images.standard_resolution.url": @"hiResURL",
                                        @"type": @"type"};
    [mapping addAttributeMappingsFromDictionary:mappingDictionary];
    
    return mapping;
}

@end
