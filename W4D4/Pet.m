//
//  Pet.m
//  W4D4
//
//  Created by Roland on 2017-08-16.
//  Copyright © 2017 MoozX Internet Ventures. All rights reserved.
//

#import "Pet.h"

@interface Pet () <NSCoding>

@end


@implementation Pet

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self != nil) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
}


@end
