//
//  Person.h
//  w4d4-demo
//
//  Created by Roland on 2017-10-26.
//  Copyright © 2017 Roland Tecson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pet.h"

@interface Person : NSObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSNumber *idNumber;
@property (nonatomic, strong) NSSet<Pet *> *pets;

@end
