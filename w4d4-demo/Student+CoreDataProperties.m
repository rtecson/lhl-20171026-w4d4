//
//  Student+CoreDataProperties.m
//  w4d4-demo
//
//  Created by Roland on 2017-10-26.
//  Copyright © 2017 Roland Tecson. All rights reserved.
//

#import "Student+CoreDataProperties.h"

@implementation Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Student"];
}

@dynamic name;
@dynamic school;

@end
