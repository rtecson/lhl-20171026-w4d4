//
//  Person.m
//  w4d4-demo
//
//  Created by Roland on 2017-10-26.
//  Copyright © 2017 Roland Tecson. All rights reserved.
//

#import "Person.h"

@interface Person () <NSCoding>

@end

@implementation Person

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self != nil) {
        self.firstName = [aDecoder decodeObjectForKey:@"firstName"];
        self.lastName = [aDecoder decodeObjectForKey:@"lastName"];
        self.idNumber = [aDecoder decodeObjectForKey:@"idNumber"];
        self.pets = [aDecoder decodeObjectForKey:@"pets"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.firstName forKey:@"firstName"];
    [aCoder encodeObject:self.lastName forKey:@"lastName"];
    [aCoder encodeObject:self.idNumber forKey:@"idNumber"];
    [aCoder encodeObject:self.pets forKey:@"pets"];
}

@end

