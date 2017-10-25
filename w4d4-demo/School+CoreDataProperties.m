//
//  School+CoreDataProperties.m
//  w4d4-demo
//
//  Created by Roland on 2017-10-26.
//  Copyright © 2017 Roland Tecson. All rights reserved.
//

#import "School+CoreDataProperties.h"

@implementation School (CoreDataProperties)

+ (NSFetchRequest<School *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"School"];
}

@dynamic name;
@dynamic student;

@end
