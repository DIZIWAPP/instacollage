//
//  Photo.h
//  instacollage
//
//  Created by Dmitry Stankul on 14/08/14.
//  Copyright (c) 2014 Dmitry Stankul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Photo : NSObject

@property (nonatomic, strong) NSNumber *likes;
@property (nonatomic, strong) NSString *lowResURL;
@property (nonatomic, strong) NSString *hiResURL;
@property (nonatomic, strong) NSString *type; // For filtering out videos.

@end
