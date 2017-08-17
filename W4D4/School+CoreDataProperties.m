//
//  School+CoreDataProperties.m
//  W4D4
//
//  Created by Roland on 2017-08-16.
//  Copyright © 2017 MoozX Internet Ventures. All rights reserved.
//

#import "School+CoreDataProperties.h"

@implementation School (CoreDataProperties)

+ (NSFetchRequest<School *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"School"];
}

@dynamic name;
@dynamic student;

@end
