//
//  Person.h
//  W4D4
//
//  Created by Roland on 2017-08-16.
//  Copyright © 2017 MoozX Internet Ventures. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pet.h"

@interface Person : NSObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSNumber *idNumber;
@property (nonatomic, strong) NSSet<Pet *> *pets;

@end
