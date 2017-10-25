//
//  Pet.m
//  w4d4-demo
//
//  Created by Roland on 2017-10-26.
//  Copyright © 2017 Roland Tecson. All rights reserved.
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
