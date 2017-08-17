//
//  Student+CoreDataProperties.m
//  W4D4
//
//  Created by Roland on 2017-08-16.
//  Copyright © 2017 MoozX Internet Ventures. All rights reserved.
//

#import "Student+CoreDataProperties.h"

@implementation Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Student"];
}

@dynamic name;
@dynamic school;

@end
