//
//  Student+CoreDataProperties.h
//  W4D4
//
//  Created by Roland on 2017-08-16.
//  Copyright © 2017 MoozX Internet Ventures. All rights reserved.
//

#import "Student+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) NSSet<School *> *school;

@end

@interface Student (CoreDataGeneratedAccessors)

- (void)addSchoolObject:(School *)value;
- (void)removeSchoolObject:(School *)value;
- (void)addSchool:(NSSet<School *> *)values;
- (void)removeSchool:(NSSet<School *> *)values;

@end

NS_ASSUME_NONNULL_END
